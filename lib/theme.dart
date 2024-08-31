import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.grey[800]!, // Darker grey for secondary elements
    onSecondary: Colors.white, // Text color on secondary elements
    background: Colors.white, // Background color for the app
    onBackground: Colors.black, // Text color on background
    surface: Colors.grey[200]!, // Light grey for surfaces like cards
    onSurface: Colors.black, // Text color on surfaces
    error: Colors.red, // Error color
    onError: Colors.white,
      //tertiary: Colors.grey[2]// Text color on error
  )
);
ThemeData darkMode = ThemeData(

  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.white, // White color for primary elements in dark mode
    onPrimary: Colors.black, // Text color on primary elements
    secondary: Colors.grey[400]!, // Lighter grey for secondary elements
    onSecondary: Colors.black, // Text color on secondary elements
    background: Colors.black, // Background color for the app
    onBackground: Colors.white, // Text color on background
    surface: Colors.grey[850]!, // Dark grey for surfaces like cards
    onSurface: Colors.white, // Text color on surfaces
    error: Colors.red[400]!, // Error color
    onError: Colors.black, // Text color on error
  )
);