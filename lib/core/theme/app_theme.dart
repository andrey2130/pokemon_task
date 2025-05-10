import 'package:flutter/material.dart';

class AppTheme {
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
      // Explicitly define error colors for light theme
      error: Colors.red.shade700, // A distinct red for errors
      onError: Colors.white, // Text on error color
      errorContainer:
          Colors.red.shade100, // Background for error messages/containers
      onErrorContainer: Colors.red.shade900, // Text on error container
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

  // Dark theme data.
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1E1E1E), // Dark grey as seed color
      primary: const Color(0xFFBB86FC), // Purple for primary elements
      secondary: const Color(0xFF03DAC6), // Teal for secondary elements
      tertiary: const Color(0xFF3700B3), // Darker purple for tertiary accents
      background: const Color(0xFF121212), // Very dark grey for background
      surface: const Color(0xFF1E1E1E), // Dark grey for surfaces like cards
      onPrimary: Colors.black, // Text on primary color
      onSecondary: Colors.black, // Text on secondary color
      onBackground: Colors.white, // White text on background
      onSurface: Colors.white, // White text on surfaces
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(
      0xFF121212,
    ), // Very dark grey background
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E), // Dark grey app bars
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
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(
          0xFFBB86FC,
        ), // Purple for button background
        foregroundColor: Colors.black, // Button text color
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.white38,
        ), // Lighter grey border
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Color(0xFFBB86FC), // Purple focused border
          width: 2.0,
        ),
      ),
      labelStyle: const TextStyle(
        color: Colors.white70,
      ), // Lighter grey for label
    ),
    cardTheme: CardTheme(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: const Color(0xFF1E1E1E), // Dark grey for card background
      surfaceTintColor: const Color(0xFF1E1E1E),
    ),
    dividerTheme: const DividerThemeData(color: Colors.white38, thickness: 1),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFFBB86FC); // Purple when selected
        }
        return Colors.grey; // Grey when not selected
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return const Color(
            0xFFBB86FC,
          ).withOpacity(0.5); // Lighter purple track
        }
        return Colors.grey.withOpacity(0.5); // Lighter grey track
      }),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E), // Explicitly set background
      selectedItemColor: Colors.white, // Teal for selected items
      unselectedItemColor: Colors.white54, // Lighter grey for unselected items
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      // unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal), // Optional: if you want to change unselected label style
    ),
  );
}
