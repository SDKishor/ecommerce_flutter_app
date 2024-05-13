import 'package:ecommerce_app/common/widgets/brand_title_text_verified.dart';
import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/common/widgets/rounded_image.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.darkmode,
    this.border = true,
  });

  final bool darkmode;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleContainer(
        radius: 20,
        padding: const EdgeInsets.all(TSizes.sm),
        border: border,
        bordercolor: darkmode ? TColors.light : TColors.dark,
        backgroundcolor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: RoundedImage(
                imagepath: TImageStrings.clothIcon,
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(8),
                width: 56,
                height: 56,
                imageColor: darkmode ? TColors.light : TColors.dark,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandTitleTextWithVarifiedIcon(
                    title: "Nike",
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "256 Products ",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
