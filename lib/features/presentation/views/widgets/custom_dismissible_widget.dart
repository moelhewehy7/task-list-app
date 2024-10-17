import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:task_list/core/utils/helper_methods.dart';

import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';
import 'package:task_list/features/presentation/views/widgets/edit_viiew.dart';

import 'package:task_list/features/presentation/views/widgets/task_list_view_item.dart';

class CustomDismissibleWidget extends StatelessWidget {
  const CustomDismissibleWidget({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.taskId), // ey should be unique.
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        task.delete();

        BlocProvider.of<TasksCubit>(context).fecthAllTasks();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Task: ${task.title} deleted"),
          ),
        );
        if (await InternetConnection().hasInternetAccess) {
          await Helper().syncDeletedToFirestore(task);
        }
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
                      taskModel: task,
                    )),
          );
        },
        child: TaskListViewItem(
          task: task,
        ),
      ),
    );
  }
}
