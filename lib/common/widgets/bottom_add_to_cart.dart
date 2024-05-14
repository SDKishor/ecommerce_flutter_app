import 'package:ecommerce_app/common/widgets/circular_icon.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.darkmode});
  final bool darkmode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: TSizes.defaultSpace / 2, horizontal: TSizes.defaultSpace),
      decoration: BoxDecoration(
        color: darkmode ? TColors.darkerGrey : TColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                darkmode: darkmode,
                icon: Iconsax.minus,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(
                "2",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              CircularIcon(
                darkmode: darkmode,
                icon: Iconsax.add,
                width: 40,
                height: 40,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.sm),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black)),
            child: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
