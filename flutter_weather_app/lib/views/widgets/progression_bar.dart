import 'package:flutter/material.dart';

class CustomProgressionBar extends StatefulWidget {
  const CustomProgressionBar({super.key});

  @override
  State<CustomProgressionBar> createState() => _CustomProgressionBarState();
}

class _CustomProgressionBarState extends State<CustomProgressionBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 60),
      vsync: this,
    );

    _controller.addListener(() {
      final value = _controller.value;
      if (value >= 0.1 && value < 0.2) {
        // first part - execute function 1
      } else if (value >= 0.2 && value < 0.3) {
        // second part - execute function 2
      }
      // and so on ...
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ...
        );
  }
}
