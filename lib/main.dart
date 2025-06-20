import 'package:dartby/home.dart';
import 'package:dartby/project.dart';
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
        brightness: Brightness.light,
        useMaterial3: true,
        
        primarySwatch: Colors.deepOrange,
         textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black), 
       bodyMedium:  TextStyle(color: Colors.black),
       bodySmall:  TextStyle(color: Colors.black),
      
        ),
        // Other theme settings...
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Dark theme
        useMaterial3: true,
        // Define your dark theme here
        primarySwatch: Colors.deepOrange,
         scaffoldBackgroundColor: Color.fromARGB(255, 32, 32, 32),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white), 
       bodyMedium:  TextStyle(color: Colors.white),
       bodySmall:  TextStyle(color: Colors.white),
      
        ),
    
      ),
      themeMode: ThemeMode.system,  
      home:Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}



