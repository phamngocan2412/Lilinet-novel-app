// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_movies_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrendingMoviesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TrendingMoviesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingMoviesEvent()';
  }
}

/// @nodoc
class $TrendingMoviesEventCopyWith<$Res> {
  $TrendingMoviesEventCopyWith(
      TrendingMoviesEvent _, $Res Function(TrendingMoviesEvent) __);
}

/// @nodoc

class LoadTrendingMovies implements TrendingMoviesEvent {
  const LoadTrendingMovies({this.type = 'all'});

  @JsonKey()
  final String type;

  /// Create a copy of TrendingMoviesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadTrendingMoviesCopyWith<LoadTrendingMovies> get copyWith =>
      _$LoadTrendingMoviesCopyWithImpl<LoadTrendingMovies>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadTrendingMovies &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'TrendingMoviesEvent.load(type: $type)';
  }
}

/// @nodoc
abstract mixin class $LoadTrendingMoviesCopyWith<$Res>
    implements $TrendingMoviesEventCopyWith<$Res> {
  factory $LoadTrendingMoviesCopyWith(
          LoadTrendingMovies value, $Res Function(LoadTrendingMovies) _then) =
      _$LoadTrendingMoviesCopyWithImpl;
  @useResult
  $Res call({String type});
}

/// @nodoc
class _$LoadTrendingMoviesCopyWithImpl<$Res>
    implements $LoadTrendingMoviesCopyWith<$Res> {
  _$LoadTrendingMoviesCopyWithImpl(this._self, this._then);

  final LoadTrendingMovies _self;
  final $Res Function(LoadTrendingMovies) _then;

  /// Create a copy of TrendingMoviesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
  }) {
    return _then(LoadTrendingMovies(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class RefreshTrendingMovies implements TrendingMoviesEvent {
  const RefreshTrendingMovies();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RefreshTrendingMovies);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingMoviesEvent.refresh()';
  }
}

// dart format on
