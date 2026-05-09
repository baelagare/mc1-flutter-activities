import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/row_with_card.dart';
import '../widgets/row.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return HeaderWidget(index: index);
          } else if (index >= 1 && index <= 3) {
            return RowWithCardWidget(index: index);
          } else {
            return RowWidget(index: index);
          }
        },
      ),
    );
  }
}