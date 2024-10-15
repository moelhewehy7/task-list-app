part of 'task_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksEmpty extends TasksState {}

final class TasksSucccess extends TasksState {
  final List<TaskModel> tasks;

  TasksSucccess({required this.tasks});
}
