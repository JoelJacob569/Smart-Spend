import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/constants/text_strings.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        iconTheme: IconThemeData(color: dark ? Colors.white : Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/SS.jpg'))),
            ),
            const Text(
              STexts.appName,
              style: TextStyle(
                fontSize: SSizes.lg,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Version 1.0',
            ),
          ],
        ),
      ),
    );
  }
}
