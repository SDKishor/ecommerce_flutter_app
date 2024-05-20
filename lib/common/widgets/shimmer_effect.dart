import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect(
      {super.key,
      required this.width,
      required this.hight,
      this.radius = 15,
      this.color});

  final double width, hight, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: darkmode ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: darkmode ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: hight,
        decoration: BoxDecoration(
            color: color ?? (darkmode ? TColors.darkGrey : TColors.white),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
