import 'package:ecommerce_app/common/widgets/cart_widgets.dart';
import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/pages/success_page.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppbar(
        title: Text("Order Review"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                CartItems(
                  darkmode: darkmode,
                  showAddandRemoveBtn: false,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                CouponCode(darkmode: darkmode),
                const SizedBox(height: TSizes.spaceBtwSections),
                CircleContainer(
                  radius: TSizes.borderRadiusLg,
                  backgroundcolor: Colors.transparent,
                  border: true,
                  bordercolor: darkmode ? TColors.light : TColors.dark,
                  padding: const EdgeInsets.all(TSizes.md),
                  child: const Column(
                    children: [
                      BillingAmountSection(),
                      SizedBox(height: TSizes.spaceBtwItems),
                      Divider(),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      BillingPaymentSection(),
                      SizedBox(height: TSizes.spaceBtwItems),
                      Divider(),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      BillingAddressSection(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.offAll(SuccessPage(
                image: TImageStrings.successfulPaymentIcon,
                title: "Payment Successfull",
                subtitle: "Your item will be shipped soon!",
                onpressed: () => Get.offAll(() => const NavigationMenu())));
          },
          child: const Text("Confirm (\$256.0)"),
        ),
      ),
    );
  }
}

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          headingText: "Shipping Address",
          buttonText: "Change",
          onpressed: () {},
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Text(
          "Taraq aziz",
          style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }
}

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(
          headingText: "Payment Method",
          buttonText: "Change",
          onpressed: () {},
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const CircleContainer(
              width: 60,
              height: 35,
              backgroundcolor: Colors.transparent,
              padding: EdgeInsets.all(TSizes.sm),
              child: Image(
                image: AssetImage(TImageStrings.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              "Paypal",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$256.0",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shiping Fees",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$6.0",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tax Fee",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$6.0",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order Total",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$268.0",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        )
      ],
    );
  }
}

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
    required this.darkmode,
  });

  final bool darkmode;

  @override
  Widget build(BuildContext context) {
    return CircleContainer(
      radius: TSizes.borderRadiusLg,
      backgroundcolor: Colors.transparent,
      border: true,
      bordercolor: darkmode ? TColors.light : TColors.dark,
      padding: const EdgeInsets.all(TSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Have a promo code? Enter here",
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: darkmode
                      ? TColors.white.withOpacity(.5)
                      : TColors.dark.withOpacity(.5),
                  backgroundColor: TColors.grey.withOpacity(.2),
                  side: BorderSide(color: TColors.grey.withOpacity(.1))),
              child: const Text("Apply"),
            ),
          )
        ],
      ),
    );
  }
}
