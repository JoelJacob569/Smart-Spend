import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({super.key});

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    // Simulate a long-running task with progress updates
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        progressValue += 0.25;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        progressValue += 0.25;
      });
    });
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        progressValue = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: SColors.grey,
        ),
        child: Stack(
          children: [
            Container(
              width: progressValue * 400,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: SColors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
