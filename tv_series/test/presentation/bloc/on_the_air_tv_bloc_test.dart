import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/tv_test_helper.mocks.dart';

void main() {
  late OnTheAirTvBloc nowPlayingTvBloc;
  late MockGetOnTheAirTv mockGetOnTheAirTv;

  setUp(() {
    mockGetOnTheAirTv = MockGetOnTheAirTv();
    nowPlayingTvBloc = OnTheAirTvBloc(mockGetOnTheAirTv);
  });

  test('OnTheAirTvBloc initial state should be empty ', () {
    expect(nowPlayingTvBloc.state, OnTheAirTvEmpty());
  });

  group('Now playing TV series test', () {
    blocTest<OnTheAirTvBloc, TvState>(
        'should emits [Loading, HasData] when data is successfully fetched.',
        build: () {
          when(mockGetOnTheAirTv.execute())
              .thenAnswer((_) async => Right(testTvList));
          return nowPlayingTvBloc;
        },
        act: (bloc) => bloc.add(OnTheAirTv()),
        expect: () => <TvState>[
              OnTheAirTvLoading(),
              OnTheAirTvHasData(testTvList),
            ],
        verify: (bloc) {
          verify(mockGetOnTheAirTv.execute());
          return OnTheAirTv().props;
        });

    blocTest<OnTheAirTvBloc, TvState>(
      'should emits [Loading, Error] when now playing TV series data is failed to fetch',
      build: () {
        when(mockGetOnTheAirTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return nowPlayingTvBloc;
      },
      act: (bloc) => bloc.add(OnTheAirTv()),
      expect: () => <TvState>[
        OnTheAirTvLoading(),
        const OnTheAirTvError('Server Failure'),
      ],
      verify: (bloc) => OnTheAirTvLoading(),
    );
  });
}
