import 'package:flutter/material.dart';

// Import the Home page we just built
import 'pages/home.dart'; 

void main() {
  // This is the literal starting point of your application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal Layout App',
      // This hides the small red "DEBUG" banner in the top right corner
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // This tells Flutter which screen to load first
      home: const Home(), 
    );
  }
}