// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HistoryState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HistoryState()';
  }
}

/// @nodoc
class $HistoryStateCopyWith<$Res> {
  $HistoryStateCopyWith(HistoryState _, $Res Function(HistoryState) __);
}

/// @nodoc

class HistoryInitial implements HistoryState {
  const HistoryInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HistoryInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HistoryState.initial()';
  }
}

/// @nodoc

class HistoryLoading implements HistoryState {
  const HistoryLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HistoryLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HistoryState.loading()';
  }
}

/// @nodoc

class HistoryLoaded implements HistoryState {
  const HistoryLoaded({required final List<WatchProgress> history})
      : _history = history;

  final List<WatchProgress> _history;
  List<WatchProgress> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryLoadedCopyWith<HistoryLoaded> get copyWith =>
      _$HistoryLoadedCopyWithImpl<HistoryLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryLoaded &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_history));

  @override
  String toString() {
    return 'HistoryState.loaded(history: $history)';
  }
}

/// @nodoc
abstract mixin class $HistoryLoadedCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory $HistoryLoadedCopyWith(
          HistoryLoaded value, $Res Function(HistoryLoaded) _then) =
      _$HistoryLoadedCopyWithImpl;
  @useResult
  $Res call({List<WatchProgress> history});
}

/// @nodoc
class _$HistoryLoadedCopyWithImpl<$Res>
    implements $HistoryLoadedCopyWith<$Res> {
  _$HistoryLoadedCopyWithImpl(this._self, this._then);

  final HistoryLoaded _self;
  final $Res Function(HistoryLoaded) _then;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? history = null,
  }) {
    return _then(HistoryLoaded(
      history: null == history
          ? _self._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<WatchProgress>,
    ));
  }
}

/// @nodoc

class HistoryEmpty implements HistoryState {
  const HistoryEmpty();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HistoryEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HistoryState.empty()';
  }
}

/// @nodoc

class HistoryError implements HistoryState {
  const HistoryError({required this.message});

  final String message;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryErrorCopyWith<HistoryError> get copyWith =>
      _$HistoryErrorCopyWithImpl<HistoryError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HistoryState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $HistoryErrorCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory $HistoryErrorCopyWith(
          HistoryError value, $Res Function(HistoryError) _then) =
      _$HistoryErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$HistoryErrorCopyWithImpl<$Res> implements $HistoryErrorCopyWith<$Res> {
  _$HistoryErrorCopyWithImpl(this._self, this._then);

  final HistoryError _self;
  final $Res Function(HistoryError) _then;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(HistoryError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
