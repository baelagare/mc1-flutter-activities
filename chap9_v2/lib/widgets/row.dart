import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.directions_car,
        size: 48.0,
        color: Colors.lightGreen,
      ),
      title: Text('Car $index'),
      subtitle: const Text('Very Cool'),
      trailing: (index % 3).isEven
          ? const Icon(Icons.bookmark_border)
          : const Icon(Icons.bookmark),
      selected: false,
      onTap: () {
        print('Tapped on Row $index');
      },
    );
  }
}