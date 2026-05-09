import 'package:flutter/material.dart';
import 'package:chap7/widgets/animated_container.dart';
import 'package:chap7/widgets/animated_crossfade.dart';
import 'package:chap7/widgets/animated_opacity.dart';
import 'package:chap7/widgets/animated_balloon.dart';

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
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 98, 151, 212),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        // The Stack widget allows us to layer UI elements along the Z-axis
        child: Stack(
          children: <Widget>[
            // ==========================================
            // LAYER 1 (Background): The 3 Implicit Animations
            // ==========================================
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Adds a nice breathing room around the edges
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Keeps your boxes anchored to the left
                  children: const <Widget>[
                    AnimatedContainerWidget(),
                    Divider(),
                    AnimatedCrossFadeWidget(),
                    Divider(),
                    AnimatedOpacityWidget(),
                  ],
                ),
              ),
            ),
            
            // ==========================================
            // LAYER 2 (Foreground): The Explicit Balloon Animation
            // ==========================================
            // Align pushes the balloon to the right side so it doesn't cover your left-aligned buttons
            const Align(
              alignment: Alignment.topRight, 
              child: Padding(
                padding: EdgeInsets.only(right: 32.0), // Keeps the balloon from hugging the exact edge of the browser
                child: AnimatedBalloonWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}