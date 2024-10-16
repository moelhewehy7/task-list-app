import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/core/utils/app_styles.dart';
import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';
import 'package:lottie/lottie.dart';

import 'custom_dismissible_widget.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  int itemSelected = -1;
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
              return CustomDismissibleWidget(tasks: tasks[index]);
            },
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/images/Animation - 1729031443431.json', // Path to your asset
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
      },
    );
  }
}
