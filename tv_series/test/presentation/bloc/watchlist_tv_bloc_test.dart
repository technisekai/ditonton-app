import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/tv_test_helper.mocks.dart';

void main() {
  late WatchlistTvBloc watchlistTvBloc;
  late MockGetWatchlistTv mockGetWatchlistTv;
  late MockGetWatchListTvStatus mockGetWatchlistTvStatus;
  late MockSaveTvWatchlist mockSaveTvWatchlist;
  late MockRemoveTvWatchlist mockRemoveTvWatchlist;

  setUp(() {
    mockGetWatchlistTv = MockGetWatchlistTv();
    mockGetWatchlistTvStatus = MockGetWatchListTvStatus();
    mockSaveTvWatchlist = MockSaveTvWatchlist();
    mockRemoveTvWatchlist = MockRemoveTvWatchlist();
    watchlistTvBloc = WatchlistTvBloc(
        getWatchlistTv: mockGetWatchlistTv,
        getWatchlistTvStatus: mockGetWatchlistTvStatus,
        removeTvWatchlist: mockRemoveTvWatchlist,
        saveTvWatchlist: mockSaveTvWatchlist);
  });
  test('WatchlistTvBloc initial state should be empty ', () {
    expect(watchlistTvBloc.state, WatchlistTvEmpty());
  });

  group('Get watchlist TV series test', () {
    blocTest<WatchlistTvBloc, WatchlistTvState>(
      'should emits [Loading, HasList] when watchlist TV series list data is successfully fetched',
      build: () {
        when(mockGetWatchlistTv.execute())
            .thenAnswer((_) async => Right([testWatchlistTv]));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(WatchlistTvList()),
      expect: () => [
        WatchlistTvLoading(),
        WatchlistTvHasList([testWatchlistTv]),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTv.execute());
        return WatchlistTvList().props;
      },
    );

    blocTest<WatchlistTvBloc, WatchlistTvState>(
      'should emits [Loading, Error] when watchlist TV series list data is failed to fetch',
      build: () {
        when(mockGetWatchlistTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(WatchlistTvList()),
      expect: () => <WatchlistTvState>[
        WatchlistTvLoading(),
        const WatchlistTvError('Server Failure'),
      ],
      verify: (bloc) => WatchlistTvLoading(),
    );
  });

  group('Get watchlist status TV series test', () {
    blocTest<WatchlistTvBloc, WatchlistTvState>(
      'should be return true when the TV series watchlist is also true',
      build: () {
        when(mockGetWatchlistTvStatus.execute(testTvDetail.id))
            .thenAnswer((_) async => true);
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(WatchlistStatusTv(testTvDetail.id)),
      expect: () => [WatchlistTvLoading(), const WatchlistTvHasStatus(true)],
      verify: (bloc) {
        verify(mockGetWatchlistTvStatus.execute(testTvDetail.id));
        return WatchlistStatusTv(testTvDetail.id).props;
      },
    );

    blocTest<WatchlistTvBloc, WatchlistTvState>(
        'should be return false when the TV series watchlist is also false',
        build: () {
          when(mockGetWatchlistTvStatus.execute(testTvDetail.id))
              .thenAnswer((_) async => false);
          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(WatchlistStatusTv(testTvDetail.id)),
        expect: () => <WatchlistTvState>[
              WatchlistTvLoading(),
              const WatchlistTvHasStatus(false),
            ],
        verify: (bloc) {
          verify(mockGetWatchlistTvStatus.execute(testTvDetail.id));
          return WatchlistStatusTv(testTvDetail.id).props;
        });
  });

  group('Add watchlist TV series test', () {
    blocTest<WatchlistTvBloc, WatchlistTvState>(
      'should update watchlist status when add movie to watchlist is successfully',
      build: () {
        when(mockSaveTvWatchlist.execute(testTvDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(AddWatchlistTv(testTvDetail)),
      expect: () => [
        const WatchlistTvHasMessage('Added to Watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveTvWatchlist.execute(testTvDetail));
        return AddWatchlistTv(testTvDetail).props;
      },
    );

    blocTest<WatchlistTvBloc, WatchlistTvState>(
      'should throw failure message status when failed to add TV series to watchlist',
      build: () {
        when(mockSaveTvWatchlist.execute(testTvDetail)).thenAnswer(
            (_) async => Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(AddWatchlistTv(testTvDetail)),
      expect: () => [
        const WatchlistTvError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveTvWatchlist.execute(testTvDetail));
        return AddWatchlistTv(testTvDetail).props;
      },
    );
  });

  group('Remove watchlist TV series test', () {
    blocTest<WatchlistTvBloc, WatchlistTvState>(
      'should update watchlist status when remove TV series from watchlist is successfully',
      build: () {
        when(mockRemoveTvWatchlist.execute(testTvDetail))
            .thenAnswer((_) async => const Right('Removed from Watchlist'));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(RemoveWatchlistTv(testTvDetail)),
      expect: () => [
        const WatchlistTvHasMessage('Removed from Watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveTvWatchlist.execute(testTvDetail));
        return RemoveWatchlistTv(testTvDetail).props;
      },
    );

    blocTest<WatchlistTvBloc, WatchlistTvState>(
      'should throw failure message status when failed to remove TV series from watchlist',
      build: () {
        when(mockRemoveTvWatchlist.execute(testTvDetail)).thenAnswer(
            (_) async => Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(RemoveWatchlistTv(testTvDetail)),
      expect: () => [
        const WatchlistTvError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveTvWatchlist.execute(testTvDetail));
        return RemoveWatchlistTv(testTvDetail).props;
      },
    );
  });
}
