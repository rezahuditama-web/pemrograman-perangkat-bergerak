import 'package:flutter/material.dart';
import 'modul_02/studi_kasus/ruang_praktikum.dart';

void main() {
  runApp(const RuangKitaApp());
}

class RuangKitaApp extends StatefulWidget {
  const RuangKitaApp({super.key});

  @override
  State<RuangKitaApp> createState() => _RuangKitaAppState();
}

class _RuangKitaAppState extends State<RuangKitaApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RuangKita - Dashboard Ruang Praktikum',
      debugShowCheckedModeBanner: false,

      // Mengatur mode tema berdasarkan state.
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // Tema terang Material 3.
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0284C7),
          brightness: Brightness.light,
        ),
      ),

      // Tema gelap Material 3.
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0284C7),
          brightness: Brightness.dark,
        ),
      ),

      // Halaman utama aplikasi.
      home: RuangPraktikumScreen(
        onToggleTheme: _toggleTheme,
        isDarkMode: _isDarkMode,
      ),
    );
  }
}