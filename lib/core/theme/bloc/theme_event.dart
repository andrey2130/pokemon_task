part of 'theme_bloc.dart';

// freezed will be generated, AppThemeMode is in theme_state.dart which is also part of theme_bloc.dart

@freezed
sealed class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.toggleTheme() =
      _ToggleTheme; // Changed to avoid conflict if freezed generates ToggleTheme
  const factory ThemeEvent.setTheme(AppThemeMode themeMode) =
      _SetTheme; // Changed for the same reason
  const factory ThemeEvent.loadTheme() = _LoadTheme; // Added new event
}
