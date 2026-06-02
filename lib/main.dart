import 'package:dartby/mobile_apps.dart';
import 'package:dartby/homes.dart';
import 'package:dartby/Mobile%20view/project.dart';
import 'package:dartby/weather.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dartby',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Color.fromARGB(255, 32, 32, 32),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
      ),
      home: Homes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
