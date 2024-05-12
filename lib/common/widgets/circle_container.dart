import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.child,
      this.radius = 400,
      this.padding = 0,
      this.backgroundcolor = TColors.white,
      this.margin});

  final double? width;
  final double? height;
  final Widget? child;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Color? backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcolor,
      ),
      child: child,
    );
  }
}
