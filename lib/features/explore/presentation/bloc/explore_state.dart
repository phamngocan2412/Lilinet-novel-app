import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../movies/domain/entities/movie.dart';
import '../../domain/entities/genre.dart';

part 'explore_state.freezed.dart';

@freezed
class ExploreState with _$ExploreState {
  const factory ExploreState.initial() = ExploreInitial;

  const factory ExploreState.loading() = ExploreLoading;

  const factory ExploreState.genresLoaded({required List<Genre> genres}) =
      GenresLoaded;

  const factory ExploreState.moviesLoaded({
    required List<Movie> movies,
    required String category,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
  }) = MoviesLoaded;

  const factory ExploreState.error({required String message}) = ExploreError;
}

extension MoviesLoadedX on MoviesLoaded {
  MoviesLoaded copyWithMore({
    List<Movie>? movies,
    String? category,
    int? currentPage,
    bool? hasMore,
  }) {
    return MoviesLoaded(
      movies: movies ?? this.movies,
      category: category ?? this.category,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
