import 'package:flutter/material.dart';

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget({super.key});

  @override
  AnimatedBalloonWidgetState createState() => AnimatedBalloonWidgetState();
}

// Notice we changed this to SingleTickerProviderStateMixin
class AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with SingleTickerProviderStateMixin {
  
  // We only need ONE controller now
  late AnimationController _controller;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    // Setting the single master duration to 4 seconds
    _controller = AnimationController(duration: const Duration(seconds: 4), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double balloonHeight = MediaQuery.of(context).size.height / 2;
    double balloonWidth = MediaQuery.of(context).size.height / 3;
    double balloonBottomLocation = MediaQuery.of(context).size.height - balloonHeight;

    // Float uses Interval(0.0, 1.0) - runs 100% of the time
    _animationFloatUp = Tween(begin: balloonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    // Grow uses Interval(0.0, 0.5) - stops growing halfway through the animation
    _animationGrowSize = Tween(begin: 50.0, end: balloonWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticInOut),
      ),
    );

    // Start the single controller automatically
    _controller.forward();

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
          ),
          width: _animationGrowSize.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          // Play forward or reverse using just the single controller
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Image.asset(
          'assets/images/balloon.png',
          height: balloonHeight,
          width: balloonWidth,
        ),
      ),
    );
  }
}