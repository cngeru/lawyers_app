import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawyers/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lawyers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Color(0xFF581954),
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: '/onboarding',
      routes: {
        '/': (context) => Home(),
        '/onboarding': (context) => Onboarding(),
        '/lawyer': (context) => Lawyer(),
      },
    );
  }
}
