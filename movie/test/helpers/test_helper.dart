import 'package:movie/movie.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
  GetMovieDetail,
  GetNowPlayingMovies,
  GetPopularMovies,
  GetMovieRecommendations,
  GetTopRatedMovies,
  GetWatchlistMovies,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}

//Now playing movie
class FakeNowPlayingMovieEvent extends Fake implements MovieEvent {}

class FakeNowPlayingMovieState extends Fake implements MovieState {}

class FakeNowPlayingMovieBloc extends MockBloc<MovieEvent, MovieState>
    implements NowPlayingMovieBloc {}

//Popular movie
class FakePopularMovieEvent extends Fake implements MovieEvent {}

class FakePopularMovieState extends Fake implements MovieState {}

class FakePopularMovieBloc extends MockBloc<MovieEvent, MovieState>
    implements PopularMovieBloc {}

//Top rated movie
class FakeTopRatedMovieEvent extends Fake implements MovieEvent {}

class FakeTopRatedMovieState extends Fake implements MovieState {}

class FakeTopRatedMovieBloc extends MockBloc<MovieEvent, MovieState>
    implements TopRatedMovieBloc {}

//Detail movie
class FakeDetailMovieEvent extends Fake implements MovieEvent {}

class FakeDetailMovieState extends Fake implements MovieState {}

class FakeDetailMovieBloc extends MockBloc<MovieEvent, MovieState>
    implements DetailMovieBloc {}

//Recommendation movie
class FakeRecommendationMovieEvent extends Fake implements MovieEvent {}

class FakeRecommendationMovieState extends Fake implements MovieState {}

class FakeRecommendationMovieBloc extends MockBloc<MovieEvent, MovieState>
    implements RecommendationMovieBloc {}

//Wachlist movie
class FakeWatchlistMovieEvent extends Fake implements MovieEvent {}

class FakeWatchlistMovieState extends Fake implements WatchlistMovieState {}

class FakeWatchlistMovieBloc extends MockBloc<MovieEvent, WatchlistMovieState>
    implements WatchlistMovieBloc {}
