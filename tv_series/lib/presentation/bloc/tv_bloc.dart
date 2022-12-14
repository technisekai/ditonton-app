import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_event.dart';
part 'tv_state.dart';

//Now playing TV series
class OnTheAirTvBloc extends Bloc<TvEvent, TvState> {
  final GetOnTheAirTv _getOnTheAirTv;

  OnTheAirTvBloc(this._getOnTheAirTv) : super(OnTheAirTvEmpty()) {
    on<OnTheAirTv>((event, emit) async {
      emit(OnTheAirTvLoading());
      final result = await _getOnTheAirTv.execute();

      result.fold((failure) => emit(OnTheAirTvError(failure.message)),
          (result) => emit(OnTheAirTvHasData(result)));
    });
  }
}

//Popular TV series
class PopularTvBloc extends Bloc<TvEvent, TvState> {
  final GetPopularTv _getPopularTv;

  PopularTvBloc(this._getPopularTv) : super(PopularTvEmpty()) {
    on<PopularTv>((event, emit) async {
      emit(PopularTvLoading());
      final result = await _getPopularTv.execute();

      result.fold((failure) => emit(PopularTvError(failure.message)),
          (result) => emit(PopularTvHasData(result)));
    });
  }
}

//Top rated TV series
class TopRatedTvBloc extends Bloc<TvEvent, TvState> {
  final GetTopRatedTv _getTopRatedTv;

  TopRatedTvBloc(this._getTopRatedTv) : super(TopRatedTvEmpty()) {
    on<TopRatedTv>((event, emit) async {
      emit(TopRatedTvLoading());
      final result = await _getTopRatedTv.execute();

      result.fold((failure) => emit(TopRatedTvError(failure.message)),
          (result) => emit(TopRatedTvHasData(result)));
    });
  }
}

//Detail TV series
class TvDetailBloc extends Bloc<TvEvent, TvState> {
  final GetTvDetail _getTvDetail;

  TvDetailBloc(this._getTvDetail) : super(TvDetailEmpty()) {
    on<DetailTv>((event, emit) async {
      final id = event.id;

      emit(TvDetailLoading());
      final result = await _getTvDetail.execute(id);

      result.fold((failure) => emit(TvDetailError(failure.message)),
          (result) => emit(TvDetailHasData(result)));
    });
  }
}

//Watchlist TV series
class WatchlistTvBloc extends Bloc<TvEvent, WatchlistTvState> {
  final GetWatchlistTv getWatchlistTv;
  final GetWatchListTvStatus getWatchlistTvStatus;
  final RemoveTvWatchlist removeTvWatchlist;
  final SaveTvWatchlist saveTvWatchlist;

  WatchlistTvBloc({
    required this.getWatchlistTv,
    required this.getWatchlistTvStatus,
    required this.removeTvWatchlist,
    required this.saveTvWatchlist,
  }) : super(WatchlistTvEmpty()) {
    on<WatchlistTvList>((event, emit) async {
      emit(WatchlistTvLoading());

      final result = await getWatchlistTv.execute();

      result.fold((failure) {
        emit(WatchlistTvError(failure.message));
      }, (data) {
        emit(WatchlistTvHasList(data));
      });
    });

    on<WatchlistStatusTv>((event, emit) async {
      emit(WatchlistTvLoading());
      final result = await getWatchlistTvStatus.execute(event.id);

      emit(WatchlistTvHasStatus(result));
    });

    on<AddWatchlistTv>((event, emit) async {
      final tv = event.tvDetail;
      final result = await saveTvWatchlist.execute(tv);

      result.fold((failure) {
        emit(WatchlistTvError(failure.message));
      }, (message) {
        emit(WatchlistTvHasMessage(message));
      });
    });

    on<RemoveWatchlistTv>((event, emit) async {
      final tv = event.tvDetail;

      final result = await removeTvWatchlist.execute(tv);

      result.fold((failure) {
        emit(WatchlistTvError(failure.message));
      }, (message) {
        emit(WatchlistTvHasMessage(message));
      });
    });
  }
}

//Recommendation TV series
class RecommendationTvBloc extends Bloc<TvEvent, TvState> {
  final GetTvRecommendations _getTvRecommendations;

  RecommendationTvBloc(this._getTvRecommendations) : super(TvRecomEmpty()) {
    on<RecommendationTv>((event, emit) async {
      final id = event.id;

      emit(TvRecomLoading());

      final result = await _getTvRecommendations.execute(id);

      result.fold((failure) {
        emit(TvRecomError(failure.message));
      }, (data) {
        emit(TvRecomHasData(data));
      });
    });
  }
}
