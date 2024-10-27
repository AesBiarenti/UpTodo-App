import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uptodo_app/core/theme/theme_provider.dart';


bool isDarkMode(BuildContext context, WidgetRef ref) {
  final themeMode = ref.watch(themeProvider);
  return themeMode == ThemeMode.dark ||
      (themeMode == ThemeMode.system &&
          MediaQuery.of(context).platformBrightness == Brightness.dark);
}