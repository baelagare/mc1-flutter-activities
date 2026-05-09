import 'package:flutter/material.dart';

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
          topRight: Radius.circular(10.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.blue.shade500],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Center(
        child: RichText(
          text: const TextSpan(
            text: 'Flutter ',
            style: TextStyle(
                fontSize: 24.0,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: 'Chapter 6 Activity',
                  style: TextStyle(color: Colors.deepOrange)),
            ],
          ),
        ),
      ),
    );
  }
}