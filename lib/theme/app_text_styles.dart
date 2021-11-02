import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/theme/app_theme.dart';

abstract class AppTextStyles {
  TextStyle get appBar;
  TextStyle get textBackgroundSecondary;
  TextStyle get title;
  TextStyle get button;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get appBar => GoogleFonts.inter(
        color: AppTheme.colors.titleAppBar,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get textBackgroundSecondary => GoogleFonts.montserrat(
        color: AppTheme.colors.textBackgroundSecondary,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get title => GoogleFonts.montserrat(
        color: AppTheme.colors.title,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get button => GoogleFonts.inter(
        color: AppTheme.colors.button,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
}
