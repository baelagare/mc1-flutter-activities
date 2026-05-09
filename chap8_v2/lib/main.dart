import 'package:flutter/material.dart';
import 'pages/navigator/nav_home.dart' as nav;
import 'pages/hero/hero_home.dart' as hero;
import 'pages/bottom_nav/bottom_nav_home.dart' as btm_nav;
import 'pages/bottom_app_bar/bottom_app_bar_home.dart' as btm_app_bar;
import 'pages/tab_bar/tab_bar_home.dart' as tab;
import 'pages/drawer/drawer_home.dart' as drawer;

void main() => runApp(const Chapter8App());

class Chapter8App extends StatelessWidget {
  const Chapter8App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chapter 8',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MasterLauncher(),
    );
  }
}

class MasterLauncher extends StatelessWidget {
  const MasterLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chapter 8')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => nav.Home())),
            child: const Text('1. Navigator App'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => hero.Home())),
            child: const Text('2. Hero Animation App'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => btm_nav.Home())),
            child: const Text('3. BottomNavigationBar App'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => btm_app_bar.Home())),
            child: const Text('4. BottomAppBar App'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => tab.Home())),
            child: const Text('5. TabBar App'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => drawer.Home())),
            child: const Text('6. Drawer App'),
          ),
        ],
      ),
    );
  }
}