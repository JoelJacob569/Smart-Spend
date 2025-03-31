import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/custom/customcon.dart';

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
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomCon(
                  width: 50,
                  height: 50,
                  imageUrl: 'assets/images/b1.jpg',
                ),
                SizedBox(width: 30),
                CustomCon(
                  width: 50,
                  height: 50,
                  imageUrl: 'assets/images/b2.jpg',
                ),
                SizedBox(width: 30),
                CustomCon(
                  width: 50,
                  height: 50,
                  imageUrl: 'assets/images/b3.jpg',
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomCon(
              width: 50,
              height: 50,
              imageUrl: 'assets/images/b4.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
