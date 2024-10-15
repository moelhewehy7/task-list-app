import 'package:flutter/material.dart';
import 'package:task_list/core/utils/app_styles.dart';
import 'package:task_list/features/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:task_list/features/presentation/views/widgets/modal_vottom_sheet_body.dart';
import 'package:task_list/features/presentation/views/widgets/text_fields.dart';

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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        style: IconButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onPressed: () {
          showDialog(
            context: context,
            barrierColor: const Color(0xE2FFFFFF),
            builder: (BuildContext context) {
              return const CustomAlertDialog();
            },
          );
        },
        icon: Icon(Icons.add));
  }
}
