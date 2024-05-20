import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/features/common/user_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthPage extends StatelessWidget {
  const ReAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          "Verify user",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Re-Authenticate User",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Form(
              key: controller.reAuthFormKey,
              child: Column(children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: TTexts.email),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        TValidator.validateEmptyText("Password", value),
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: TTexts.password,
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: controller.hidePassword.value
                                ? const Icon(Iconsax.eye_slash)
                                : const Icon(Iconsax.eye))),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.reAuthenticateUserAndDeleteUser(),
                  child: const Text("Delete")),
            ),
          ],
        ),
      ),
    );
  }
}
