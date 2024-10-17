import 'package:flutter/material.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';

import 'custom_delete_dialog.dart';
import 'edit_viiew.dart';
import 'task_list_view_item.dart';

class CustomWrapWidget extends StatelessWidget {
  const CustomWrapWidget({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10, // Space between cards horizontally
      runSpacing: 5,
      direction: Axis.horizontal,
      children: List.generate(
          tasks.length,
          (index) => GestureDetector(
                onSecondaryTap: () {
                  showDialog(
                    context: context,
                    barrierColor: const Color(0xE2FFFFFF),
                    builder: (BuildContext context) {
                      return CustomDeleteDialog(task: tasks[index]);
                    },
                  );
                },
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditView(
                                taskModel: tasks[index],
                              )));
                },
                child: Tooltip(
                  verticalOffset: 55,
                  message: 'Right-click to delete this task', // Tooltip message

                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 150,
                      maxWidth: 300,
                    ),
                    child: TaskListViewItem(
                      task: tasks[index],
                    ),
                  ),
                ),
              )),
    );
  }
}
