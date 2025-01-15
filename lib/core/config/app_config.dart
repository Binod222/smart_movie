import 'package:flutter/material.dart';
import 'package:smart_movie/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
      );
}
