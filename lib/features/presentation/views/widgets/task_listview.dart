import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_list/core/utils/app_styles.dart';
import 'package:task_list/core/utils/helper_methods.dart';
import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/app_constants.dart';
import 'custom_dismissible_widget.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  late StreamSubscription<BoxEvent> hiveListener;
  late StreamSubscription<InternetStatus> intennetListener;

  @override
  void initState() {
    super.initState();

    intennetListener =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      if (status == InternetStatus.connected) {
        var taskBox = Hive.box<TaskModel>(AppConstants.tasksBox);
        if (taskBox.isNotEmpty) {
          hiveListener = taskBox.watch().listen((event) {
            List<TaskModel> tasks = taskBox.values.toList();
            for (var task in tasks) {
              Helper().syncTaskToFirestore(task);
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    // If the widget is disposed,
    intennetListener.cancel();
    hiveListener.cancel();
    super.dispose();
  }

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
              return CustomDismissibleWidget(task: tasks[index]);
            },
          );
        } else {
          return Column(
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
      },
    );
  }
}
