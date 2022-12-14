import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:search/search.dart';
import 'package:tv_series/tv_series.dart';

import '../../helpers/test_helper.dart';

void main() {
  late FaketTvSearchBloc faketTvSearchBloc;

  setUp(() {
    faketTvSearchBloc = FaketTvSearchBloc();
    registerFallbackValue(FakeTvSearchEvent());
    registerFallbackValue(FakeTvSearchState());
  });

  tearDown(() {
    faketTvSearchBloc.close();
  });

  final tvTest = Tv(
      backdropPath: '/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg',
      genreIds: const [18, 9648],
      id: 31917,
      originalName: 'Pretty Little Liars',
      overview:
          // ignore: unnecessary_string_escapes
          'Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.',
      popularity: 47.432451,
      posterPath: '/vC324sdfcS313vh9QXwijLIHPJp.jpg',
      firstAirDate: '2010-06-08',
      name: 'Pretty Little Liars',
      voteAverage: 5.04,
      voteCount: 133);

  final tvTestList = [tvTest];

  Widget _createTestableWidget(Widget body) {
    return BlocProvider<TvSearchBloc>(
      create: (_) => faketTvSearchBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets('Should display circular progress indicator when loading',
      (WidgetTester tester) async {
    when(() => faketTvSearchBloc.state).thenReturn(SearchLoading());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget(TvSearchPage()));
    await tester.pump();

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
    'should display AppBar, ListView, MovieCard, and SearchTvPage when data is fetched successfully',
    (WidgetTester tester) async {
      when(() => faketTvSearchBloc.state)
          .thenReturn(SearchHasTvData(tvTestList));
      await tester.pumpWidget(_createTestableWidget(TvSearchPage()));
      await tester.pump();

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(TvCard), findsOneWidget);
    },
  );
}
