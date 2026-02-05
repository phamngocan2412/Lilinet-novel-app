// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoritesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoritesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoritesState()';
  }
}

/// @nodoc
class $FavoritesStateCopyWith<$Res> {
  $FavoritesStateCopyWith(FavoritesState _, $Res Function(FavoritesState) __);
}

/// @nodoc

class FavoritesInitial implements FavoritesState {
  const FavoritesInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoritesInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoritesState.initial()';
  }
}

/// @nodoc

class FavoritesLoading implements FavoritesState {
  const FavoritesLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoritesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoritesState.loading()';
  }
}

/// @nodoc

class FavoritesLoaded implements FavoritesState {
  const FavoritesLoaded({required final List<Favorite> favorites})
      : _favorites = favorites;

  final List<Favorite> _favorites;
  List<Favorite> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  /// Create a copy of FavoritesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoritesLoadedCopyWith<FavoritesLoaded> get copyWith =>
      _$FavoritesLoadedCopyWithImpl<FavoritesLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoritesLoaded &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_favorites));

  @override
  String toString() {
    return 'FavoritesState.loaded(favorites: $favorites)';
  }
}

/// @nodoc
abstract mixin class $FavoritesLoadedCopyWith<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  factory $FavoritesLoadedCopyWith(
          FavoritesLoaded value, $Res Function(FavoritesLoaded) _then) =
      _$FavoritesLoadedCopyWithImpl;
  @useResult
  $Res call({List<Favorite> favorites});
}

/// @nodoc
class _$FavoritesLoadedCopyWithImpl<$Res>
    implements $FavoritesLoadedCopyWith<$Res> {
  _$FavoritesLoadedCopyWithImpl(this._self, this._then);

  final FavoritesLoaded _self;
  final $Res Function(FavoritesLoaded) _then;

  /// Create a copy of FavoritesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? favorites = null,
  }) {
    return _then(FavoritesLoaded(
      favorites: null == favorites
          ? _self._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<Favorite>,
    ));
  }
}

/// @nodoc

class FavoritesError implements FavoritesState {
  const FavoritesError({required this.message});

  final String message;

  /// Create a copy of FavoritesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoritesErrorCopyWith<FavoritesError> get copyWith =>
      _$FavoritesErrorCopyWithImpl<FavoritesError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoritesError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FavoritesState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FavoritesErrorCopyWith<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  factory $FavoritesErrorCopyWith(
          FavoritesError value, $Res Function(FavoritesError) _then) =
      _$FavoritesErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FavoritesErrorCopyWithImpl<$Res>
    implements $FavoritesErrorCopyWith<$Res> {
  _$FavoritesErrorCopyWithImpl(this._self, this._then);

  final FavoritesError _self;
  final $Res Function(FavoritesError) _then;

  /// Create a copy of FavoritesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FavoritesError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
