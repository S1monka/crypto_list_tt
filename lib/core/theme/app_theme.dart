import 'package:crypto_list_tt/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData theme() {
    final textTheme = TextTheme(
      titleMedium: GoogleFonts.titilliumWeb(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      titleSmall: GoogleFonts.titilliumWeb(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.grey,
      ),
      bodyLarge: GoogleFonts.barlow(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      bodyMedium: GoogleFonts.barlow(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      bodySmall: GoogleFonts.barlow(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.grey,
      ),
      labelLarge: GoogleFonts.barlow(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.grey,
      ),
    );

    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xff212630),
      textTheme: textTheme,
      iconTheme: const IconThemeData(
        size: 24,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
