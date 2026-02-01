import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/app_settings.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = SettingsInitial;

  const factory SettingsState.loading() = SettingsLoading;

  const factory SettingsState.loaded({required AppSettings settings}) =
      SettingsLoaded;

  const factory SettingsState.saving() = SettingsSaving;

  const factory SettingsState.saved({required AppSettings settings}) =
      SettingsSaved;

  const factory SettingsState.error({required String message}) = SettingsError;
}
