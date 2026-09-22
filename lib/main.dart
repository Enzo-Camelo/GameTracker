import 'package:flutter/material.dart';

import 'cores.dart';
import 'telas/tela_dashboard.dart';

void main() {
  runApp(const GameTrackerApp());
}

class GameTrackerApp extends StatelessWidget {
  const GameTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.fundo,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaria,
          secondary: AppColors.secundaria,
          surface: AppColors.fundoCard,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.fundo,
          foregroundColor: AppColors.texto,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: AppColors.texto,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.texto),
          bodyMedium: TextStyle(color: AppColors.texto),
        ),
      ),
      home: const TelaDashboard(),
    );
  }
}
