import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import '../features/splash/presentation/splash_screen.dart';

class ZeninShareApp extends StatelessWidget {
  const ZeninShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZeninShare',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}