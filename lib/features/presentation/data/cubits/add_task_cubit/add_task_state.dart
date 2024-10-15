part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskILoading extends AddTaskState {}

final class AddTaskSuccessful extends AddTaskState {}

final class AddTaskFailure extends AddTaskState {
  final String errMessage;
  AddTaskFailure({required this.errMessage});
}
