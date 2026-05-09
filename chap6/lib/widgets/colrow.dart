import 'package:flutter/material.dart';

class ColumnAndRowNestingWidget extends StatelessWidget {
  const ColumnAndRowNestingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('column item 1 ni'),
        const Text('column item 2 ni'),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(onPressed: () {}, child: const Text('tuploka ko (row 1)')),
            TextButton(onPressed: () {}, child: const Text('tuploka ko (row 2)')),
          ],
        ),
      ],
    );
  }
}