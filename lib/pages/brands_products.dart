import 'package:ecommerce_app/common/widgets/brand_card.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandsProducts extends StatelessWidget {
  const BrandsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppbar(
        showBackArrow: true,
        title: Text("Nike"),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  BrandCard(darkmode: darkmode),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // const SortableProducts(),
                ],
              ))),
    );
  }
}
