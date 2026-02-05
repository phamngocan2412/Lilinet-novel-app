// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExploreState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExploreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExploreState()';
  }
}

/// @nodoc
class $ExploreStateCopyWith<$Res> {
  $ExploreStateCopyWith(ExploreState _, $Res Function(ExploreState) __);
}

/// @nodoc

class ExploreInitial implements ExploreState {
  const ExploreInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExploreInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExploreState.initial()';
  }
}

/// @nodoc

class ExploreLoading implements ExploreState {
  const ExploreLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExploreLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExploreState.loading()';
  }
}

/// @nodoc

class GenresLoaded implements ExploreState {
  const GenresLoaded({required final List<Genre> genres}) : _genres = genres;

  final List<Genre> _genres;
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenresLoadedCopyWith<GenresLoaded> get copyWith =>
      _$GenresLoadedCopyWithImpl<GenresLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenresLoaded &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  @override
  String toString() {
    return 'ExploreState.genresLoaded(genres: $genres)';
  }
}

/// @nodoc
abstract mixin class $GenresLoadedCopyWith<$Res>
    implements $ExploreStateCopyWith<$Res> {
  factory $GenresLoadedCopyWith(
          GenresLoaded value, $Res Function(GenresLoaded) _then) =
      _$GenresLoadedCopyWithImpl;
  @useResult
  $Res call({List<Genre> genres});
}

/// @nodoc
class _$GenresLoadedCopyWithImpl<$Res> implements $GenresLoadedCopyWith<$Res> {
  _$GenresLoadedCopyWithImpl(this._self, this._then);

  final GenresLoaded _self;
  final $Res Function(GenresLoaded) _then;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? genres = null,
  }) {
    return _then(GenresLoaded(
      genres: null == genres
          ? _self._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc

class MoviesLoaded implements ExploreState {
  const MoviesLoaded(
      {required final List<Movie> movies,
      required this.category,
      this.currentPage = 1,
      this.hasMore = true})
      : _movies = movies;

  final List<Movie> _movies;
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  final String category;
  @JsonKey()
  final int currentPage;
  @JsonKey()
  final bool hasMore;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoviesLoadedCopyWith<MoviesLoaded> get copyWith =>
      _$MoviesLoadedCopyWithImpl<MoviesLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoviesLoaded &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      category,
      currentPage,
      hasMore);

  @override
  String toString() {
    return 'ExploreState.moviesLoaded(movies: $movies, category: $category, currentPage: $currentPage, hasMore: $hasMore)';
  }
}

/// @nodoc
abstract mixin class $MoviesLoadedCopyWith<$Res>
    implements $ExploreStateCopyWith<$Res> {
  factory $MoviesLoadedCopyWith(
          MoviesLoaded value, $Res Function(MoviesLoaded) _then) =
      _$MoviesLoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<Movie> movies, String category, int currentPage, bool hasMore});
}

/// @nodoc
class _$MoviesLoadedCopyWithImpl<$Res> implements $MoviesLoadedCopyWith<$Res> {
  _$MoviesLoadedCopyWithImpl(this._self, this._then);

  final MoviesLoaded _self;
  final $Res Function(MoviesLoaded) _then;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movies = null,
    Object? category = null,
    Object? currentPage = null,
    Object? hasMore = null,
  }) {
    return _then(MoviesLoaded(
      movies: null == movies
          ? _self._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ExploreError implements ExploreState {
  const ExploreError({required this.message});

  final String message;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExploreErrorCopyWith<ExploreError> get copyWith =>
      _$ExploreErrorCopyWithImpl<ExploreError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExploreError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ExploreState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ExploreErrorCopyWith<$Res>
    implements $ExploreStateCopyWith<$Res> {
  factory $ExploreErrorCopyWith(
          ExploreError value, $Res Function(ExploreError) _then) =
      _$ExploreErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ExploreErrorCopyWithImpl<$Res> implements $ExploreErrorCopyWith<$Res> {
  _$ExploreErrorCopyWithImpl(this._self, this._then);

  final ExploreError _self;
  final $Res Function(ExploreError) _then;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ExploreError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
