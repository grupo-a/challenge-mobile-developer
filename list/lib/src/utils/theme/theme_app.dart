import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
  primaryColor: const Color.fromRGBO(47, 97, 126, 1),
  appBarTheme: const AppBarTheme(
    elevation: 3,
    backgroundColor: Color.fromRGBO(47, 97, 126, 1),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
    ),
  ),
);
