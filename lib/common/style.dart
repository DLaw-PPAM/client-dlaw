import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const black = Color(0xFF1A1A1A);
const grey = Color(0xFFA5A5A5);
const lightGrey = Color.fromARGB(255, 220, 223, 230);
const white = Colors.white;
const backgroundColor1 = Color.fromRGBO(57, 57, 57, 1);
const backgroundColor2 = Color(0x00000000);

final TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.montserrat(
    fontSize: 92,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  displayMedium: GoogleFonts.montserrat(
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  displaySmall: GoogleFonts.montserrat(
    fontSize: 46,
    fontWeight: FontWeight.w400,
  ),
  headlineMedium: GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headlineSmall: GoogleFonts.montserrat(
    fontSize: 23,
    fontWeight: FontWeight.w400,
  ),
  titleLarge: GoogleFonts.montserrat(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleMedium: GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: GoogleFonts.montserrat(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyLarge: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyMedium: GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  labelLarge: GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  bodySmall: GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  labelSmall: GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);

ThemeData primaryTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: Colors.yellow,
        onPrimary: black,
        secondary: backgroundColor1,
        onSecondary: Colors.white,
      ),
  scaffoldBackgroundColor: Colors.white,
  dividerColor: const Color(0xFFD8D8D8),
  textTheme: textTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: backgroundColor1,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: backgroundColor1,
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.yellow,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
    selectedIconTheme: IconThemeData(size: 30.0),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
  ),
);
