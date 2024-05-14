import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddressCard extends StatelessWidget {
  const SingleAddressCard({
    super.key,
    required this.darkmode,
    this.selectedAddress = false,
  });

  final bool darkmode, selectedAddress;
  @override
  Widget build(BuildContext context) {
    return CircleContainer(
      radius: 20,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      width: double.infinity,
      border: true,
      backgroundcolor: selectedAddress ? TColors.primary : Colors.transparent,
      bordercolor: selectedAddress
          ? Colors.transparent
          : darkmode
              ? TColors.darkerGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? darkmode
                      ? TColors.light
                      : TColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Doe",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm),
              const Text(
                "(+125) 456 5821",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                "2545 timmy chloe, south liana, maine, USA",
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
