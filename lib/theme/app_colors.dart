import 'package:flutter/material.dart';

abstract class AppColors {
  MaterialColor get primarySwatch;
  Color get titleAppBar;
  Color get backgroundPrimary;
  Color get backgroundSecondary;
  Color get textBackgroundSecondary;
  Color get title;
  Color get button;
  Color get border;
}

class AppColorsDefault implements AppColors {
  @override
  MaterialColor get primarySwatch => Colors.purple;

  @override
  Color get titleAppBar => Color(0xFFFFFFFF);

  @override
  Color get backgroundPrimary => Color(0xFFFFFFFF);

  @override
  Color get backgroundSecondary => Color(0xFF9C27B0);

  @override
  Color get textBackgroundSecondary => Color(0xFFFFFFFF);

  @override
  Color get title => Color(0xFF7B1FA2);

  @override
  Color get button => Color(0xFF666666);

  @override
  Color get border => Color(0xFFDCE0E5);
}
