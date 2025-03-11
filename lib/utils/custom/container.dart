import 'package:flutter/material.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';
import 'package:smartspend/utils/constants/colors.dart';

class Customcontainer extends StatelessWidget {
  const Customcontainer(
      {super.key,
      required this.height,
      required this.width,
      required this.child});

  final double height;
  final double width;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: dark
            ? SColors.primary.withValues(alpha: 0.5)
            : SColors.primary.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
