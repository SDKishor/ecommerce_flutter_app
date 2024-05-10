import 'package:ecommerce_app/common/style/spacing_style.dart';
import 'package:ecommerce_app/common/widgets/form_divider.dart';
import 'package:ecommerce_app/common/widgets/social_btns.dart';
import 'package:ecommerce_app/features/login/widgets/login_widgets.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = THelperFunctions.isDarkMode(context);
    final dividertext = TTexts.orSignInWith.capitalize!;

    return Scaffold(
      body: SingleChildScrollView(
        padding: TSpacingStyle.paddignWithAppbarHeight,
        child: Column(
          children: [
            LoginHeader(isdark: isdark),
            const LoginForm(),
            FormDivider(isdark: isdark, dividertext: dividertext),
            const SizedBox(height: TSizes.spaceBtwItems),
            const SocialBtns(),
          ],
        ),
      ),
    );
  }
}
