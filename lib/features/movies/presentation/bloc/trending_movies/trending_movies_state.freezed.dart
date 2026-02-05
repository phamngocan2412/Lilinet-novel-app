// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrendingMoviesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TrendingMoviesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingMoviesState()';
  }
}

/// @nodoc
class $TrendingMoviesStateCopyWith<$Res> {
  $TrendingMoviesStateCopyWith(
      TrendingMoviesState _, $Res Function(TrendingMoviesState) __);
}

/// @nodoc

class _Initial implements TrendingMoviesState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingMoviesState.initial()';
  }
}

/// @nodoc

class _Loading implements TrendingMoviesState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingMoviesState.loading()';
  }
}

/// @nodoc

class _Loaded implements TrendingMoviesState {
  const _Loaded(
      {required final List<Movie> trending,
      final Map<String, List<Movie>> categories = const {}})
      : _trending = trending,
        _categories = categories;

  final List<Movie> _trending;
  List<Movie> get trending {
    if (_trending is EqualUnmodifiableListView) return _trending;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trending);
  }

  final Map<String, List<Movie>> _categories;
  @JsonKey()
  Map<String, List<Movie>> get categories {
    if (_categories is EqualUnmodifiableMapView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categories);
  }

  /// Create a copy of TrendingMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other._trending, _trending) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_trending),
      const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'TrendingMoviesState.loaded(trending: $trending, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $TrendingMoviesStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({List<Movie> trending, Map<String, List<Movie>> categories});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of TrendingMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? trending = null,
    Object? categories = null,
  }) {
    return _then(_Loaded(
      trending: null == trending
          ? _self._trending
          : trending // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Movie>>,
    ));
  }
}

/// @nodoc

class _Error implements TrendingMoviesState {
  const _Error(this.message);

  final String message;

  /// Create a copy of TrendingMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TrendingMoviesState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $TrendingMoviesStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of TrendingMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
