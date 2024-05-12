import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    required this.darkmode,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.iconColor,
    required this.icon,
  });

  final bool darkmode;
  final IconData icon;
  final double? width, height, size;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: darkmode
            ? TColors.dark.withOpacity(.9)
            : TColors.light.withOpacity(.9),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: iconColor,
          size: size,
        ),
      ),
    );
  }
}
