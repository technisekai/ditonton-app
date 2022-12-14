import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:movie/movie.dart';
import 'package:search/search.dart';
import 'package:tv_series/tv_series.dart';

@GenerateMocks([
  SearchMovies,
  SearchTv,
  MovieRepository,
  TvRepository,
])
void main() {}

// Movie search
class FakeMovieSearchEvent extends Fake implements SearchEvent {}

class FakeMovieSearchState extends Fake implements SearchState {}

class FakeMovieSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements MovieSearchBloc {}

// Tv search
class FakeTvSearchEvent extends Fake implements SearchEvent {}

class FakeTvSearchState extends Fake implements SearchState {}

class FaketTvSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements TvSearchBloc {}
