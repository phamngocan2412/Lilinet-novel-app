import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/usecases/get_trending_movies.dart';
import '../../../domain/usecases/get_cached_trending_movies.dart';
import '../../../../explore/domain/usecases/get_movies_by_genre.dart';
import '../../../../movies/domain/entities/movie.dart';
import 'trending_movies_event.dart';
import 'trending_movies_state.dart';

@lazySingleton
class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies _getTrendingMovies;
  final GetCachedTrendingMovies _getCachedTrendingMovies;
  final GetMoviesByGenre _getMoviesByGenre;

  TrendingMoviesBloc(
    this._getTrendingMovies,
    this._getCachedTrendingMovies,
    this._getMoviesByGenre,
  ) : super(const TrendingMoviesState.initial()) {
    on<LoadTrendingMovies>(_onLoad);
    on<RefreshTrendingMovies>(_onRefresh);
  }

  Future<void> _onLoad(
    LoadTrendingMovies event,
    Emitter<TrendingMoviesState> emit,
  ) async {
    emit(const TrendingMoviesState.loading());

    // 1. Try Cache First (Sync if possible, but UseCases are usually async or sync)
    // GetCachedTrendingMovies is synchronous in previous implementation?
    // Let's check. Yes, it returns List<Movie>?.
    try {
      final cached = _getCachedTrendingMovies();
      if (cached != null && cached.isNotEmpty) {
        emit(TrendingMoviesState.loaded(trending: cached));
      }
    } catch (_) {
      // Ignore cache errors
    }

    // 2. Fetch All Data in Parallel with explicit generic type
    final results = await Future.wait<Either<Failure, List<Movie>>>([
      _getTrendingMovies(TrendingParams(type: event.type, page: 1)),
      _getMoviesByGenre(genreId: '16', page: 1), // Index 1: Anime
      _getMoviesByGenre(genreId: '28', page: 1), // Index 2: Action
      _getMoviesByGenre(genreId: '27', page: 1), // Index 3: Horror
      _getMoviesByGenre(genreId: '10749', page: 1), // Index 4: Romance
    ]);

    final trendingResult = results[0];
    final animeResult = results[1];
    final actionResult = results[2];
    final horrorResult = results[3];
    final romanceResult = results[4];

    List<Movie> trendingMovies = [];
    Map<String, List<Movie>> categories = {};

    // Process Trending - type-safe fold
    trendingResult.fold(
      (failure) {}, // Ignore trending failure, will handle below
      (movies) => trendingMovies = movies,
    );

    // Process Categories - type-safe fold
    animeResult.fold(
      (_) {}, // Ignore failure
      (movies) => categories['Top Anime'] = movies,
    );
    actionResult.fold((_) {}, (movies) => categories['Action Movies'] = movies);
    horrorResult.fold((_) {}, (movies) => categories['Horror'] = movies);
    romanceResult.fold((_) {}, (movies) => categories['Romance'] = movies);

    if (trendingMovies.isEmpty && categories.isEmpty) {
      final isLoaded = state.maybeMap(loaded: (_) => true, orElse: () => false);

      if (!isLoaded) {
        // If we are not already showing data (from cache), show error
        String message = 'Failed to load content';
        trendingResult.fold((f) => message = f.message, (_) {});
        emit(TrendingMoviesState.error(message));
      }
    } else {
      // Merge with existing state if needed, or just emit new
      emit(
        TrendingMoviesState.loaded(
          trending: trendingMovies.isNotEmpty
              ? trendingMovies
              : (state.mapOrNull(loaded: (s) => s.trending) ?? []),
          categories: categories,
        ),
      );
    }
  }

  Future<void> _onRefresh(
    RefreshTrendingMovies event,
    Emitter<TrendingMoviesState> emit,
  ) async {
    add(const TrendingMoviesEvent.load());
  }
}
