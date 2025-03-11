import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class SmallIcon extends StatelessWidget {
  final IconData? iconSrc;
  final Function? press;
  final double? h;
  final double? w;
  const SmallIcon({
    super.key,
    this.iconSrc,
    this.press,
    this.h,
    this.w,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            //border: Border.all(),
            shape: BoxShape.circle,
            color: dark
                ? SColors.primary.withAlpha(2)
                : SColors.primary.withAlpha(5),
          ),
          child: Icon(iconSrc)),
    );
  }
}
