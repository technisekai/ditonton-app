import 'package:tv_series/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/presentation/pages/watchlist_tv_page.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/tv_test_helper.dart';

void main() {
  late FakeWatchlistTvBloc fakeWatchlistTvBloc;

  setUp(() {
    fakeWatchlistTvBloc = FakeWatchlistTvBloc();
    registerFallbackValue(FakeWatchlistTvEvent());
    registerFallbackValue(FakeWatchlistTvState());
  });

  tearDown(() {
    fakeWatchlistTvBloc.close();
  });
  Widget _createTestableWidget(Widget body) {
    return BlocProvider<WatchlistTvBloc>(
      create: (_) => fakeWatchlistTvBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets('Should display circular progress indicator when loading',
      (WidgetTester tester) async {
    when(() => fakeWatchlistTvBloc.state).thenReturn(WatchlistTvLoading());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget(WatchlistTvPage()));
    await tester.pump();

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'Should display AppBar, ListView, TvCardList, and WatchlistTvPage when data is fetched successfully',
      (WidgetTester tester) async {
    when(() => fakeWatchlistTvBloc.state)
        .thenReturn(WatchlistTvHasList(testTvList));
    await tester.pumpWidget(_createTestableWidget(WatchlistTvPage()));
    await tester.pump();

    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(TvCard), findsOneWidget);
  });

  testWidgets('Should display text with message when error',
      (WidgetTester tester) async {
    const errorMessage = 'error message';

    when(() => fakeWatchlistTvBloc.state)
        .thenReturn(const WatchlistTvError(errorMessage));

    final textMessageKeyFinder = find.byKey(const Key('error_message'));
    await tester.pumpWidget(_createTestableWidget(WatchlistTvPage()));
    await tester.pump();

    expect(textMessageKeyFinder, findsOneWidget);
  });
}
