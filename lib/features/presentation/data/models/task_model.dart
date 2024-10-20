import 'package:hive/hive.dart';
part 'task_model.g.dart'; //to genereate type adaptor

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String dueDate;
  //hive stores primite type if we wand to add DateTime object to need to create a type adaptor
  @HiveField(2)
  bool isDone;
  @HiveField(3)
  String taskId;

  TaskModel(
      {required this.title,
      required this.dueDate,
      required this.isDone,
      required this.taskId});

  Map<String, dynamic> toJson() =>
      {"title": title, "dueDate": dueDate, "isDone": isDone, "taskId": taskId};
}
