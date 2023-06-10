import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_arth_app/reception/agent_home_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final MaterialColor darkgreen = const MaterialColor(
    0xFF2D494C,
    <int, Color>{
      50: Color(0xFF2D494C),
      100: Color(0xFF2D494C),
      200: Color(0xFF2D494C),
      300: Color(0xFF2D494C),
      400: Color(0xFF2D494C),
      500: Color(0xFF2D494C),
      600: Color(0xFF2D494C),
      700: Color(0xFF2D494C),
      800: Color(0xFF2D494C),
      900: Color(0xFF2D494C),
    },
  );
  final MaterialColor lightgreen = const MaterialColor(
    0xFFECF2F0,
    <int, Color>{
      50: Color(0xFFECF2F0),
      100: Color(0xFFECF2F0),
      200: Color(0xFFECF2F0),
      300: Color(0xFFECF2F0),
      400: Color(0xFFECF2F0),
      500: Color(0xFFECF2F0),
      600: Color(0xFFECF2F0),
      700: Color(0xFFECF2F0),
      800: Color(0xFFECF2F0),
      900: Color(0xFFECF2F0),
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hôtel Arth',
      theme: ThemeData(
        primarySwatch: darkgreen,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.getFont('Roboto'),
          headlineLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
          headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
      home: HomePage(),
    );
  }
}


