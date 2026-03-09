import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const _primaryColor = Color(0xFFE30613);
  static const _surfaceColor = Color(0xFFF5F5F5);
  static const _onPrimaryColor = Color(0xFFFFFFFF);
  static const _textColor = Color(0xFF1A1A1A);

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: _primaryColor,
      onPrimary: _onPrimaryColor,
      surface: _surfaceColor,
      onSurface: _textColor,
    ),
  );
}
