import 'package:flutter/material.dart';
import 'pages/listview.dart';
import 'pages/gridview.dart';
import 'pages/stack.dart';
import 'pages/slivers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chap9',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chapter 9')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ListViewPage())),
            child: const Text('list view'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const GridViewPage())),
            child: const Text('grid view'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StackPage())),
            child: const Text('stack'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SliversPage())),
            child: const Text('slivers'),
          ),
        ],
      ),
    );
  }
}