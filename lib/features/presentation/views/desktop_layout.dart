import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:task_list/core/utils/app_constants.dart';
import 'package:task_list/features/presentation/data/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:task_list/features/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:task_list/features/presentation/views/widgets/custom_header.dart';
import 'package:task_list/features/presentation/views/widgets/custom_wrap_widget.dart';
import 'package:task_list/features/presentation/views/widgets/filter_row.dart';
import '../../../core/utils/helper_methods.dart';
import '../data/models/task_model.dart';
import 'widgets/no_tasks_widget.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              trailing: CustomFilledButton(
                icon: Icons.add,
                onpressed: () {
                  showDialog(
                    context: context,
                    barrierColor: const Color(0xE2FFFFFF),
                    builder: (BuildContext context) {
                      return BlocProvider(
                        create: (context) => AddTaskCubit(),
                        child: const CustomAlertDialog(),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const FilterRow(),
            const SizedBox(
              height: 47,
            ),
            BlocBuilder<TasksCubit, TasksState>(
              builder: (context, state) {
                if (state is TasksSucccess) {
                  List<TaskModel> tasks = state.tasks;
                  return CustomWrapWidget(tasks: tasks);
                } else {
                  return const Center(
                    child: NoTasksWidget(),
                  );
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
