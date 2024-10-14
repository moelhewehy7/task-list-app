import 'package:flutter/material.dart';
import 'package:task_list/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: FilledButton(
          style: FilledButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppStyles.stylesInterBold16,
            textAlign: TextAlign.center,
          )),
    );
  }
}
