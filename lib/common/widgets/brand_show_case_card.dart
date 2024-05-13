import 'package:ecommerce_app/common/widgets/brand_card.dart';
import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.darkmode,
    required this.images,
  });

  final bool darkmode;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CircleContainer(
      padding: const EdgeInsets.all(TSizes.md),
      radius: 20,
      border: true,
      bordercolor: TColors.grey,
      backgroundcolor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          BrandCard(
            darkmode: darkmode,
            border: false,
          ),
          Row(
            children: images
                .map((image) => brandTopProductImage(image, darkmode))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImage(String imagepath, bool darkmode) {
    return Expanded(
      child: CircleContainer(
        radius: 14,
        height: 100,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        backgroundcolor: darkmode ? TColors.darkGrey : TColors.grey,
        child: Image(
          image: AssetImage(imagepath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
