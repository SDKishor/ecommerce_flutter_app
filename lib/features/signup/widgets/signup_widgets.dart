import 'package:ecommerce_app/features/signup/controllers/signup_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.isdark,
  });

  final bool isdark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText(TTexts.firstName, value),
                  controller: controller.firstname,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText(TTexts.lastName, value),
                  controller: controller.lastname,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            validator: (value) =>
                TValidator.validateEmptyText(TTexts.username, value),
            controller: controller.username,
            decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Obx(
            () => TextFormField(
              validator: (value) => TValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidepassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidepassword.value =
                          !controller.hidepassword.value,
                      icon: controller.hidepassword.value
                          ? const Icon(Iconsax.eye_slash)
                          : const Icon(Iconsax.eye))),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Obx(
                  () => Checkbox(
                    value: controller.privacyPolicy.value,
                    onChanged: (value) {
                      controller.privacyPolicy.value =
                          !controller.privacyPolicy.value;
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: TTexts.iAgreeTo,
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: TTexts.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: isdark ? TColors.white : TColors.primary,
                          decoration: TextDecoration.underline)),
                  TextSpan(
                      text: " ${TTexts.and} ",
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: TTexts.termsOfUse,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: isdark ? TColors.white : TColors.primary,
                          decoration: TextDecoration.underline)),
                ]),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  controller.signup();
                },
                child: const Text(TTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
