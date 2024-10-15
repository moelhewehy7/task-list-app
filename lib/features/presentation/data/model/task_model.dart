import 'package:hive/hive.dart';
part 'task_model.g.dart'; //to genereate type adaptor

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final DateTime dueDate;
  @HiveField(2)
  final bool isDone;

  TaskModel({required this.title, required this.dueDate, required this.isDone});

  Map<String, dynamic> toJson() =>
      {"title": title, "dueDate": dueDate.toIso8601String(), "isDone": isDone};
}
