import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';
import 'package:task_list/features/presentation/views/widgets/edit_view.dart';

import 'package:task_list/features/presentation/views/widgets/task_list_view_item.dart';

class CustomDismissibleWidget extends StatelessWidget {
  const CustomDismissibleWidget({
    super.key,
    required this.tasks,
  });

  final TaskModel tasks;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(tasks.dueDate), // Use a unique key, e.g., the task ID
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        tasks.delete();
        BlocProvider.of<TasksCubit>(context).fecthAllTasks();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Task: ${tasks.title} deleted"),
          ),
        );
      },
      background: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => EditView(
                      taskModel: tasks,
                    )),
          );
        },
        child: TaskListViewItem(
          task: tasks,
        ),
      ),
    );
  }
}
