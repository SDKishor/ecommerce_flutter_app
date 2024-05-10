import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.isdark,
    required this.dividertext,
  });

  final bool isdark;
  final String dividertext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: isdark ? TColors.darkGrey : TColors.grey,
            thickness: .5,
            indent: 60,
            endIndent: 10,
          ),
        ),
        Text(
          dividertext,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: isdark ? TColors.darkGrey : TColors.grey,
            thickness: .5,
            indent: 10,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
