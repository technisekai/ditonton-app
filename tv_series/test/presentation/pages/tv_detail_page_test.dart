import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/presentation/pages/tv_detail_page.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/tv_test_helper.dart';

void main() {
  late FakeDetailTvBloc fakeDetailTvBloc;
  late FakeRecommendationTvBloc fakeRecommendationTvBloc;
  late FakeWatchlistTvBloc fakeWatchlistTvBloc;

  setUp(() {
    fakeDetailTvBloc = FakeDetailTvBloc();
    registerFallbackValue(FakeDetailTvEvent());
    registerFallbackValue(FakeDetailTvState());
    fakeRecommendationTvBloc = FakeRecommendationTvBloc();
    registerFallbackValue(FakeRecommendationTvEvent());
    registerFallbackValue(FakeRecommendationTvState());
    fakeWatchlistTvBloc = FakeWatchlistTvBloc();
    registerFallbackValue(FakeWatchlistTvEvent());
    registerFallbackValue(FakeWatchlistTvState());
  });

  tearDown(() {
    fakeDetailTvBloc.close();
    fakeRecommendationTvBloc.close();
    fakeWatchlistTvBloc.close();
  });

  Widget _createTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvDetailBloc>(
          create: (context) => fakeDetailTvBloc,
        ),
        BlocProvider<RecommendationTvBloc>(
          create: (context) => fakeRecommendationTvBloc,
        ),
        BlocProvider<WatchlistTvBloc>(
          create: (context) => fakeWatchlistTvBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  const idTest = 1;

  testWidgets('Should display circular progress indicator when loading',
      (WidgetTester tester) async {
    when(() => fakeDetailTvBloc.state).thenReturn(TvDetailLoading());
    when(() => fakeRecommendationTvBloc.state).thenReturn(TvRecomLoading());
    when(() => fakeWatchlistTvBloc.state).thenReturn(WatchlistTvLoading());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget(TvDetailPage(
      id: idTest,
    )));
    await tester.pump();

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets('Should widget display which all required',
      (WidgetTester tester) async {
    when(() => fakeDetailTvBloc.state)
        .thenReturn(TvDetailHasData(testTvDetail));
    when(() => fakeRecommendationTvBloc.state)
        .thenReturn(TvRecomHasData(testTvList));
    when(() => fakeWatchlistTvBloc.state)
        .thenReturn(WatchlistTvHasList(testTvList));
    await tester.pumpWidget(_createTestableWidget(TvDetailPage(id: idTest)));
    await tester.pump();

    expect(find.text('Watchlist'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Recommendations'), findsOneWidget);
  });
}
