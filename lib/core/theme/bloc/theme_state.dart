part of 'theme_bloc.dart';


enum AppThemeMode { light, dark }

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState({
    required ThemeData themeData,
    required AppThemeMode themeMode,
  }) = _ThemeStateData; // Renamed to avoid conflict

  factory ThemeState.initial() => ThemeState(
    themeData: AppTheme.lightTheme, // We'll define AppTheme.darkTheme later
    themeMode: AppThemeMode.light,
  );
}
