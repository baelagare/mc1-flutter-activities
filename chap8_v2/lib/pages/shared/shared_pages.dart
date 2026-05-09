import 'package:flutter/material.dart';

class Birthdays extends StatelessWidget {
  final bool showAppBar;
  // Constructor accepts the toggle, defaults to false
  const Birthdays({super.key, this.showAppBar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Only render the AppBar if showAppBar is true
      appBar: showAppBar ? AppBar(title: const Text('Birthdays')) : null,
      body: const Center(child: Icon(Icons.cake, size: 120.0, color: Colors.orange)),
    );
  }
}

class GratitudeIcon extends StatelessWidget {
  final bool showAppBar;
  const GratitudeIcon({super.key, this.showAppBar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? AppBar(title: const Text('Gratitude')) : null,
      body: const Center(child: Icon(Icons.sentiment_satisfied, size: 120.0, color: Colors.lightGreen)),
    );
  }
}

class Reminders extends StatelessWidget {
  final bool showAppBar;
  const Reminders({super.key, this.showAppBar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? AppBar(title: const Text('Reminders')) : null,
      body: const Center(child: Icon(Icons.access_alarm, size: 120.0, color: Colors.purple)),
    );
  }
}