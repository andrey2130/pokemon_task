part of 'theme_bloc.dart';


@freezed
sealed class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.toggleTheme() =
      _ToggleTheme; 
  const factory ThemeEvent.setTheme(AppThemeMode themeMode) =
      _SetTheme;
  const factory ThemeEvent.loadTheme() = _LoadTheme; 
}
