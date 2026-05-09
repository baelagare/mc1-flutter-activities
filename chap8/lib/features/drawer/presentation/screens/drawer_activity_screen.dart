import 'package:flutter/material.dart';

class DrawerActivityScreen extends StatelessWidget {
  const DrawerActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade200, title: const Text('Drawer')),
      drawer: const _ActivityDrawer(),
      endDrawer: const _ActivityDrawer(),
      body: const SafeArea(
        child: Center(
          child: Text('Open left or right drawer'),
        ),
      ),
    );
  }
}

class _ActivityDrawer extends StatelessWidget {
  const _ActivityDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Icon(Icons.face, size: 96, color: Colors.white70),
          ),
          _ActivityListTile(
            icon: Icons.cake,
            title: 'Birthdays',
            color: Colors.orange,
          ),
          _ActivityListTile(
            icon: Icons.sentiment_satisfied,
            title: 'Gratitude',
            color: Colors.lightGreen,
          ),
          _ActivityListTile(
            icon: Icons.alarm,
            title: 'Reminders',
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class _ActivityListTile extends StatelessWidget {
  const _ActivityListTile({
    required this.icon,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => _DrawerItemScreen(
              title: title,
              icon: icon,
              color: color,
            ),
          ),
        );
      },
    );
  }
}

class _DrawerItemScreen extends StatelessWidget {
  const _DrawerItemScreen({
    required this.title,
    required this.icon,
    required this.color,
  });

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Icon(icon, size: 120, color: color)),
    );
  }
}
