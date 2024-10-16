import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list/core/utils/app_constants.dart';
import 'package:task_list/core/utils/app_styles.dart';
import 'package:task_list/features/presentation/data/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:task_list/features/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:task_list/features/presentation/views/widgets/custom_header.dart';
import 'package:task_list/features/presentation/views/widgets/filter_row.dart';
import 'package:task_list/features/presentation/views/widgets/task_list_view_item.dart';

import '../data/models/task_model.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

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
                  return Wrap(
                    spacing: 10, // Space between cards horizontally
                    runSpacing: 5,
                    direction: Axis.horizontal,
                    children: List.generate(
                        tasks.length,
                        (index) => ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 150,
                                maxWidth: 300,
                              ),
                              child: TaskListViewItem(
                                task: tasks[index],
                              ),
                            )),
                  );
                } else {
                  return Center(
                    child: Column(
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
                    ),
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
