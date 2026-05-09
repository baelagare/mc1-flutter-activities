import 'package:flutter/material.dart';

class HeroAnimationActivityScreen extends StatelessWidget {
  const HeroAnimationActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade200, title: const Text('Hero Animation')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const _HeroFlyScreen()),
              );
            },
            child: const Hero(
              tag: 'format_paint',
              child: Icon(
                Icons.format_paint,
                color: Colors.lightGreen,
                size: 120,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroFlyScreen extends StatelessWidget {
  const _HeroFlyScreen();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.shortestSide / 2;
    return Scaffold(
      appBar: AppBar(title: const Text('Fly')),
      body: SafeArea(
        child: Hero(
          tag: 'format_paint',
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.format_paint, color: Colors.lightGreen, size: width),
          ),
        ),
      ),
    );
  }
}
