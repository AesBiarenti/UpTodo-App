import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uptodo_app/core/theme/theme_provider.dart';
import 'package:uptodo_app/presentation/pages/start/second_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      title: 'Material App',
      home: const StartSecondPage(),
    );
  }
}
