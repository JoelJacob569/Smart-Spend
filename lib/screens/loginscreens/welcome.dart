import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartspend/screens/loginscreens/login.dart';
import 'package:smartspend/screens/loginscreens/signup.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/constants/text_strings.dart';
import 'package:smartspend/utils/custom/or_divider.dart';
import 'package:smartspend/utils/custom/wavecontainer.dart';

class Welcompage extends StatelessWidget {
  const Welcompage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: height * 0.5,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  color: SColors.secondary,
                  image: DecorationImage(
                      image: AssetImage(SImages.bg1), fit: BoxFit.cover),
                ),
                height: 350,
              ),
            ),
          ),
          Positioned(
            top: height * 0.3,
            left: width * 0.1,
            right: width * 0.1,
            child: Container(
              height: height * 0.23,
              width: width * 0.23,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(SImages.appLogo),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.53,
            left: width * 0.3,
            right: width * 0.3,
            child: const Text(
              STexts.appName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SSizes.fontSizexxl,
              ),
            ),
          ),
          Positioned(
            top: height * 0.6,
            left: width * 0.1,
            right: width * 0.1,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const Loginpage());
              },
              child: const Text(STexts.login),
            ),
          ),
          Positioned(
            top: height * 0.67,
            right: width * 0.1,
            left: width * 0.1,
            child: const OrDivider(),
          ),
          Positioned(
            top: height * 0.7,
            left: width * 0.1,
            right: width * 0.1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: SColors.primary.withValues(alpha: 0.9)),
              onPressed: () {
                Get.to(() => const Signuppage());
              },
              child: const Text(
                STexts.signup,
                style: TextStyle(color: SColors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
