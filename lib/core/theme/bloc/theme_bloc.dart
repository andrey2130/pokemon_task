import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_task/core/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

const String _themePreferenceKey = 'app_theme_preference';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences _prefs;

  ThemeBloc(this._prefs) : super(ThemeState.initial()) {
    on<_ToggleTheme>(_onToggleTheme);
    on<_SetTheme>(_onSetTheme);
    on<_LoadTheme>(_onLoadTheme);
  }

  Future<void> _onLoadTheme(_LoadTheme event, Emitter<ThemeState> emit) async {
    final String? themeModeName = _prefs.getString(_themePreferenceKey);
    if (themeModeName != null) {
      final AppThemeMode mode = AppThemeMode.values.firstWhere(
        (e) => e.name == themeModeName,
        orElse: () => AppThemeMode.light,
      );
      final newThemeData =
          mode == AppThemeMode.light ? AppTheme.lightTheme : AppTheme.darkTheme;
      emit(state.copyWith(themeData: newThemeData, themeMode: mode));
    } else {
      emit(ThemeState.initial());
    }
  }

  Future<void> _onToggleTheme(
    _ToggleTheme event,
    Emitter<ThemeState> emit,
  ) async {
    final newMode =
        state.themeMode == AppThemeMode.light
            ? AppThemeMode.dark
            : AppThemeMode.light;
    final newThemeData =
        newMode == AppThemeMode.light
            ? AppTheme.lightTheme
            : AppTheme.darkTheme;
    emit(state.copyWith(themeData: newThemeData, themeMode: newMode));
    await _prefs.setString(_themePreferenceKey, newMode.name);
  }

  Future<void> _onSetTheme(_SetTheme event, Emitter<ThemeState> emit) async {
    final newThemeData =
        event.themeMode == AppThemeMode.light
            ? AppTheme.lightTheme
            : AppTheme.darkTheme;
    emit(state.copyWith(themeData: newThemeData, themeMode: event.themeMode));
    await _prefs.setString(_themePreferenceKey, event.themeMode.name);
  }
}
