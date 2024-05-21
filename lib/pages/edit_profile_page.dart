import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/common/widgets/shimmer_effect.dart';
import 'package:ecommerce_app/features/editprofilepage/widgets/edit_profile_page_widgets.dart';
import 'package:ecommerce_app/features/common/user_controller.dart';
import 'package:ecommerce_app/pages/change_name_page.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
    final controller = UserController.instance;

    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: const Text("Profile"),
        iconColor: darkmode ? TColors.light : TColors.dark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : TImageStrings.user;

                      return controller.imageUploading.value
                          ? const ShimmerEffect(
                              width: 80,
                              hight: 80,
                              radius: 80,
                            )
                          : RoundedImage(
                              isNetworkImage: networkImage.isNotEmpty,
                              imagepath: image,
                              backgroundColor: Colors.transparent,
                              width: 80,
                              height: 80,
                            );
                    }),
                    TextButton(
                        onPressed: () {
                          controller.uploadUserProfilePicture();
                        },
                        child: const Text("change Profile Picture"))
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const SectionHeading(
                headingText: "Profile Information",
                showButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ProfileEditMenu(
                onpress: () {
                  Get.to(() => const ChangeNamePage());
                },
                title: "Name",
                value: controller.user.value.fullName,
              ),
              ProfileEditMenu(
                onpress: () {},
                title: "Username",
                value: controller.user.value.username,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const SectionHeading(
                headingText: "Personal Information",
                showButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ProfileEditMenu(
                onpress: () {},
                title: "User ID",
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              ProfileEditMenu(
                onpress: () {},
                title: "E-mail",
                value: controller.user.value.email,
              ),
              ProfileEditMenu(
                onpress: () {},
                title: "Phone No. ",
                value: controller.user.value.phoneNumber,
              ),
              ProfileEditMenu(
                onpress: () {},
                title: "Gender",
                value: "Male",
              ),
              ProfileEditMenu(
                onpress: () {},
                title: "Date of Birth",
                value: "10 oct 1997",
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    child: const Text("Delete Account"),
                    onPressed: () => controller.deleteAccountPopup(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
