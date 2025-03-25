import 'package:flutter/material.dart';

class DayNightAnimation extends StatefulWidget {
  final int time;
  final bool isPlaying;
  const DayNightAnimation({super.key, required this.time, required this.isPlaying});

  @override
  State<DayNightAnimation> createState() => _DayNightAnimationState();
}

class _DayNightAnimationState extends State<DayNightAnimation>
    with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.time),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuint)
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant DayNightAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying) {
      if (_animation.value == 1) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    } else {
      _controller.stop();
    }
  }
}
