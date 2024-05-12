import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TShadowStyle {
  TShadowStyle._();

  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(.1),
    blurRadius: 5,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(.1),
    blurRadius: 5,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
