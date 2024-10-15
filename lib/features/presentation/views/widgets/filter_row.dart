import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/views/widgets/custom_container.dart';

class FilterRow extends StatefulWidget {
  const FilterRow({super.key});

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = 0;
                });
                BlocProvider.of<TasksCubit>(context).fecthAllTasks();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: CustomContainer(
                  text: "All",
                  isSelected: selected == 0,
                ),
              )),
        ),
        Flexible(
          child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = 1;
                  BlocProvider.of<TasksCubit>(context)
                      .fecthAllTasks(isDone: true);
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: CustomContainer(
                  text: "Done",
                  isSelected: selected == 1,
                ),
              )),
        ),
        Flexible(
          child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = 2;
                });
                BlocProvider.of<TasksCubit>(context)
                    .fecthAllTasks(isDone: false);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: CustomContainer(
                  text: "Not Done",
                  isSelected: selected == 2,
                ),
              )),
        )
      ],
    );
  }
}
