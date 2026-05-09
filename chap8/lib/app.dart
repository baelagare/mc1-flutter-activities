import 'package:flutter/material.dart';

import 'features/bottom_app_bar/presentation/screens/bottom_app_bar_activity_screen.dart';
import 'features/bottom_navigation/presentation/screens/bottom_navigation_activity_screen.dart';
import 'features/drawer/presentation/screens/drawer_activity_screen.dart';
import 'features/hero_animation/presentation/screens/hero_animation_activity_screen.dart';
import 'features/navigator/presentation/screens/navigator_activity_screen.dart';
import 'features/tabbar/presentation/screens/tabbar_activity_screen.dart';

class Chapter8ActivitiesApp extends StatelessWidget {
  const Chapter8ActivitiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chapter 8 Activities',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ActivityMenuScreen(),
    );
  }
}

class ActivityMenuScreen extends StatelessWidget {
  const ActivityMenuScreen({super.key});

  static final List<_ActivityEntry> _activities = [
    _ActivityEntry(
      title: 'Navigator',
      builder: (_) => const NavigatorActivityScreen(),
    ),
    _ActivityEntry(
      title: 'Drawer',
      builder: (_) => const DrawerActivityScreen(),
    ),
    _ActivityEntry(
      title: 'TabBar',
      builder: (_) => const TabBarActivityScreen(),
    ),
    _ActivityEntry(
      title: 'Bottom Navigation Bar',
      builder: (_) => const BottomNavigationActivityScreen(),
    ),
    _ActivityEntry(
      title: 'Bottom App Bar',
      builder: (_) => const BottomAppBarActivityScreen(),
    ),
    _ActivityEntry(
      title: 'Hero Animation',
      builder: (_) => const HeroAnimationActivityScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chapter 8 Activities')),
      body: ListView.separated(
        itemCount: _activities.length,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final activity = _activities[index];
          return Card(
            child: ListTile(
              key: ValueKey(activity.title),
              title: Text(activity.title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: activity.builder),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ActivityEntry {
  const _ActivityEntry({
    required this.title,
    required this.builder,
  });

  final String title;
  final WidgetBuilder builder;
}
