// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtitle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Subtitle {
  String get url;
  String get lang;

  /// Create a copy of Subtitle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubtitleCopyWith<Subtitle> get copyWith =>
      _$SubtitleCopyWithImpl<Subtitle>(this as Subtitle, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Subtitle &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, lang);

  @override
  String toString() {
    return 'Subtitle(url: $url, lang: $lang)';
  }
}

/// @nodoc
abstract mixin class $SubtitleCopyWith<$Res> {
  factory $SubtitleCopyWith(Subtitle value, $Res Function(Subtitle) _then) =
      _$SubtitleCopyWithImpl;
  @useResult
  $Res call({String url, String lang});
}

/// @nodoc
class _$SubtitleCopyWithImpl<$Res> implements $SubtitleCopyWith<$Res> {
  _$SubtitleCopyWithImpl(this._self, this._then);

  final Subtitle _self;
  final $Res Function(Subtitle) _then;

  /// Create a copy of Subtitle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? lang = null,
  }) {
    return _then(_self.copyWith(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Subtitle implements Subtitle {
  const _Subtitle({required this.url, required this.lang});

  @override
  final String url;
  @override
  final String lang;

  /// Create a copy of Subtitle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubtitleCopyWith<_Subtitle> get copyWith =>
      __$SubtitleCopyWithImpl<_Subtitle>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Subtitle &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, lang);

  @override
  String toString() {
    return 'Subtitle(url: $url, lang: $lang)';
  }
}

/// @nodoc
abstract mixin class _$SubtitleCopyWith<$Res>
    implements $SubtitleCopyWith<$Res> {
  factory _$SubtitleCopyWith(_Subtitle value, $Res Function(_Subtitle) _then) =
      __$SubtitleCopyWithImpl;
  @override
  @useResult
  $Res call({String url, String lang});
}

/// @nodoc
class __$SubtitleCopyWithImpl<$Res> implements _$SubtitleCopyWith<$Res> {
  __$SubtitleCopyWithImpl(this._self, this._then);

  final _Subtitle _self;
  final $Res Function(_Subtitle) _then;

  /// Create a copy of Subtitle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = null,
    Object? lang = null,
  }) {
    return _then(_Subtitle(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
