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
      height: 55,
      width: double.infinity,
      child: FilledButton(
          style: FilledButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppStyles.stylesInterBold17,
            textAlign: TextAlign.center,
          )),
    );
  }
}

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    this.onpressed,
    super.key,
  });
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        style: IconButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onPressed: onpressed,
        icon: const Icon(Icons.add));
  }
}
