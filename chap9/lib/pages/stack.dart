import 'package:flutter/material.dart';
import '../widgets/stack.dart';
import '../widgets/stack_favorite.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          if (index.isEven) {
            return const StackWidget();
          } else {
            return const StackFavoriteWidget();
          }
        },
      ),
    );
  }
}