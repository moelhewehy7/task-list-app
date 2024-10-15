import 'package:flutter/material.dart';
import 'package:task_list/core/utils/app_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, this.trailing, this.text});
  final Widget? trailing;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text ?? "Good Morning,",
              overflow: TextOverflow.ellipsis,
              style: AppStyles.stylesInterMedium32.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        trailing ?? const SizedBox()
      ],
    );
  }
}
