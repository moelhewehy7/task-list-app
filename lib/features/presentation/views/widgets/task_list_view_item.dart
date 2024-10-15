import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_list/core/utils/app_constants.dart';
import 'package:task_list/core/utils/app_styles.dart';

class TaskListViewItem extends StatelessWidget {
  const TaskListViewItem({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        elevation: 4,
        color: Theme.of(context).colorScheme.surfaceBright,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          title: const Text(
            "Build UI Android",
            style: AppStyles.stylesInterBold17,
            textAlign: TextAlign.left,
          ),
          subtitle: const Text(
            "Due Date: Mon. 21/3/2024",
            style: AppStyles.stylesInterRegular14,
            textAlign: TextAlign.left,
          ),
          trailing: SvgPicture.asset(
            isSelected
                ? AppConstants.selectedCheckMarkPic
                : AppConstants.unSelectedCheckMarkPic,
          ),
        ),
      ),
    );
  }
}
