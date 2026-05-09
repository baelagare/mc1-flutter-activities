import 'package:flutter/material.dart';
import 'listview.dart';
import 'gridview.dart';
import 'stack.dart';
import 'customscrollview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // A list of our 4 pages
  final List<Widget> _pages = [
    const ListViewPage(),
    const GridViewPage(),
    const StackPage(),
    const CustomScrollViewPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Shows the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the screen when tapped
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: 'Grid'),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Stack'),
          BottomNavigationBarItem(icon: Icon(Icons.view_day), label: 'Slivers'),
        ],
      ),
    );
  }
}