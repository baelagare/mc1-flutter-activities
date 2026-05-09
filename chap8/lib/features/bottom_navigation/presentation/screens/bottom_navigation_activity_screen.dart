import 'package:flutter/material.dart';

class BottomNavigationActivityScreen extends StatefulWidget {
  const BottomNavigationActivityScreen({super.key});

  @override
  State<BottomNavigationActivityScreen> createState() => _BottomNavigationActivityScreenState();
}

class _BottomNavigationActivityScreenState extends State<BottomNavigationActivityScreen> {
  static const _pages = [
    _IconPage(icon: Icons.cake, color: Colors.orange),
    _IconPage(icon: Icons.sentiment_satisfied, color: Colors.lightGreen),
    _IconPage(icon: Icons.access_alarm, color: Colors.purple),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade200, title: const Text('BottomNavigationBar')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: 'Birthdays'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: 'Gratitude',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: 'Reminders'),
        ],
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
      ),
    );
  }
}

class _IconPage extends StatelessWidget {
  const _IconPage({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(child: Icon(icon, size: 120, color: color));
  }
}
