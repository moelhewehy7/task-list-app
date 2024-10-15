import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_list/core/utils/app_constants.dart';
import 'package:task_list/core/utils/app_styles.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';

class TaskListViewItem extends StatefulWidget {
  const TaskListViewItem(
      {super.key, required this.isSelected, required this.task});
  final bool isSelected;
  final TaskModel task;

  @override
  State<TaskListViewItem> createState() => _TaskListViewItemState();
}

class _TaskListViewItemState extends State<TaskListViewItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Theme.of(context).colorScheme.surfaceBright,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        title: Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          widget.task.title,
          style: AppStyles.stylesInterBold17,
          textAlign: TextAlign.left,
        ),
        subtitle: Text(
          widget.task.dueDate,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppStyles.stylesInterRegular14,
          textAlign: TextAlign.left,
        ),
        trailing: GestureDetector(
          onTap: () {
            setState(() {
              widget.task.isDone = !widget.task.isDone;
            });
            widget.task.save();
          },
          child: SvgPicture.asset(
            widget.task.isDone
                ? AppConstants.selectedCheckMarkPic
                : AppConstants.unSelectedCheckMarkPic,
          ),
        ),
      ),
    );
  }
}
