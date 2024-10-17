import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/features/presentation/data/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_list/features/presentation/views/widgets/custom_header.dart';
import 'package:task_list/features/presentation/views/widgets/filter_row.dart';
import 'package:task_list/features/presentation/views/widgets/modal_bottom_sheet_body.dart';
import 'package:task_list/features/presentation/views/widgets/task_listview.dart';
import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_list/core/utils/helper_methods.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';
import '../../../../core/utils/app_constants.dart';

import 'widgets/buttons.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  late StreamSubscription<InternetStatus>? intennetListener;

  @override
  void initState() {
    super.initState();
    intennetListener =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      if (status == InternetStatus.connected) {
        var taskBox = Hive.box<TaskModel>(AppConstants.tasksBox);
        taskBox.watch().listen((event) {
          if (taskBox.isNotEmpty) {
            List<TaskModel> tasks = taskBox.values.toList();
            for (var task in tasks) {
              Helper().syncTaskToFirestore(task);
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    // If the widget is disposed,
    intennetListener?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: CustomHeader(),
              ),
              SizedBox(
                height: 8,
              ),
              FilterRow(),
              SizedBox(
                height: 10,
              ),
              TaskListView()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 16, top: 8),
        child: CustomButton(
          text: "Create Task",
          onPressed: () {
            modalBottomSheet(context);
          },
        ),
      ),
    );
  }

  Future<dynamic> modalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        barrierColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.surface,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .surface, // Background color of the modal
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 4, // Blur radius
                  offset: const Offset(
                      0, -3), // to Move shadow upward// Shadow offset
                ),
              ],
            ),
            child: BlocProvider(
              create: (context) => AddTaskCubit(),
              child: const ModalBottomSheetBody(),
            ),
          );
        });
  }
}
