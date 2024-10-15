import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:task_list/core/utils/app_constants.dart';
import 'package:task_list/features/presentation/data/model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  void addTask({required TaskModel task}) {
    Hive.box<TaskModel>(AppConstants.tasksBox).add(task);
    emit(AddTaskSuccessful());
  }
}
