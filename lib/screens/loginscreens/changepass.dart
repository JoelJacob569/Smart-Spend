import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/constants/text_strings.dart';

class Changepass extends StatefulWidget {
  const Changepass({super.key});

  @override
  State<Changepass> createState() => _ChangepassState();
}

class _ChangepassState extends State<Changepass> {
  final newcontroller = TextEditingController();
  final confirmcontroller = TextEditingController();
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
              child: buildpadding(),
            ),
          )
        ],
      ),
    );
  }

  Padding buildpadding() {
    return Padding(
      padding: const EdgeInsets.all(SSizes.mdsm),
      child: Column(
        children: [
          const Text(
            STexts.crnewPassword,
            style: TextStyle(
              fontSize: SSizes.fontSizexl,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: SSizes.mdsm),
          TextFormField(
            controller: newcontroller,
            decoration: const InputDecoration(
              labelText: STexts.newPassword,
            ),
          ),
          const SizedBox(height: SSizes.mdsm),
          TextFormField(
            controller: confirmcontroller,
            decoration: const InputDecoration(
              labelText: STexts.conPassword,
            ),
          ),
          const SizedBox(height: SSizes.mdsm),
          ElevatedButton(onPressed: () {}, child: const Text(STexts.submit))
        ],
      ),
    );
  }
}
