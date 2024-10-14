import 'package:flutter/material.dart';
import 'package:task_list/views/home_layout.dart';

void main() {
  runApp(const TaskListApp());
}

class TaskListApp extends StatelessWidget {
  const TaskListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff00ca5d),
            primary: const Color(0xff00ca5d),
            secondary: const Color(0xff00ca5d)),
        useMaterial3: true,
      ),
      home: HomeLayout(),
    );
  }
}
