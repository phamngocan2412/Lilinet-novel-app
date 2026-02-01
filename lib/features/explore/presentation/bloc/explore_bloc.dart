import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_genres.dart';
import '../../domain/usecases/get_movies_by_genre.dart';
import '../../domain/repositories/explore_repository.dart';
import 'explore_event.dart';
import 'explore_state.dart';

@lazySingleton
class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetGenres getGenres;
  final GetMoviesByGenre getMoviesByGenre;
  final ExploreRepository repository;

  ExploreBloc({
    required this.getGenres,
    required this.getMoviesByGenre,
    required this.repository,
  }) : super(ExploreInitial()) {
    on<LoadGenres>(_onLoadGenres);
    on<LoadMoviesByGenre>(_onLoadMoviesByGenre);
    on<LoadPopularMovies>(_onLoadPopularMovies);
    on<LoadTopRatedMovies>(_onLoadTopRatedMovies);
    on<LoadRecentlyAdded>(_onLoadRecentlyAdded);
  }

  Future<void> _onLoadGenres(
    LoadGenres event,
    Emitter<ExploreState> emit,
  ) async {
    emit(const ExploreState.loading());
    final result = await getGenres();
    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (genres) => emit(ExploreState.genresLoaded(genres: genres)),
    );
  }

  Future<void> _onLoadMoviesByGenre(
    LoadMoviesByGenre event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.page == 1) {
      emit(const ExploreState.loading());
    }

    final result = await getMoviesByGenre(
      genreId: event.genreId,
      page: event.page,
    );

    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (movies) {
        final currentState = state.maybeMap(
          moviesLoaded: (s) => s,
          orElse: () => null,
        );
        if (currentState != null && event.page > 1) {
          emit(
            currentState.copyWithMore(
              movies: [...currentState.movies, ...movies],
              currentPage: event.page,
              hasMore: movies.isNotEmpty,
            ),
          );
        } else {
          emit(
            ExploreState.moviesLoaded(
              movies: movies,
              category: event.genreName,
              currentPage: event.page,
              hasMore: movies.isNotEmpty,
            ),
          );
        }
      },
    );
  }

  Future<void> _onLoadPopularMovies(
    LoadPopularMovies event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.page == 1) {
      emit(const ExploreState.loading());
    }

    final result = await repository.getPopularMovies(page: event.page);

    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (movies) {
        final currentState = state.maybeMap(
          moviesLoaded: (s) => s,
          orElse: () => null,
        );
        if (currentState != null && event.page > 1) {
          emit(
            currentState.copyWithMore(
              movies: [...currentState.movies, ...movies],
              currentPage: event.page,
              hasMore: movies.isNotEmpty,
            ),
          );
        } else {
          emit(
            ExploreState.moviesLoaded(
              movies: movies,
              category: 'Popular',
              currentPage: event.page,
              hasMore: movies.isNotEmpty,
            ),
          );
        }
      },
    );
  }

  Future<void> _onLoadTopRatedMovies(
    LoadTopRatedMovies event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.page == 1) {
      emit(const ExploreState.loading());
    }

    final result = await repository.getTopRatedMovies(page: event.page);

    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (movies) {
        final currentState = state.maybeMap(
          moviesLoaded: (s) => s,
          orElse: () => null,
        );
        if (currentState != null && event.page > 1) {
          emit(
            currentState.copyWithMore(
              movies: [...currentState.movies, ...movies],
              currentPage: event.page,
              hasMore: movies.isNotEmpty,
            ),
          );
        } else {
          emit(
            ExploreState.moviesLoaded(
              movies: movies,
              category: 'Top Rated',
              currentPage: event.page,
              hasMore: movies.isNotEmpty,
            ),
          );
        }
      },
    );
  }

  Future<void> _onLoadRecentlyAdded(
    LoadRecentlyAdded event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.page == 1) {
      emit(const ExploreState.loading());
    }

    final result = await repository.getRecentlyAdded(page: event.page);

    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (movies) {
        final currentState = state.maybeMap(
          moviesLoaded: (s) => s,
          orElse: () => null,
        );
        if (currentState != null && event.page > 1) {
          emit(
            currentState.copyWithMore(
              movies: [...currentState.movies, ...movies],
              currentPage: event.page,
              hasMore: movies.isNotEmpty,
            ),
          );
        } else {
          emit(
            ExploreState.moviesLoaded(
              movies: movies,
              category: 'Recently Added',
              currentPage: event.page,
              hasMore: movies.isNotEmpty,
            ),
          );
        }
      },
    );
  }
}
