// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_list/features/presentation/views/widgets/custom_header.dart';
import 'package:task_list/features/presentation/views/widgets/filter_row.dart';
import 'package:task_list/features/presentation/views/widgets/modal_vottom_sheet_body.dart';
import 'package:task_list/features/presentation/views/widgets/task_listview.dart';

import 'widgets/buttons.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            children: const [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: CustomHeader(),
              ),
              SizedBox(
                height: 8,
              ),
              FilterRow(),
              SizedBox(
                height: 10,
              ),
              TaskListView()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 16, top: 8),
        child: CustomButton(
          text: "Create Task",
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Theme.of(context).colorScheme.surface,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const ModalBottomSheetBody();
                });
          },
        ),
      ),
    );
  }
}
