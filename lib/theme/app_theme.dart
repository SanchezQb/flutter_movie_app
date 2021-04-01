import 'package:flutter/material.dart';

class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;
  static final dark = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    visualDensity: visualDensity,
    cardColor: Colors.grey[900],
  );

  static final light = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    visualDensity: visualDensity,
    cardColor: Color(0xfff3f4f6),
  );
}
