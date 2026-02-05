// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExploreEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExploreEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExploreEvent()';
  }
}

/// @nodoc
class $ExploreEventCopyWith<$Res> {
  $ExploreEventCopyWith(ExploreEvent _, $Res Function(ExploreEvent) __);
}

/// @nodoc

class LoadGenres implements ExploreEvent {
  const LoadGenres();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadGenres);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExploreEvent.loadGenres()';
  }
}

/// @nodoc

class LoadMoviesByGenre implements ExploreEvent {
  const LoadMoviesByGenre(
      {required this.genreId, required this.genreName, this.page = 1});

  final String genreId;
  final String genreName;
  @JsonKey()
  final int page;

  /// Create a copy of ExploreEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadMoviesByGenreCopyWith<LoadMoviesByGenre> get copyWith =>
      _$LoadMoviesByGenreCopyWithImpl<LoadMoviesByGenre>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadMoviesByGenre &&
            (identical(other.genreId, genreId) || other.genreId == genreId) &&
            (identical(other.genreName, genreName) ||
                other.genreName == genreName) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genreId, genreName, page);

  @override
  String toString() {
    return 'ExploreEvent.loadMoviesByGenre(genreId: $genreId, genreName: $genreName, page: $page)';
  }
}

/// @nodoc
abstract mixin class $LoadMoviesByGenreCopyWith<$Res>
    implements $ExploreEventCopyWith<$Res> {
  factory $LoadMoviesByGenreCopyWith(
          LoadMoviesByGenre value, $Res Function(LoadMoviesByGenre) _then) =
      _$LoadMoviesByGenreCopyWithImpl;
  @useResult
  $Res call({String genreId, String genreName, int page});
}

/// @nodoc
class _$LoadMoviesByGenreCopyWithImpl<$Res>
    implements $LoadMoviesByGenreCopyWith<$Res> {
  _$LoadMoviesByGenreCopyWithImpl(this._self, this._then);

  final LoadMoviesByGenre _self;
  final $Res Function(LoadMoviesByGenre) _then;

  /// Create a copy of ExploreEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? genreId = null,
    Object? genreName = null,
    Object? page = null,
  }) {
    return _then(LoadMoviesByGenre(
      genreId: null == genreId
          ? _self.genreId
          : genreId // ignore: cast_nullable_to_non_nullable
              as String,
      genreName: null == genreName
          ? _self.genreName
          : genreName // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class LoadPopularMovies implements ExploreEvent {
  const LoadPopularMovies({this.page = 1});

  @JsonKey()
  final int page;

  /// Create a copy of ExploreEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadPopularMoviesCopyWith<LoadPopularMovies> get copyWith =>
      _$LoadPopularMoviesCopyWithImpl<LoadPopularMovies>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadPopularMovies &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @override
  String toString() {
    return 'ExploreEvent.loadPopularMovies(page: $page)';
  }
}

/// @nodoc
abstract mixin class $LoadPopularMoviesCopyWith<$Res>
    implements $ExploreEventCopyWith<$Res> {
  factory $LoadPopularMoviesCopyWith(
          LoadPopularMovies value, $Res Function(LoadPopularMovies) _then) =
      _$LoadPopularMoviesCopyWithImpl;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$LoadPopularMoviesCopyWithImpl<$Res>
    implements $LoadPopularMoviesCopyWith<$Res> {
  _$LoadPopularMoviesCopyWithImpl(this._self, this._then);

  final LoadPopularMovies _self;
  final $Res Function(LoadPopularMovies) _then;

  /// Create a copy of ExploreEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
  }) {
    return _then(LoadPopularMovies(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class LoadTopRatedMovies implements ExploreEvent {
  const LoadTopRatedMovies({this.page = 1});

  @JsonKey()
  final int page;

  /// Create a copy of ExploreEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadTopRatedMoviesCopyWith<LoadTopRatedMovies> get copyWith =>
      _$LoadTopRatedMoviesCopyWithImpl<LoadTopRatedMovies>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadTopRatedMovies &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @override
  String toString() {
    return 'ExploreEvent.loadTopRatedMovies(page: $page)';
  }
}

/// @nodoc
abstract mixin class $LoadTopRatedMoviesCopyWith<$Res>
    implements $ExploreEventCopyWith<$Res> {
  factory $LoadTopRatedMoviesCopyWith(
          LoadTopRatedMovies value, $Res Function(LoadTopRatedMovies) _then) =
      _$LoadTopRatedMoviesCopyWithImpl;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$LoadTopRatedMoviesCopyWithImpl<$Res>
    implements $LoadTopRatedMoviesCopyWith<$Res> {
  _$LoadTopRatedMoviesCopyWithImpl(this._self, this._then);

  final LoadTopRatedMovies _self;
  final $Res Function(LoadTopRatedMovies) _then;

  /// Create a copy of ExploreEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
  }) {
    return _then(LoadTopRatedMovies(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class LoadRecentlyAdded implements ExploreEvent {
  const LoadRecentlyAdded({this.page = 1});

  @JsonKey()
  final int page;

  /// Create a copy of ExploreEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadRecentlyAddedCopyWith<LoadRecentlyAdded> get copyWith =>
      _$LoadRecentlyAddedCopyWithImpl<LoadRecentlyAdded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadRecentlyAdded &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @override
  String toString() {
    return 'ExploreEvent.loadRecentlyAdded(page: $page)';
  }
}

/// @nodoc
abstract mixin class $LoadRecentlyAddedCopyWith<$Res>
    implements $ExploreEventCopyWith<$Res> {
  factory $LoadRecentlyAddedCopyWith(
          LoadRecentlyAdded value, $Res Function(LoadRecentlyAdded) _then) =
      _$LoadRecentlyAddedCopyWithImpl;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$LoadRecentlyAddedCopyWithImpl<$Res>
    implements $LoadRecentlyAddedCopyWith<$Res> {
  _$LoadRecentlyAddedCopyWithImpl(this._self, this._then);

  final LoadRecentlyAdded _self;
  final $Res Function(LoadRecentlyAdded) _then;

  /// Create a copy of ExploreEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
  }) {
    return _then(LoadRecentlyAdded(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
