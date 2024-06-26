import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer(
      {super.key,
      this.width,
      this.height,
      this.child,
      this.radius = 400,
      this.padding,
      this.backgroundcolor = TColors.white,
      this.margin,
      this.bordercolor = TColors.black,
      this.border = false});

  final double? width;
  final double? height;
  final Widget? child;
  final double radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color backgroundcolor, bordercolor;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        border: border ? Border.all(width: 1.0, color: bordercolor) : null,
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcolor,
      ),
      child: child,
    );
  }
}
