// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Palette — warm ivory + deep ink + gold accent
  static const Color backgroundLight = Color(0xFFF7F3EE);
  static const Color backgroundDark = Color(0xFF1A1814);
  static const Color surfaceLight = Color(0xFFEFE9DF);
  static const Color surfaceDark = Color(0xFF242018);
  static const Color inkDark = Color(0xFF1A1814);
  static const Color inkLight = Color(0xFFF7F3EE);
  static const Color goldAccent = Color(0xFFBE9B5A);
  static const Color goldLight = Color(0xFFD4B483);
  static const Color mutedLight = Color(0xFF8C8070);
  static const Color mutedDark = Color(0xFF6E6558);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF2C2820);

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: backgroundLight,
        surface: surfaceLight,
        primary: inkDark,
        secondary: goldAccent,
        onBackground: inkDark,
        onSurface: inkDark,
      ),
      scaffoldBackgroundColor: backgroundLight,
      textTheme: _buildTextTheme(isDark: false),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        background: backgroundDark,
        surface: surfaceDark,
        primary: inkLight,
        secondary: goldAccent,
        onBackground: inkLight,
        onSurface: inkLight,
      ),
      scaffoldBackgroundColor: backgroundDark,
      textTheme: _buildTextTheme(isDark: true),
    );
  }

  static TextTheme _buildTextTheme({required bool isDark}) {
    final baseColor = isDark ? inkLight : inkDark;
    final mutedColor = isDark ? mutedDark : mutedLight;

    return TextTheme(
      displayLarge: GoogleFonts.cormorantGaramond(
        fontSize: 48,
        fontWeight: FontWeight.w300,
        color: baseColor,
        fontStyle: FontStyle.italic,
        height: 1.2,
      ),
      displayMedium: GoogleFonts.cormorantGaramond(
        fontSize: 32,
        fontWeight: FontWeight.w300,
        color: baseColor,
        fontStyle: FontStyle.italic,
        height: 1.3,
      ),
      bodyLarge: GoogleFonts.cormorantGaramond(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: baseColor,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: mutedColor,
        letterSpacing: 0.3,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: baseColor,
        letterSpacing: 1.5,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: mutedColor,
        letterSpacing: 1.2,
      ),
    );
  }
}