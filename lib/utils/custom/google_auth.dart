import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/custom/or_divider.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
              iconSrc: SImages.google,
              press: () {},
              h: 50,
              w: 50,
            ),
            SocalIcon(
              iconSrc: SImages.facebook,
              press: () {},
              h: 35,
              w: 35,
            ),
          ],
        ),
      ],
    );
  }
}

class SocalIcon extends StatelessWidget {
  final String? iconSrc;
  final Function? press;
  final double? h;
  final double? w;
  const SocalIcon({
    super.key,
    this.iconSrc,
    this.press,
    this.h,
    this.w,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          //border: Border.all(),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconSrc!,
          height: h,
          width: w,
        ),
      ),
    );
  }
}
