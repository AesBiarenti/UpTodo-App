import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uptodo_app/core/constants/font.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final box = Hive.box('settings');
    final isDarkMode = box.get('isDarkMode', defaultValue: null);
    if (isDarkMode == null) {
      state = ThemeMode.system;
    } else {
      state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    final box = Hive.box('settings');
    if (themeMode == ThemeMode.system) {
      await box.delete('isDarkMode');
    } else {
      await box.put('isDarkMode', themeMode == ThemeMode.dark);
    }
    state = themeMode;
  }
}

final lightTheme = ThemeData(
  dialogTheme: DialogTheme(backgroundColor: Colors.grey.shade100),
  scaffoldBackgroundColor: Colors.grey.shade100,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey.shade900,
  ),
  brightness: Brightness.light,
  primaryColor: Colors.grey.shade100,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade100,
    titleTextStyle: Sabitler.appBarFontLight,
  ),
  textTheme: TextTheme(
    bodyLarge: Sabitler.anaFontlight,
    bodyMedium: Sabitler.anaFontlight,
    bodySmall: Sabitler.anaFontlight,
    labelLarge: Sabitler.anaFontlight,
    labelMedium: Sabitler.anaFontlight,
    labelSmall: Sabitler.anaFontlight,
    titleLarge: Sabitler.anaFontlight,
    titleMedium: Sabitler.anaFontlight,
    titleSmall: Sabitler.anaFontlight,
  ),
);

final darkTheme = ThemeData(
  dialogTheme:
      const DialogTheme(backgroundColor: Color.fromARGB(255, 20, 20, 20)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey.shade300,
  ),
  brightness: Brightness.dark,
  primaryColor: const Color.fromARGB(255, 20, 20, 20),
  appBarTheme: AppBarTheme(
    
    backgroundColor: const Color.fromARGB(255, 20, 20, 20),
    titleTextStyle: Sabitler.appBarFontDark,
  ),
  textTheme: TextTheme(
    bodyLarge: Sabitler.anaFontDark,
    bodyMedium: Sabitler.anaFontDark,
    bodySmall: Sabitler.anaFontDark,
    labelLarge: Sabitler.anaFontDark,
    labelMedium: Sabitler.anaFontDark,
    labelSmall: Sabitler.anaFontDark,
    titleLarge: Sabitler.anaFontDark,
    titleMedium: Sabitler.anaFontDark,
    titleSmall: Sabitler.anaFontDark,
  ),
);
