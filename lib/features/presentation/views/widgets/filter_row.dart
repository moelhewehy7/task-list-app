import 'package:flutter/material.dart';
import 'package:task_list/features/presentation/views/widgets/custom_container.dart';

class FilterRow extends StatefulWidget {
  const FilterRow({super.key});

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  final List<String> texts = [
    "All",
    "Not Done",
    "Done",
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          texts.length,
          (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: CustomContainer(
                  text: texts[index],
                  isSelected: selected == index,
                ),
              ))),
    );
  }
}
