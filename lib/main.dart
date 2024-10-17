import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_list/core/utils/app_constants.dart';
import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';
import 'package:task_list/features/presentation/views/home_layout.dart';
import 'package:task_list/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());

  await Hive.openBox<TaskModel>(AppConstants.tasksBox);

  runApp(const TaskListApp());
}

class TaskListApp extends StatelessWidget {
  const TaskListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit()..fecthAllTasks(),
      child: MaterialApp(
        themeMode: ThemeMode.light,
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
              onSecondary: const Color(0xFFe6faef),
              surfaceContainerLowest: const Color(0xfff7f7f7),
              surfaceBright: const Color(0xfffdfdfd),
              surface: Colors.white,
              onSurface: Colors.black,
              seedColor: const Color(0xff00ca5d),
              primary: const Color(0xff00ca5d),
              secondary: const Color(0xff00ca5d)),
        ),
        home: const HomeLayout(),
      ),
    );
  }
}
