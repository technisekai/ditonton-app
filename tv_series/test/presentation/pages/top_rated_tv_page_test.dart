import 'package:tv_series/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/presentation/pages/top_rated_tv_page.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/tv_test_helper.dart';

void main() {
  late FakeTopRatedTvBloc fakeTopRatedTvBloc;

  setUp(() {
    fakeTopRatedTvBloc = FakeTopRatedTvBloc();
    registerFallbackValue(FakeTopRatedTvEvent());
    registerFallbackValue(FakeTopRatedTvState());
  });

  tearDown(() {
    fakeTopRatedTvBloc.close();
  });

  Widget _createTestableWidget(Widget body) {
    return BlocProvider<TopRatedTvBloc>(
      create: (_) => fakeTopRatedTvBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets('Should display circular progress indicator when loading',
      (WidgetTester tester) async {
    when(() => fakeTopRatedTvBloc.state).thenReturn(TopRatedTvLoading());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget(TopRatedTvPage()));
    await tester.pump();

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'Should display AppBar, ListView, TvCardList, and TopRatedTvPage when data fetched successfully',
      (WidgetTester tester) async {
    when(() => fakeTopRatedTvBloc.state)
        .thenReturn(TopRatedTvHasData(testTvList));
    await tester.pumpWidget(_createTestableWidget(TopRatedTvPage()));
    await tester.pump();

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(TvCard), findsOneWidget);
  });
}
