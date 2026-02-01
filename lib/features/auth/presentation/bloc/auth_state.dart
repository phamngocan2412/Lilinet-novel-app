import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/app_user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.authenticated({required AppUser user}) =
      Authenticated;

  const factory AuthState.unauthenticated() = Unauthenticated;

  const factory AuthState.error({required String message}) = AuthError;

  const factory AuthState.passwordResetEmailSent({required String email}) =
      PasswordResetEmailSent;
}
