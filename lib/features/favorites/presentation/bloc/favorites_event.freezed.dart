// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoritesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoritesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoritesEvent()';
  }
}

/// @nodoc
class $FavoritesEventCopyWith<$Res> {
  $FavoritesEventCopyWith(FavoritesEvent _, $Res Function(FavoritesEvent) __);
}

/// @nodoc

class LoadFavorites implements FavoritesEvent {
  const LoadFavorites();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadFavorites);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoritesEvent.loadFavorites()';
  }
}

/// @nodoc

class AddFavoriteEvent implements FavoritesEvent {
  const AddFavoriteEvent(
      {required this.movieId,
      this.movieTitle,
      this.moviePoster,
      this.movieType});

  final String movieId;
  final String? movieTitle;
  final String? moviePoster;
  final String? movieType;

  /// Create a copy of FavoritesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddFavoriteEventCopyWith<AddFavoriteEvent> get copyWith =>
      _$AddFavoriteEventCopyWithImpl<AddFavoriteEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddFavoriteEvent &&
            (identical(other.movieId, movieId) || other.movieId == movieId) &&
            (identical(other.movieTitle, movieTitle) ||
                other.movieTitle == movieTitle) &&
            (identical(other.moviePoster, moviePoster) ||
                other.moviePoster == moviePoster) &&
            (identical(other.movieType, movieType) ||
                other.movieType == movieType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, movieId, movieTitle, moviePoster, movieType);

  @override
  String toString() {
    return 'FavoritesEvent.addFavorite(movieId: $movieId, movieTitle: $movieTitle, moviePoster: $moviePoster, movieType: $movieType)';
  }
}

/// @nodoc
abstract mixin class $AddFavoriteEventCopyWith<$Res>
    implements $FavoritesEventCopyWith<$Res> {
  factory $AddFavoriteEventCopyWith(
          AddFavoriteEvent value, $Res Function(AddFavoriteEvent) _then) =
      _$AddFavoriteEventCopyWithImpl;
  @useResult
  $Res call(
      {String movieId,
      String? movieTitle,
      String? moviePoster,
      String? movieType});
}

/// @nodoc
class _$AddFavoriteEventCopyWithImpl<$Res>
    implements $AddFavoriteEventCopyWith<$Res> {
  _$AddFavoriteEventCopyWithImpl(this._self, this._then);

  final AddFavoriteEvent _self;
  final $Res Function(AddFavoriteEvent) _then;

  /// Create a copy of FavoritesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movieId = null,
    Object? movieTitle = freezed,
    Object? moviePoster = freezed,
    Object? movieType = freezed,
  }) {
    return _then(AddFavoriteEvent(
      movieId: null == movieId
          ? _self.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as String,
      movieTitle: freezed == movieTitle
          ? _self.movieTitle
          : movieTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      moviePoster: freezed == moviePoster
          ? _self.moviePoster
          : moviePoster // ignore: cast_nullable_to_non_nullable
              as String?,
      movieType: freezed == movieType
          ? _self.movieType
          : movieType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class RemoveFavoriteEvent implements FavoritesEvent {
  const RemoveFavoriteEvent({required this.movieId});

  final String movieId;

  /// Create a copy of FavoritesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoveFavoriteEventCopyWith<RemoveFavoriteEvent> get copyWith =>
      _$RemoveFavoriteEventCopyWithImpl<RemoveFavoriteEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoveFavoriteEvent &&
            (identical(other.movieId, movieId) || other.movieId == movieId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieId);

  @override
  String toString() {
    return 'FavoritesEvent.removeFavorite(movieId: $movieId)';
  }
}

/// @nodoc
abstract mixin class $RemoveFavoriteEventCopyWith<$Res>
    implements $FavoritesEventCopyWith<$Res> {
  factory $RemoveFavoriteEventCopyWith(
          RemoveFavoriteEvent value, $Res Function(RemoveFavoriteEvent) _then) =
      _$RemoveFavoriteEventCopyWithImpl;
  @useResult
  $Res call({String movieId});
}

/// @nodoc
class _$RemoveFavoriteEventCopyWithImpl<$Res>
    implements $RemoveFavoriteEventCopyWith<$Res> {
  _$RemoveFavoriteEventCopyWithImpl(this._self, this._then);

  final RemoveFavoriteEvent _self;
  final $Res Function(RemoveFavoriteEvent) _then;

  /// Create a copy of FavoritesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movieId = null,
  }) {
    return _then(RemoveFavoriteEvent(
      movieId: null == movieId
          ? _self.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ClearFavorites implements FavoritesEvent {
  const ClearFavorites();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearFavorites);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoritesEvent.clearFavorites()';
  }
}

/// @nodoc

class CheckFavoriteStatus implements FavoritesEvent {
  const CheckFavoriteStatus({required this.movieId});

  final String movieId;

  /// Create a copy of FavoritesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckFavoriteStatusCopyWith<CheckFavoriteStatus> get copyWith =>
      _$CheckFavoriteStatusCopyWithImpl<CheckFavoriteStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckFavoriteStatus &&
            (identical(other.movieId, movieId) || other.movieId == movieId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieId);

  @override
  String toString() {
    return 'FavoritesEvent.checkFavoriteStatus(movieId: $movieId)';
  }
}

/// @nodoc
abstract mixin class $CheckFavoriteStatusCopyWith<$Res>
    implements $FavoritesEventCopyWith<$Res> {
  factory $CheckFavoriteStatusCopyWith(
          CheckFavoriteStatus value, $Res Function(CheckFavoriteStatus) _then) =
      _$CheckFavoriteStatusCopyWithImpl;
  @useResult
  $Res call({String movieId});
}

/// @nodoc
class _$CheckFavoriteStatusCopyWithImpl<$Res>
    implements $CheckFavoriteStatusCopyWith<$Res> {
  _$CheckFavoriteStatusCopyWithImpl(this._self, this._then);

  final CheckFavoriteStatus _self;
  final $Res Function(CheckFavoriteStatus) _then;

  /// Create a copy of FavoritesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movieId = null,
  }) {
    return _then(CheckFavoriteStatus(
      movieId: null == movieId
          ? _self.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
