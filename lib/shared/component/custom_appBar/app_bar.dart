import 'package:flutter/material.dart';

import '../custom_search/search.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
    required this.icon,
  });
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25.0),
        ),
        const Spacer(),
        IconButton(
          icon: CustomSearch(icon: icon),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
