import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/tv_test_helper.mocks.dart';

void main() {
  late TvDetailBloc detailTvBloc;
  late MockGetTvDetail mockGetTvDetail;

  setUp(() {
    mockGetTvDetail = MockGetTvDetail();
    detailTvBloc = TvDetailBloc(mockGetTvDetail);
  });

  const idTest = 1;
  test("DetailMovieBloc initial state should be empty", () {
    expect(detailTvBloc.state, TvDetailEmpty());
  });

  group('Detail movie test', () {
    blocTest<TvDetailBloc, TvState>(
      'Should emit [Loading, HasData] when TV series detail data is fetched successfully',
      build: () {
        when(mockGetTvDetail.execute(idTest))
            .thenAnswer((_) async => Right(testTvDetail));
        return detailTvBloc;
      },
      act: (bloc) => bloc.add(DetailTv(idTest)),
      expect: () => [TvDetailLoading(), TvDetailHasData(testTvDetail)],
      verify: (bloc) {
        verify(mockGetTvDetail.execute(idTest));
      },
    );

    blocTest<TvDetailBloc, TvState>(
      'Should emit [Loading, Error] when detail movie data is failed to fetch',
      build: () {
        when(mockGetTvDetail.execute(idTest))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return detailTvBloc;
      },
      act: (bloc) => bloc.add(DetailTv(idTest)),
      expect: () => [TvDetailLoading(), const TvDetailError('Server Failure')],
      verify: (bloc) {
        verify(mockGetTvDetail.execute(idTest));
      },
    );
  });
}
