import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list/core/utils/app_constants.dart';

import '../../../../core/utils/app_styles.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppConstants.lottie, // Path to your asset
          width: 200, // Set size if needed
          height: 200,
          fit: BoxFit.fill,
        ),
        const Text(
          "No tasks available.",
          style: AppStyles.stylesInterBold17,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
