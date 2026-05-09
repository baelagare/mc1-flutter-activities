import 'package:flutter/material.dart';
import 'package:chap7/pages/home.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chap7',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 17, 252)),
      ),
      home: const MyHomePage(title: 'Home', textAlign: TextAlign.center), 
    );
  }
}