import 'package:flutter/material.dart';

// Import the three modular pages we created
// Ensure these paths match your actual directory structure
import 'pages/gestures_drag_drop.dart';
import 'pages/gestures_scale.dart';
import 'pages/dismissible_list.dart';

void main() {
  runApp(const Chapter11App());
}

class Chapter11App extends StatelessWidget {
  const Chapter11App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 11 - Interactivity',
      // The chapter specifies lightGreen as the primary swatch
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainNavigator(),
      debugShowCheckedModeBanner: false, // Removes the debug banner
    );
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  // Tracks which tab is currently active
  int _selectedIndex = 0;

  // The list of our integrated pages
  final List<Widget> _pages = [
    GesturesDragDropPage(),
    GesturesScalePage(),
    DismissiblePage(),
  ];

  // Updates the state to switch the active tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack preserves the state of the pages. 
      // It renders all children but only shows the one at _selectedIndex.
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app),
            label: 'Gestures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.zoom_out_map),
            label: 'Scale & Move',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swipe),
            label: 'Dismissible',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen[800],
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Keeps all labels visible
      ),
    );
  }
}