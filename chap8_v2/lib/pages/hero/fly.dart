import 'package:flutter/material.dart';

class Fly extends StatelessWidget {
  const Fly({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.shortestSide / 2;
    return Scaffold(
      appBar: AppBar(title: Text('Fly')),
      body: SafeArea(
        child: Hero(
          tag: 'format_paint',
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.format_paint, color: Colors.lightGreen, size: width),
          ),
        ),
      ),
    );
  }
}