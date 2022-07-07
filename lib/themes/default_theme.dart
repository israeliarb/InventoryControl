import 'package:flutter/material.dart';
import 'package:inventorycontrol/constants/colors.dart';

final ThemeData defaultTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    backgroundColor: CustomColors.customLightPurple,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: CustomColors.customLightPurple,
  ),
);
