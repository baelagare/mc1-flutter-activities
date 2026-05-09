import 'package:flutter/material.dart';

class ImagesAndIconWidget extends StatelessWidget {
  const ImagesAndIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.network(
          'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExM2EzczA4djBobXNha21iZDU3cTAwbGtxNjFkaXhkOTR5NDBidXI2bSZlcD12MV9naWZzX3NlYXJjaCZjdD1n/AzXwvGVdvtp1KD1G2O/giphy.gif',
          width: MediaQuery.of(context).size.width / 4,
          fit: BoxFit.cover,
        ),
        const Icon(
          Icons.camera,
          color: Colors.lightBlue,
          size: 48.0,
        ),
      ],
    );
  }
}