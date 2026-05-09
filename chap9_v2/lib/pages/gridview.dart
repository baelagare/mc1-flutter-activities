import 'package:flutter/material.dart';
import '../widgets/gridview_builder.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('grid view')),
      body: const SafeArea(
        child: GridViewBuilderWidget(),
      ),
    );
  }
}