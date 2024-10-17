import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:task_list/core/utils/app_styles.dart';
import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../data/models/task_model.dart';

class CustomDeleteDialog extends StatelessWidget {
  const CustomDeleteDialog({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          'Are you sure you want to delete this task?',
          style: AppStyles.stylesInterBold17,
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: AppStyles.stylesInterBold17,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Delete',
              style: AppStyles.stylesInterBold17,
            ),
            onPressed: () async {
              task.delete();

              BlocProvider.of<TasksCubit>(context).fecthAllTasks();
              Navigator.of(context).pop();
              if (await InternetConnection().hasInternetAccess) {
                await Helper().syncDeletedToFirestore(task);
              }
            },
          ),
        ]);
  }
}
