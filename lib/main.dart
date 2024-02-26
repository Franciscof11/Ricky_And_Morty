import 'package:flutter/material.dart';
import 'package:ricky_and_morty/home/presentation/pages/home_page.dart';
import 'package:ricky_and_morty/injection.dart';
import 'package:ricky_and_morty/shared/theme/data/app_theme.dart';
import 'package:ricky_and_morty/shared/theme/data/application_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.themes[AppTheme.dark]?.themeData,
      home: const HomePage(),
    );
  }
}
