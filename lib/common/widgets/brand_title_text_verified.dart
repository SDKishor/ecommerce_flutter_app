import 'package:ecommerce_app/common/widgets/brand_title_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandTitleTextWithVarifiedIcon extends StatelessWidget {
  const BrandTitleTextWithVarifiedIcon({
    super.key,
    required this.title,
    this.maxline = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxline;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BrandTitleText(
          title: title,
          maxlines: maxline,
          brandTextSize: brandTextSize,
          textAlign: textAlign,
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        const Icon(Iconsax.verify5,
            color: TColors.primary, size: TSizes.iconXs),
      ],
    );
  }
}
