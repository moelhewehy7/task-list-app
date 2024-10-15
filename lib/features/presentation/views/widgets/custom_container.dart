import 'package:flutter/material.dart';
import 'package:task_list/core/utils/app_styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.isSelected,
    required this.text,
  });
  final bool isSelected;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: ShapeDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : const Color(0xFFe6faef), // Change the background color
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Text(
        text,
        style: AppStyles.stylesInterMedium14.copyWith(
            color: isSelected
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
