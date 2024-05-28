import 'package:ecommerce_app/common/widgets/shimmer_Effect/shimmer_effect.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryShimmerEffect extends StatelessWidget {
  const CategoryShimmerEffect({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, index) =>
              const SizedBox(width: TSizes.spaceBtwItems),
          itemBuilder: (_, index) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerEffect(
                  width: 55,
                  hight: 55,
                  radius: 55,
                ),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                ShimmerEffect(width: 55, hight: 8),
              ],
            );
          }),
    );
  }
}
