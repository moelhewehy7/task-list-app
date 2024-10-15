import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:task_list/core/utils/app_constants.dart';

import '../../models/task_model.dart';

part 'task_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  fecthAllTasks({bool? isDone}) {
    var taskBox = Hive.box<TaskModel>(AppConstants.tasksBox);
    List<TaskModel> tasks = taskBox.values.toList();

    // Filter tasks by isDone status if provided
    if (isDone != null) {
      tasks = tasks.where((task) => task.isDone == isDone).toList();
    }

    if (tasks.isEmpty) {
      emit(TasksEmpty());
    } else {
      emit(TasksSucccess(tasks: tasks));
    }
  }
}
