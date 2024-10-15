import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task_list/core/utils/app_constants.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  void addTask({required TaskModel task}) {
    try {
      AddTaskILoading();
      var taskBox = Hive.box<TaskModel>(AppConstants.tasksBox);
      taskBox.add(task);
      emit(AddTaskSuccessful());
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(AddTaskFailure(errMessage: e.toString()));
    }
  }
}
