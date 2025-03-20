import 'package:flutter/material.dart';

class Gesbutton extends StatelessWidget {
  const Gesbutton({super.key, required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: child,
      ),
    );
  }
}
