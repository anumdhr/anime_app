import 'package:anime_fever/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

// class ThemeCubit extends Cubit<ThemeData> {
//   ThemeCubit() : super(AppTheme.lightTheme);
//
//   void toggleTheme(bool isDarkMode) {
//     emit(isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme);
//   }
// }


class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  void toggleTheme(bool themeState) {
    themeState == true ? AppTheme.darkTheme : AppTheme.lightTheme;
    emit(themeState);
  }
}