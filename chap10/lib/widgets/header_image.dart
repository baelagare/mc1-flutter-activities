import 'package:flutter/material.dart';

class JournalHeaderImage extends StatelessWidget {
  const JournalHeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage('assets/images/present.jpg'),
      fit: BoxFit.cover,
    );
  }
}