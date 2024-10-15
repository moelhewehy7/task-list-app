import 'package:flutter/material.dart';
import 'package:task_list/features/presentation/views/widgets/edit_view.dart';
import 'package:task_list/features/presentation/views/widgets/task_list_view_item.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  int itemSelected = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemCount: 9,
      itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EditView()));
          },
          child: TaskListViewItem(isSelected: itemSelected == index)),
    );
  }
}
