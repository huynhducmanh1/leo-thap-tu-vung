import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Define Colors
  static const Color midnightPurple = Color(0xFF5E5CE6);
  static const Color aquaTeal = Color(0xFF00B8A9);
  static const Color ghostWhite = Color(0xFFF8F9FA);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color charcoal = Color(0xFF212529);
  static const Color slateGrey = Color(0xFF6C757D);
  static const Color successGreen = Color(0xFF28A745);
  static const Color errorRed = Color(0xFFDC3545);

  // Define the light theme for the app
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Nunito',
    scaffoldBackgroundColor: ghostWhite,

    // Define the color scheme
    colorScheme: const ColorScheme.light(
      primary: midnightPurple,
      secondary: aquaTeal,
      background: ghostWhite,
      surface: pureWhite,
      onPrimary: pureWhite,
      onSecondary: pureWhite,
      onBackground: charcoal,
      onSurface: charcoal,
      error: errorRed,
      onError: pureWhite,
      brightness: Brightness.light,
    ),

    // Define text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: charcoal),
      headlineMedium: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: charcoal),
      bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: charcoal),
      bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: slateGrey),
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: pureWhite),
    ),

    // Define button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: aquaTeal, // Action color
        foregroundColor: pureWhite, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // Define input field theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: pureWhite,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: midnightPurple, width: 2),
      ),
      hintStyle: const TextStyle(color: slateGrey),
    ),

    // Define card theme
    cardTheme: CardThemeData(
      elevation: 4,
      shadowColor: midnightPurple.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
