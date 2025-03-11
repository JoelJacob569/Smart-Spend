import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class Badgesedit extends StatefulWidget {
  const Badgesedit({super.key});

  @override
  State<Badgesedit> createState() => _BadgeseditState();
}

class _BadgeseditState extends State<Badgesedit> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badges'),
        iconTheme: IconThemeData(color: dark ? SColors.white : SColors.black),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Badges'),
          )
        ],
      ),
    );
  }
}
