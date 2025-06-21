import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme = GoogleFonts.getTextTheme(displayFontString, baseTextTheme);

  return displayTextTheme.copyWith(
    headlineSmall: bodyTextTheme.headlineSmall?.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: bodyTextTheme.titleLarge?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: bodyTextTheme.bodyLarge?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: bodyTextTheme.bodyMedium?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: bodyTextTheme.labelLarge?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
}