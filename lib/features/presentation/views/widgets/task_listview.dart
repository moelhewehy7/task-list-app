import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';

import 'custom_dismissible_widget.dart';
import 'no_tasks_widget.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        if (state is TasksSucccess) {
          List<TaskModel> tasks = state.tasks;
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return CustomDismissibleWidget(task: tasks[index]);
            },
          );
        } else {
          return const NoTasksWidget();
        }
      },
    );
  }
}
