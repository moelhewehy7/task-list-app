import 'package:flutter/material.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:task_list/features/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:task_list/features/presentation/views/widgets/custom_header.dart';
import 'package:task_list/features/presentation/views/widgets/filter_row.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              trailing: CustomFilledButton(
                icon: Icons.add,
                onpressed: () {
                  showDialog(
                    context: context,
                    barrierColor: const Color(0xE2FFFFFF),
                    builder: (BuildContext context) {
                      return const CustomAlertDialog();
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const FilterRow(),
            const SizedBox(
              height: 47,
            ),
            Wrap(
              spacing: 15, // Space between cards horizontally
              runSpacing: 5,
              direction: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 150, // Set a minimum width for the card
                        maxWidth: 290, // Set a maximum width for the card
                      ),
                      child: Text("sdfds")
                      // const TaskListViewItem(
                      //   isSelected: true,
                      // ),
                      )),
            )
          ],
        ),
      )),
    );
  }
}
