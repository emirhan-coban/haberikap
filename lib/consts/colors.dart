import 'package:flutter/material.dart';

ThemeData color() {
  return ThemeData(
    colorScheme: const ColorScheme(
      primary: Color.fromRGBO(157, 196, 199, 1),
      secondary: Color.fromRGBO(217, 222, 222, 1),
      surface: Color.fromRGBO(120, 120, 120, 1),
      error: Color(0xFF1A1A1A),
      onPrimary: Color(0xFF1A1A1A),
      onSecondary: Color(0xFF1A1A1A),
      onSurface: Color(0xFF1A1A1A),
      onError: Color(0xFF1A1A1A),
      brightness: Brightness.dark,
    ),
  );
}
