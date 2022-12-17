import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.dart';

void main() {
  late FakeWatchlistMovieBloc fakeWatchlistMovieBloc;

  setUp(() {
    fakeWatchlistMovieBloc = FakeWatchlistMovieBloc();
    registerFallbackValue(FakeWatchlistMovieEvent());
    registerFallbackValue(FakeRecommendationMovieState());
  });

  tearDown(() {
    fakeWatchlistMovieBloc.close();
  });

  Widget _createTestableWidget(Widget body) {
    return BlocProvider<WatchlistMovieBloc>(
      create: (_) => fakeWatchlistMovieBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets('Should display circular progress indicator when loading',
      (WidgetTester tester) async {
    when(() => fakeWatchlistMovieBloc.state)
        .thenReturn(WatchlistMovieLoading());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget(WatchlistMoviesPage()));
    await tester.pump();

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'Should display AppBar, ListView, MovieCard, and WatchlistMoviesPage when data is fetched successfully',
      (WidgetTester tester) async {
    when(() => fakeWatchlistMovieBloc.state)
        .thenReturn(WatchlistMovieHasList(testMovieList));
    await tester.pumpWidget(_createTestableWidget(WatchlistMoviesPage()));
    await tester.pump();

    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(MovieCard), findsOneWidget);
  });

  testWidgets('Should display text with message when error',
      (WidgetTester tester) async {
    const errorMessage = 'error message';

    when(() => fakeWatchlistMovieBloc.state)
        .thenReturn(const WatchlistMovieError(errorMessage));

    final textMessageKeyFinder = find.byKey(const Key('error_message'));
    await tester.pumpWidget(_createTestableWidget(WatchlistMoviesPage()));
    await tester.pump();

    expect(textMessageKeyFinder, findsOneWidget);
  });
}
