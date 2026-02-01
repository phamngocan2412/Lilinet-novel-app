import '../../features/settings/presentation/bloc/settings_state.dart';
import '../../features/settings/domain/entities/app_settings.dart' as domain;
import 'package:flutter/material.dart';

/// Extension to simplify SettingsState to ThemeMode extraction
extension SettingsStateX on SettingsState {
  /// Get AppSettings if state has settings, null otherwise
  domain.AppSettings? get settingsOrNull {
    if (this is SettingsLoaded) {
      return (this as SettingsLoaded).settings;
    }
    if (this is SettingsSaved) {
      return (this as SettingsSaved).settings;
    }
    return null;
  }

  /// Convert SettingsState to Flutter ThemeMode
  ThemeMode get toThemeMode {
    final settings = settingsOrNull;
    if (settings == null) return ThemeMode.system;

    switch (settings.themeMode) {
      case domain.ThemeMode.light:
        return ThemeMode.light;
      case domain.ThemeMode.dark:
        return ThemeMode.dark;
      case domain.ThemeMode.system:
        return ThemeMode.system;
    }
  }
}
