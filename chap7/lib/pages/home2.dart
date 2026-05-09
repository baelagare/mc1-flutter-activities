import 'package:flutter/material.dart';
import 'package:chap7/widgets/animated_balloon.dart'; // Import the new balloon widget

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.textAlign});

  final String title;
  final TextAlign textAlign;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(), // Stops the page from scrolling manually
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const <Widget>[
                AnimatedBalloonWidget(), // Render the balloon here
              ],
            ),
          ),
        ),
      ),
    );
  }
}