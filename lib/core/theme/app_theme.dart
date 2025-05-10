import 'package:flutter/material.dart';

// Defines the application's theme.
class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  // Light theme data.
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6F4E37), // Coffee brown as seed color
      primary: const Color(0xFF8B5A3A), // Darker coffee for primary elements
      secondary: const Color(0xFFC8A17C), // Lighter coffee/beige for secondary
      tertiary: const Color(0xFFA57C5B), // Medium coffee for tertiary accents
      background: const Color(0xFFF5F5DC), // Beige/cream for background
      surface: const Color(0xFFFFF8E1), // Light cream for surfaces like cards
      onPrimary: Colors.white, // Text on primary color
      onSecondary: Colors.black87, // Text on secondary color
      onBackground: const Color(0xFF3E2723), // Dark brown text on background
      onSurface: const Color(0xFF3E2723), // Dark brown text on surfaces
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5DC), // Beige/cream background
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF6F4E37), // Coffee brown app bars
      foregroundColor: Colors.white, // White text/icons on app bars
      elevation: 2.0,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3E2723),
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3E2723),
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3E2723),
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF3E2723),
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFF3E2723),
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xFF3E2723),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFF4E342E),
      ), // Slightly lighter brown for body
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFF5D4037),
      ), // Medium brown for less emphasis
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(
          0xFF8B5A3A,
        ), // Darker coffee for button background
        foregroundColor: Colors.white, // Button text color
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Color(0xFFC8A17C),
        ), // Lighter coffee/beige border
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Color(0xFF6F4E37),
          width: 2.0,
        ), // Coffee brown focused border
      ),
      labelStyle: const TextStyle(
        color: Color(0xFF8B5A3A),
      ), // Darker coffee for label
    ),
    cardTheme: CardTheme(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: const Color(0xFFFFF8E1), // Light cream for card background
      surfaceTintColor: const Color(
        0xFFFFF8E1,
      ), // Ensure card color is not affected by color scheme tinting
    ),
    // Potentially add a playful font if you have one in your assets
    // fontFamily: 'PokemonFont',
  );
}
