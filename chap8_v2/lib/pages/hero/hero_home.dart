import 'package:flutter/material.dart';
import 'fly.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation'), backgroundColor: Colors.green,),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: GestureDetector(
            child: Hero(
              tag: 'format_paint',
              child: Icon(Icons.format_paint, color: Colors.lightGreen, size: 120.0),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Fly()));
            },
          ),
        ),
      ),
    );
  }
}