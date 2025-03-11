import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class Custombutton extends StatelessWidget {
  final String? text;
  final Function? press;

  const Custombutton({
    super.key,
    required this.text,
    required this.press,
  });
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return ElevatedButton(
      onPressed: press as void Function()?,
      style: ElevatedButton.styleFrom(
        backgroundColor: dark ? SColors.buttonSecondary : SColors.buttonPrimary,
        fixedSize: const Size(350, 50),
      ),
      child: Text(
        text as String,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
