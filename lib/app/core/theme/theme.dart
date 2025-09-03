import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

