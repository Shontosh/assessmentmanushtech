import 'package:assesmentmanushtech/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: GoogleFonts.inter(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineSmall: GoogleFonts.inter(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
    titleLarge: GoogleFonts.inter(
        fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.white),
    titleMedium: GoogleFonts.inter(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleSmall: GoogleFonts.inter(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    bodyLarge: GoogleFonts.inter(fontSize: 16.0, color: Colors.white),
    labelLarge: GoogleFonts.inter(fontSize: 14.0, color: Colors.white),
    bodySmall: GoogleFonts.inter(fontSize: 12.0, color: Colors.white),
  );

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: GoogleFonts.inter(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineSmall: GoogleFonts.inter(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
    titleLarge: GoogleFonts.inter(
        fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.black),
    titleMedium: GoogleFonts.inter(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: GoogleFonts.inter(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    bodyLarge: GoogleFonts.inter(fontSize: 16.0, color: Colors.black),
    bodyMedium: GoogleFonts.inter(fontSize: 14.0, color: Colors.black),
    bodySmall: GoogleFonts.inter(fontSize: 12.0, color: Colors.black),
    labelLarge: GoogleFonts.inter(fontSize: 14.0, color: darkGrey),
    labelMedium: GoogleFonts.inter(fontSize: 12.0, color: darkGrey),
    labelSmall: GoogleFonts.inter(fontSize: 10.0, color: darkGrey),
  );
}
