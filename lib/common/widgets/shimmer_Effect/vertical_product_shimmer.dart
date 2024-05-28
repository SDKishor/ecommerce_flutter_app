import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/common/widgets/shimmer_Effect/shimmer_effect.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class VerticalShimmerEffect extends StatelessWidget {
  const VerticalShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 500,
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleContainer(
            height: 180,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundcolor: Colors.transparent,
            child: ShimmerEffect(
              width: double.infinity,
              hight: double.infinity,
              radius: 10,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems / 2,
          ),
          const Padding(
            padding: EdgeInsets.only(left: TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerEffect(
                  width: 130,
                  hight: 20,
                  radius: 5,
                ),
                SizedBox(height: TSizes.spaceBtwItems),
                ShimmerEffect(
                  width: 80,
                  hight: 15,
                  radius: 5,
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: TSizes.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ShimmerEffect(
                  width: 35,
                  hight: 20,
                  radius: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.cardRadiusMd),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
