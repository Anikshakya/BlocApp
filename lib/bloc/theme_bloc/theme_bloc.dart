import 'package:blocapp/bloc/theme_bloc/theme_event.dart';
import 'package:blocapp/bloc/theme_bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String _themeKey = 'theme';

  ThemeBloc() : super(ThemeState(ThemeData.light())) {
    on<InitializeTheme>((event, emit) async {
      final savedTheme = await _getSavedThemePreference();
      emit(state.copyWith(themeData: savedTheme));
    });

    add(const InitializeTheme()); // Default Initialize

    on<ToggleTheme>((event, emit) async {
      final currentTheme = state.themeData;
      final newTheme = currentTheme == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
      await _saveThemePreference(newTheme);
      emit(state.copyWith(themeData: newTheme));
    });
  }

  Future<void> _saveThemePreference(ThemeData themeData) async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = themeData == ThemeData.dark();
    await prefs.setBool(_themeKey, isDarkMode);
  }

  Future<ThemeData> _getSavedThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themeKey) ?? false; // Default to false (light theme)
    return isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}
