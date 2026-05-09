import 'package:flutter/material.dart';
import '../widgets/gridview_builder.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const GridViewBuilderWidget(),
    );
  }
}