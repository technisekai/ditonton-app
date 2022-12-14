import 'package:tv_series/tv_series.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  TvRepository,
  TvRemoteDataSource,
  TvLocalDataSource,
  TvDatabaseHelper,
  GetTvDetail,
  GetOnTheAirTv,
  GetPopularTv,
  GetTvRecommendations,
  GetTopRatedTv,
  GetWatchlistTv,
  GetWatchListTvStatus,
  SaveTvWatchlist,
  RemoveTvWatchlist,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}

class FakeOnTheAirTvEvent extends Fake implements TvEvent {}

class FakeOnTheAirTvState extends Fake implements TvState {}

class FakeOnTheAirTvBloc extends MockBloc<TvEvent, TvState>
    implements OnTheAirTvBloc {}

//Popular Tv
class FakePopularTvEvent extends Fake implements TvEvent {}

class FakePopularTvState extends Fake implements TvState {}

class FakePopularTvBloc extends MockBloc<TvEvent, TvState>
    implements PopularTvBloc {}

//Top rated Tv
class FakeTopRatedTvEvent extends Fake implements TvEvent {}

class FakeTopRatedTvState extends Fake implements TvState {}

class FakeTopRatedTvBloc extends MockBloc<TvEvent, TvState>
    implements TopRatedTvBloc {}

//Detail Tv
class FakeDetailTvEvent extends Fake implements TvEvent {}

class FakeDetailTvState extends Fake implements TvState {}

class FakeDetailTvBloc extends MockBloc<TvEvent, TvState>
    implements TvDetailBloc {}

//Recommendation Tv
class FakeRecommendationTvEvent extends Fake implements TvEvent {}

class FakeRecommendationTvState extends Fake implements TvState {}

class FakeRecommendationTvBloc extends MockBloc<TvEvent, TvState>
    implements RecommendationTvBloc {}

//Wachlist Tv
class FakeWatchlistTvEvent extends Fake implements TvEvent {}

class FakeWatchlistTvState extends Fake implements WatchlistTvState {}

class FakeWatchlistTvBloc extends MockBloc<TvEvent, WatchlistTvState>
    implements WatchlistTvBloc {}
