// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// @nodoc

class CheckAuthStatus implements AuthEvent {
  const CheckAuthStatus();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckAuthStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.checkAuthStatus()';
  }
}

/// @nodoc

class SignInRequested implements AuthEvent {
  const SignInRequested({required this.email, required this.password});

  final String email;
  final String password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInRequestedCopyWith<SignInRequested> get copyWith =>
      _$SignInRequestedCopyWithImpl<SignInRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInRequested &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'AuthEvent.signInRequested(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $SignInRequestedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $SignInRequestedCopyWith(
          SignInRequested value, $Res Function(SignInRequested) _then) =
      _$SignInRequestedCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInRequestedCopyWithImpl<$Res>
    implements $SignInRequestedCopyWith<$Res> {
  _$SignInRequestedCopyWithImpl(this._self, this._then);

  final SignInRequested _self;
  final $Res Function(SignInRequested) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(SignInRequested(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AuthSubmitted implements AuthEvent {
  const AuthSubmitted(
      {required this.username, required this.password, required this.isLogin});

  final String username;
  final String password;
  final bool isLogin;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthSubmittedCopyWith<AuthSubmitted> get copyWith =>
      _$AuthSubmittedCopyWithImpl<AuthSubmitted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSubmitted &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password, isLogin);

  @override
  String toString() {
    return 'AuthEvent.authSubmitted(username: $username, password: $password, isLogin: $isLogin)';
  }
}

/// @nodoc
abstract mixin class $AuthSubmittedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $AuthSubmittedCopyWith(
          AuthSubmitted value, $Res Function(AuthSubmitted) _then) =
      _$AuthSubmittedCopyWithImpl;
  @useResult
  $Res call({String username, String password, bool isLogin});
}

/// @nodoc
class _$AuthSubmittedCopyWithImpl<$Res>
    implements $AuthSubmittedCopyWith<$Res> {
  _$AuthSubmittedCopyWithImpl(this._self, this._then);

  final AuthSubmitted _self;
  final $Res Function(AuthSubmitted) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? isLogin = null,
  }) {
    return _then(AuthSubmitted(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLogin: null == isLogin
          ? _self.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SignUpRequested implements AuthEvent {
  const SignUpRequested(
      {required this.email, required this.password, this.displayName});

  final String email;
  final String password;
  final String? displayName;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpRequestedCopyWith<SignUpRequested> get copyWith =>
      _$SignUpRequestedCopyWithImpl<SignUpRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpRequested &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, displayName);

  @override
  String toString() {
    return 'AuthEvent.signUpRequested(email: $email, password: $password, displayName: $displayName)';
  }
}

/// @nodoc
abstract mixin class $SignUpRequestedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $SignUpRequestedCopyWith(
          SignUpRequested value, $Res Function(SignUpRequested) _then) =
      _$SignUpRequestedCopyWithImpl;
  @useResult
  $Res call({String email, String password, String? displayName});
}

/// @nodoc
class _$SignUpRequestedCopyWithImpl<$Res>
    implements $SignUpRequestedCopyWith<$Res> {
  _$SignUpRequestedCopyWithImpl(this._self, this._then);

  final SignUpRequested _self;
  final $Res Function(SignUpRequested) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = freezed,
  }) {
    return _then(SignUpRequested(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class SignOutRequested implements AuthEvent {
  const SignOutRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignOutRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.signOutRequested()';
  }
}

/// @nodoc

class AuthStateChanged implements AuthEvent {
  const AuthStateChanged({required this.isAuthenticated});

  final bool isAuthenticated;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthStateChangedCopyWith<AuthStateChanged> get copyWith =>
      _$AuthStateChangedCopyWithImpl<AuthStateChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthStateChanged &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuthenticated);

  @override
  String toString() {
    return 'AuthEvent.authStateChanged(isAuthenticated: $isAuthenticated)';
  }
}

/// @nodoc
abstract mixin class $AuthStateChangedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $AuthStateChangedCopyWith(
          AuthStateChanged value, $Res Function(AuthStateChanged) _then) =
      _$AuthStateChangedCopyWithImpl;
  @useResult
  $Res call({bool isAuthenticated});
}

/// @nodoc
class _$AuthStateChangedCopyWithImpl<$Res>
    implements $AuthStateChangedCopyWith<$Res> {
  _$AuthStateChangedCopyWithImpl(this._self, this._then);

  final AuthStateChanged _self;
  final $Res Function(AuthStateChanged) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isAuthenticated = null,
  }) {
    return _then(AuthStateChanged(
      isAuthenticated: null == isAuthenticated
          ? _self.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class PasswordResetRequested implements AuthEvent {
  const PasswordResetRequested({required this.email});

  final String email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PasswordResetRequestedCopyWith<PasswordResetRequested> get copyWith =>
      _$PasswordResetRequestedCopyWithImpl<PasswordResetRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PasswordResetRequested &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'AuthEvent.passwordResetRequested(email: $email)';
  }
}

/// @nodoc
abstract mixin class $PasswordResetRequestedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $PasswordResetRequestedCopyWith(PasswordResetRequested value,
          $Res Function(PasswordResetRequested) _then) =
      _$PasswordResetRequestedCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$PasswordResetRequestedCopyWithImpl<$Res>
    implements $PasswordResetRequestedCopyWith<$Res> {
  _$PasswordResetRequestedCopyWithImpl(this._self, this._then);

  final PasswordResetRequested _self;
  final $Res Function(PasswordResetRequested) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(PasswordResetRequested(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
