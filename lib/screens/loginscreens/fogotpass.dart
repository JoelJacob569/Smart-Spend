import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartspend/screens/loginscreens/changepass.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/constants/text_strings.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({super.key});

  @override
  State<Forgotpass> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  bool showSecondTextField = false;
  final mycontroller = TextEditingController();
  String otp = '';

  void navigateToNextPage() {
    Get.to(() => const Changepass());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(SImages.bg2), fit: BoxFit.cover)),
          ),
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.053,
            child: Container(
              height: size.height * 0.62,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: SColors.grey.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(SSizes.borderRadiusxl),
              ),
              child: buildcolumn(),
            ),
          )
        ],
      ),
    );
  }

  Padding buildcolumn() {
    return Padding(
      padding: const EdgeInsets.all(SSizes.mdsm),
      child: Column(
        children: [
          const Text(
            STexts.ephoneno,
            style: TextStyle(
              fontSize: SSizes.fontSizexl,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: SSizes.smd),
          TextFormField(
            decoration: const InputDecoration(
              labelText: STexts.phoneNo,
            ),
          ),
          const SizedBox(height: SSizes.smd),
          if (showSecondTextField)
            Column(
              children: [
                const SizedBox(height: SSizes.ssm),
                TextFormField(
                  onChanged: (value) {
                    otp = value;
                  },
                  decoration: InputDecoration(
                    labelText: STexts.eotp,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SSizes.textfieldRadius),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(STexts.reotp),
                    ),
                  ],
                ),
              ],
            ),
          ElevatedButton(
              onPressed: () {
                if (showSecondTextField) {
                  if (otp == '123456') {
                    navigateToNextPage();
                  } else {
                    // Handle incorrect OTP
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(STexts.inotp),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                } else {
                  setState(() {
                    showSecondTextField = true;
                  });
                }
              },
              child: const Text(STexts.verify))
        ],
      ),
    );
  }
}
