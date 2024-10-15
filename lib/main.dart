import 'package:flutter/material.dart';
import 'package:task_list/features/presentation/views/home_layout.dart';

void main() {
  runApp(const TaskListApp());
}

class TaskListApp extends StatelessWidget {
  const TaskListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          fontFamily: 'Inter',
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            onSurface: Colors.white,
            seedColor: const Color(0xff00ca5d),
          )),
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
            surfaceContainerLowest: const Color(0xfff7f7f7),
            surfaceBright: const Color(0xfffdfdfd),
            surface: Colors.white,
            onSurface: Colors.black,
            seedColor: const Color(0xff00ca5d),
            primary: const Color(0xff00ca5d),
            secondary: const Color(0xff00ca5d)),
      ),
      home: const HomeLayout(),
    );
  }
}
