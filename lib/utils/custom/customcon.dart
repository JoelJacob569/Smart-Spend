import 'package:flutter/material.dart';
import 'package:smartspend/utils/custom/customprogress.dart';

class CustomCon extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  final bool showProgressIndicator;
  final Color backgroundColor;

  const CustomCon({
    super.key,
    required this.width,
    required this.height,
    this.imageUrl,
    this.showProgressIndicator = true,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imageUrl!,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
          const Positioned(
            top: 80,
            left: 5,
            right: 5,
            child: CustomProgressBar(progress: 0),
          )
        ],
      ),
    );
  }
}
