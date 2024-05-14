import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.text,
    this.selected = false,
    this.onselected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onselected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onselected,
      labelStyle: TextStyle(color: selected ? TColors.white : null),
      avatar: isColor
          ? CircleContainer(
              width: 50,
              height: 50,
              backgroundcolor: THelperFunctions.getColor(text)!)
          : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      shape: isColor ? const CircleBorder() : null,
      backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
      selectedColor: isColor ? THelperFunctions.getColor(text)! : null,
    );
  }
}
