import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/tv_series.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/tv_test_helper.dart';

void main() {
  late FakeOnTheAirTvBloc fakeOnTheAirTvBloc;
  late FakePopularTvBloc fakePopularTvBloc;
  late FakeTopRatedTvBloc fakeTopRatedTvBloc;

  setUp(() {
    fakeOnTheAirTvBloc = FakeOnTheAirTvBloc();
    registerFallbackValue(FakeOnTheAirTvEvent());
    registerFallbackValue(FakeOnTheAirTvState());
    fakePopularTvBloc = FakePopularTvBloc();
    registerFallbackValue(FakePopularTvEvent());
    registerFallbackValue(FakePopularTvState());
    fakeTopRatedTvBloc = FakeTopRatedTvBloc();
    registerFallbackValue(FakeTopRatedTvEvent());
    registerFallbackValue(FakeTopRatedTvState());
  });

  tearDown(() {
    fakeOnTheAirTvBloc.close();
    fakePopularTvBloc.close();
    fakeTopRatedTvBloc.close();
  });

  Widget _createTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnTheAirTvBloc>(
          create: (context) => fakeOnTheAirTvBloc,
        ),
        BlocProvider<PopularTvBloc>(
          create: (context) => fakePopularTvBloc,
        ),
        BlocProvider<TopRatedTvBloc>(
          create: (context) => fakeTopRatedTvBloc,
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets(
      'page should display listview of [Now Playing Movie, Popular Movie, Top Rated Movie] when HasData state is happen',
      (WidgetTester tester) async {
    when(() => fakeOnTheAirTvBloc.state)
        .thenReturn(OnTheAirTvHasData(testTvList));
    when(() => fakePopularTvBloc.state)
        .thenReturn(PopularTvHasData(testTvList));
    when(() => fakeTopRatedTvBloc.state)
        .thenReturn(TopRatedTvHasData(testTvList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_createTestableWidget(HomeTvPage()));

    expect(listViewFinder, findsWidgets);
  });
}
