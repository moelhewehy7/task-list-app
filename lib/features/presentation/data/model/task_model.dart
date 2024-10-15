class TaskModel {
  final String title;
  final DateTime dueDate;
  final bool isDone;

  TaskModel({required this.title, required this.dueDate, required this.isDone});

  Map<String, dynamic> toJson() =>
      {"title": title, "dueDate": dueDate.toIso8601String(), "isDone": isDone};
}
