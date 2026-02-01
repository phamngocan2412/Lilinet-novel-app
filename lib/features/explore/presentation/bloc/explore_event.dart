import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_event.freezed.dart';

@freezed
class ExploreEvent with _$ExploreEvent {
  const factory ExploreEvent.loadGenres() = LoadGenres;

  const factory ExploreEvent.loadMoviesByGenre({
    required String genreId,
    required String genreName,
    @Default(1) int page,
  }) = LoadMoviesByGenre;

  const factory ExploreEvent.loadPopularMovies({@Default(1) int page}) =
      LoadPopularMovies;

  const factory ExploreEvent.loadTopRatedMovies({@Default(1) int page}) =
      LoadTopRatedMovies;

  const factory ExploreEvent.loadRecentlyAdded({@Default(1) int page}) =
      LoadRecentlyAdded;
}
