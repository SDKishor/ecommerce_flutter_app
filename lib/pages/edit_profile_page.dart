import 'package:ecommerce_app/common/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/features/editprofilepage/widgets/edit_profile_page_widgets.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
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
                    const RoundedImage(
                      imagepath: TImageStrings.user,
                      backgroundColor: Colors.transparent,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
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
                onpress: () {},
                title: "Name",
                value: "Taraq Aziz",
              ),
              ProfileEditMenu(
                onpress: () {},
                title: "Username",
                value: "Taraq",
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
                value: "45824",
              ),
              ProfileEditMenu(
                onpress: () {},
                title: "E-mail",
                value: "taraqaziz1254@gamil.com",
              ),
              ProfileEditMenu(
                onpress: () {},
                title: "Phone Number",
                value: "+8801524863",
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
                  child: OutlinedButton(
                    child: const Text("Log Out"),
                    onPressed: () => AuthenticationRepo.instance.logout(),
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
