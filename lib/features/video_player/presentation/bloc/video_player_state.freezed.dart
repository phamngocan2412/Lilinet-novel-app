// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoPlayerState {
  VideoPlayerStatus get status;
  String? get episodeId;
  String? get mediaId;
  String? get title;
  String? get posterUrl;
  String? get episodeTitle;
  Duration? get startPosition;
  String? get mediaType;
  Movie? get movie;
  int? get timestamp;

  /// Create a copy of VideoPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoPlayerStateCopyWith<VideoPlayerState> get copyWith =>
      _$VideoPlayerStateCopyWithImpl<VideoPlayerState>(
          this as VideoPlayerState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoPlayerState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterUrl, posterUrl) ||
                other.posterUrl == posterUrl) &&
            (identical(other.episodeTitle, episodeTitle) ||
                other.episodeTitle == episodeTitle) &&
            (identical(other.startPosition, startPosition) ||
                other.startPosition == startPosition) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      episodeId,
      mediaId,
      title,
      posterUrl,
      episodeTitle,
      startPosition,
      mediaType,
      movie,
      timestamp);

  @override
  String toString() {
    return 'VideoPlayerState(status: $status, episodeId: $episodeId, mediaId: $mediaId, title: $title, posterUrl: $posterUrl, episodeTitle: $episodeTitle, startPosition: $startPosition, mediaType: $mediaType, movie: $movie, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $VideoPlayerStateCopyWith<$Res> {
  factory $VideoPlayerStateCopyWith(
          VideoPlayerState value, $Res Function(VideoPlayerState) _then) =
      _$VideoPlayerStateCopyWithImpl;
  @useResult
  $Res call(
      {VideoPlayerStatus status,
      String? episodeId,
      String? mediaId,
      String? title,
      String? posterUrl,
      String? episodeTitle,
      Duration? startPosition,
      String? mediaType,
      Movie? movie,
      int? timestamp});

  $MovieCopyWith<$Res>? get movie;
}

/// @nodoc
class _$VideoPlayerStateCopyWithImpl<$Res>
    implements $VideoPlayerStateCopyWith<$Res> {
  _$VideoPlayerStateCopyWithImpl(this._self, this._then);

  final VideoPlayerState _self;
  final $Res Function(VideoPlayerState) _then;

  /// Create a copy of VideoPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? episodeId = freezed,
    Object? mediaId = freezed,
    Object? title = freezed,
    Object? posterUrl = freezed,
    Object? episodeTitle = freezed,
    Object? startPosition = freezed,
    Object? mediaType = freezed,
    Object? movie = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as VideoPlayerStatus,
      episodeId: freezed == episodeId
          ? _self.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaId: freezed == mediaId
          ? _self.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      posterUrl: freezed == posterUrl
          ? _self.posterUrl
          : posterUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeTitle: freezed == episodeTitle
          ? _self.episodeTitle
          : episodeTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      startPosition: freezed == startPosition
          ? _self.startPosition
          : startPosition // ignore: cast_nullable_to_non_nullable
              as Duration?,
      mediaType: freezed == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      movie: freezed == movie
          ? _self.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of VideoPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res>? get movie {
    if (_self.movie == null) {
      return null;
    }

    return $MovieCopyWith<$Res>(_self.movie!, (value) {
      return _then(_self.copyWith(movie: value));
    });
  }
}

/// @nodoc

class _VideoPlayerState implements VideoPlayerState {
  const _VideoPlayerState(
      {this.status = VideoPlayerStatus.closed,
      this.episodeId,
      this.mediaId,
      this.title,
      this.posterUrl,
      this.episodeTitle,
      this.startPosition,
      this.mediaType,
      this.movie,
      this.timestamp});

  @override
  @JsonKey()
  final VideoPlayerStatus status;
  @override
  final String? episodeId;
  @override
  final String? mediaId;
  @override
  final String? title;
  @override
  final String? posterUrl;
  @override
  final String? episodeTitle;
  @override
  final Duration? startPosition;
  @override
  final String? mediaType;
  @override
  final Movie? movie;
  @override
  final int? timestamp;

  /// Create a copy of VideoPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoPlayerStateCopyWith<_VideoPlayerState> get copyWith =>
      __$VideoPlayerStateCopyWithImpl<_VideoPlayerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoPlayerState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterUrl, posterUrl) ||
                other.posterUrl == posterUrl) &&
            (identical(other.episodeTitle, episodeTitle) ||
                other.episodeTitle == episodeTitle) &&
            (identical(other.startPosition, startPosition) ||
                other.startPosition == startPosition) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      episodeId,
      mediaId,
      title,
      posterUrl,
      episodeTitle,
      startPosition,
      mediaType,
      movie,
      timestamp);

  @override
  String toString() {
    return 'VideoPlayerState(status: $status, episodeId: $episodeId, mediaId: $mediaId, title: $title, posterUrl: $posterUrl, episodeTitle: $episodeTitle, startPosition: $startPosition, mediaType: $mediaType, movie: $movie, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$VideoPlayerStateCopyWith<$Res>
    implements $VideoPlayerStateCopyWith<$Res> {
  factory _$VideoPlayerStateCopyWith(
          _VideoPlayerState value, $Res Function(_VideoPlayerState) _then) =
      __$VideoPlayerStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {VideoPlayerStatus status,
      String? episodeId,
      String? mediaId,
      String? title,
      String? posterUrl,
      String? episodeTitle,
      Duration? startPosition,
      String? mediaType,
      Movie? movie,
      int? timestamp});

  @override
  $MovieCopyWith<$Res>? get movie;
}

/// @nodoc
class __$VideoPlayerStateCopyWithImpl<$Res>
    implements _$VideoPlayerStateCopyWith<$Res> {
  __$VideoPlayerStateCopyWithImpl(this._self, this._then);

  final _VideoPlayerState _self;
  final $Res Function(_VideoPlayerState) _then;

  /// Create a copy of VideoPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? episodeId = freezed,
    Object? mediaId = freezed,
    Object? title = freezed,
    Object? posterUrl = freezed,
    Object? episodeTitle = freezed,
    Object? startPosition = freezed,
    Object? mediaType = freezed,
    Object? movie = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_VideoPlayerState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as VideoPlayerStatus,
      episodeId: freezed == episodeId
          ? _self.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaId: freezed == mediaId
          ? _self.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      posterUrl: freezed == posterUrl
          ? _self.posterUrl
          : posterUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeTitle: freezed == episodeTitle
          ? _self.episodeTitle
          : episodeTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      startPosition: freezed == startPosition
          ? _self.startPosition
          : startPosition // ignore: cast_nullable_to_non_nullable
              as Duration?,
      mediaType: freezed == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      movie: freezed == movie
          ? _self.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of VideoPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res>? get movie {
    if (_self.movie == null) {
      return null;
    }

    return $MovieCopyWith<$Res>(_self.movie!, (value) {
      return _then(_self.copyWith(movie: value));
    });
  }
}

// dart format on
