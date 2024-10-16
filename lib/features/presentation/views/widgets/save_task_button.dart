import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/features/presentation/data/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:uuid/uuid.dart';

class SaveTaskButton extends StatelessWidget {
  const SaveTaskButton({
    super.key,
    required this.formkey,
    required this.title,
    required this.dueDate,
  });

  final GlobalKey<FormState> formkey;
  final String title;
  final String dueDate;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Save Task",
      onPressed: () {
        if (formkey.currentState!.validate()) {
          formkey.currentState!.save();

          TaskModel task = TaskModel(
            taskId: const Uuid().v4(),
            title: title,
            dueDate: dueDate,
            isDone: false,
          );
          BlocProvider.of<AddTaskCubit>(context).addTask(task: task);
          BlocProvider.of<TasksCubit>(context).fecthAllTasks();
        }
      },
    );
  }
}
