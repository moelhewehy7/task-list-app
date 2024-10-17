import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:task_list/core/utils/app_constants.dart';

import '../../models/task_model.dart';

part 'task_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  fecthAllTasks({bool? isDone}) async {
    var taskBox = Hive.box<TaskModel>(AppConstants.tasksBox);
    var box = await Hive.openBox<TaskModel>(AppConstants.tasksBox);

    List<TaskModel> tasks = taskBox.values.toList();

    // Filter tasks by isDone status if provided
    if (isDone != null) {
      tasks = tasks.where((task) => task.isDone == isDone).toList();
    }

    if (tasks.isEmpty) {
      emit(TasksEmpty());
    } else {
      tasks.sort((a, b) => b.taskId.compareTo(a.taskId));
      emit(TasksSucccess(tasks: tasks));
    }
  }
}
