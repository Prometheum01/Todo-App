import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/const/color.dart';

class ThemeConst {
  const ThemeConst._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, //Color(ColorConst.backgroundDark)
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayMedium: GoogleFonts.baloo2().copyWith(
          fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
      displaySmall: GoogleFonts.baloo2().copyWith(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      headlineLarge: GoogleFonts.lato().copyWith(
          fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),
      headlineMedium: GoogleFonts.lato().copyWith(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
      headlineSmall: GoogleFonts.lato().copyWith(
          fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
      bodyMedium: GoogleFonts.lato().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        color: Colors.black.withOpacity(0.2),
      ),
      bodySmall: GoogleFonts.lato().copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Colors.black.withOpacity(0.6),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(ColorConst.backgroundDark),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(ColorConst.backgroundDark),
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayMedium: GoogleFonts.baloo2().copyWith(
          fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),
      displaySmall: GoogleFonts.baloo2().copyWith(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
      headlineLarge: GoogleFonts.lato().copyWith(
          fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white),
      headlineMedium: GoogleFonts.lato().copyWith(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
      headlineSmall: GoogleFonts.lato().copyWith(
          fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
      bodyMedium: GoogleFonts.lato().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        color: Colors.white.withOpacity(0.6),
      ),
      bodySmall: GoogleFonts.lato().copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Colors.white.withOpacity(0.6),
      ),
    ),
  );
}
