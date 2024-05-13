import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    this.iconColor = TColors.white,
    required this.onpressed,
    required this.darkmode,
  });

  final Color? iconColor;
  final VoidCallback onpressed;
  final bool darkmode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onpressed,
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: darkmode ? TColors.light : TColors.dark,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text("2",
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: darkmode ? TColors.dark : TColors.light,
                        fontSizeFactor: .8)),
              ),
            ))
      ],
    );
  }
}
