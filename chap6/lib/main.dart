import 'package:flutter/material.dart';
import 'pages/home.dart'; 

void main() => runApp(const Chapter6App());

class Chapter6App extends StatelessWidget {
  const Chapter6App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 6 Activity',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const Home(), 
    );
  }
}