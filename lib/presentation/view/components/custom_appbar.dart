
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  final String title;

  const DefaultAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
