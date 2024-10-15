import 'package:flutter/material.dart';
import 'package:task_list/core/utils/app_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, this.trailing});
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Good Morning",
          style: AppStyles.stylesInterMedium32
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
          textAlign: TextAlign.left,
        ),
        trailing ?? const SizedBox()
      ],
    );
  }
}
