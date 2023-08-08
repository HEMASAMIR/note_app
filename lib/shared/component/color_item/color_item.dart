import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: color,
            radius: 35.0,
            child: const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
            ),
          )
        : CircleAvatar(
            radius: 35.0,
            backgroundColor: color,
            // radius: 30.0,
          );
  }
}
