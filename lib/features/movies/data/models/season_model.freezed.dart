// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeasonModel {
  @HiveField(0)
  @StringToIntConverterRequired()
  int get season;
  @HiveField(1)
  List<EpisodeModel> get episodes;

  /// Create a copy of SeasonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeasonModelCopyWith<SeasonModel> get copyWith =>
      _$SeasonModelCopyWithImpl<SeasonModel>(this as SeasonModel, _$identity);

  /// Serializes this SeasonModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeasonModel &&
            (identical(other.season, season) || other.season == season) &&
            const DeepCollectionEquality().equals(other.episodes, episodes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, season, const DeepCollectionEquality().hash(episodes));

  @override
  String toString() {
    return 'SeasonModel(season: $season, episodes: $episodes)';
  }
}

/// @nodoc
abstract mixin class $SeasonModelCopyWith<$Res> {
  factory $SeasonModelCopyWith(
          SeasonModel value, $Res Function(SeasonModel) _then) =
      _$SeasonModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) @StringToIntConverterRequired() int season,
      @HiveField(1) List<EpisodeModel> episodes});
}

/// @nodoc
class _$SeasonModelCopyWithImpl<$Res> implements $SeasonModelCopyWith<$Res> {
  _$SeasonModelCopyWithImpl(this._self, this._then);

  final SeasonModel _self;
  final $Res Function(SeasonModel) _then;

  /// Create a copy of SeasonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? season = null,
    Object? episodes = null,
  }) {
    return _then(_self.copyWith(
      season: null == season
          ? _self.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      episodes: null == episodes
          ? _self.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SeasonModel implements SeasonModel {
  const _SeasonModel(
      {@HiveField(0) @StringToIntConverterRequired() required this.season,
      @HiveField(1) final List<EpisodeModel> episodes = const []})
      : _episodes = episodes;
  factory _SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);

  @override
  @HiveField(0)
  @StringToIntConverterRequired()
  final int season;
  final List<EpisodeModel> _episodes;
  @override
  @JsonKey()
  @HiveField(1)
  List<EpisodeModel> get episodes {
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  /// Create a copy of SeasonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SeasonModelCopyWith<_SeasonModel> get copyWith =>
      __$SeasonModelCopyWithImpl<_SeasonModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SeasonModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SeasonModel &&
            (identical(other.season, season) || other.season == season) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, season, const DeepCollectionEquality().hash(_episodes));

  @override
  String toString() {
    return 'SeasonModel(season: $season, episodes: $episodes)';
  }
}

/// @nodoc
abstract mixin class _$SeasonModelCopyWith<$Res>
    implements $SeasonModelCopyWith<$Res> {
  factory _$SeasonModelCopyWith(
          _SeasonModel value, $Res Function(_SeasonModel) _then) =
      __$SeasonModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @StringToIntConverterRequired() int season,
      @HiveField(1) List<EpisodeModel> episodes});
}

/// @nodoc
class __$SeasonModelCopyWithImpl<$Res> implements _$SeasonModelCopyWith<$Res> {
  __$SeasonModelCopyWithImpl(this._self, this._then);

  final _SeasonModel _self;
  final $Res Function(_SeasonModel) _then;

  /// Create a copy of SeasonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? season = null,
    Object? episodes = null,
  }) {
    return _then(_SeasonModel(
      season: null == season
          ? _self.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      episodes: null == episodes
          ? _self._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
    ));
  }
}

// dart format on
