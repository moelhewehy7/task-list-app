import 'package:flutter/material.dart';
import 'package:task_list/utils/app_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Good Morning",
          style: AppStyles.stylesInterMedium30
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
