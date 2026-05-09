import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Logger',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        bottomAppBarTheme: const BottomAppBarThemeData(color: Colors.teal),
      ),
      home: const Home(),
    );
  }
}