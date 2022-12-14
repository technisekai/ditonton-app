// Mocks generated by Mockito 5.3.2 from annotations
// in search/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:core/core.dart' as _i7;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie/movie.dart' as _i2;
import 'package:search/domain/usecase/search_movies.dart' as _i5;
import 'package:search/domain/usecase/search_tv.dart' as _i8;
import 'package:tv_series/tv_series.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMovieRepository_0 extends _i1.SmartFake
    implements _i2.MovieRepository {
  _FakeMovieRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvRepository_2 extends _i1.SmartFake implements _i4.TvRepository {
  _FakeTvRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SearchMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchMovies extends _i1.Mock implements _i5.SearchMovies {
  MockSearchMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.MovieRepository);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> execute(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
            _FakeEither_1<_i7.Failure, List<_i2.Movie>>(
          this,
          Invocation.method(
            #execute,
            [query],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
}

/// A class which mocks [SearchTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchTv extends _i1.Mock implements _i8.SearchTv {
  MockSearchTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvRepository);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>> execute(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>.value(
            _FakeEither_1<_i7.Failure, List<_i4.Tv>>(
          this,
          Invocation.method(
            #execute,
            [query],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>);
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i2.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
            _FakeEither_1<_i7.Failure, List<_i2.Movie>>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
            _FakeEither_1<_i7.Failure, List<_i2.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
            _FakeEither_1<_i7.Failure, List<_i2.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, _i2.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, _i2.MovieDetail>>.value(
            _FakeEither_1<_i7.Failure, _i2.MovieDetail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, _i2.MovieDetail>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
            _FakeEither_1<_i7.Failure, List<_i2.Movie>>(
          this,
          Invocation.method(
            #getMovieRecommendations,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
            _FakeEither_1<_i7.Failure, List<_i2.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, String>> saveWatchlist(
          _i2.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, String>>.value(
            _FakeEither_1<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [movie],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, String>> removeWatchlist(
          _i2.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, String>>.value(
            _FakeEither_1<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [movie],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
            _FakeEither_1<_i7.Failure, List<_i2.Movie>>(
          this,
          Invocation.method(
            #getWatchlistMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock implements _i4.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>> getOnTheAirTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOnTheAirTv,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>.value(
            _FakeEither_1<_i7.Failure, List<_i4.Tv>>(
          this,
          Invocation.method(
            #getOnTheAirTv,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>> getPopularTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTv,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>.value(
            _FakeEither_1<_i7.Failure, List<_i4.Tv>>(
          this,
          Invocation.method(
            #getPopularTv,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>> getTopRatedTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTv,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>.value(
            _FakeEither_1<_i7.Failure, List<_i4.Tv>>(
          this,
          Invocation.method(
            #getTopRatedTv,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, _i4.TvDetail>> getTvDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, _i4.TvDetail>>.value(
            _FakeEither_1<_i7.Failure, _i4.TvDetail>(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, _i4.TvDetail>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>> getTvRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecommendations,
          [id],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>.value(
            _FakeEither_1<_i7.Failure, List<_i4.Tv>>(
          this,
          Invocation.method(
            #getTvRecommendations,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>> searchTv(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTv,
          [query],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>.value(
            _FakeEither_1<_i7.Failure, List<_i4.Tv>>(
          this,
          Invocation.method(
            #searchTv,
            [query],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, String>> saveWatchlist(
          _i4.TvDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, String>>.value(
            _FakeEither_1<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [movie],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, String>> removeWatchlist(
          _i4.TvDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, String>>.value(
            _FakeEither_1<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [movie],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>> getWatchlistTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>.value(
            _FakeEither_1<_i7.Failure, List<_i4.Tv>>(
          this,
          Invocation.method(
            #getWatchlistTv,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tv>>>);
}
