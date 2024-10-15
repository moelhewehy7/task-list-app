import 'package:flutter/material.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:task_list/features/presentation/views/widgets/custom_header.dart';
import 'package:task_list/features/presentation/views/widgets/text_fields.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              CustomHeader(
                text: "Edit Task",
                trailing: CustomFilledButton(
                  icon: Icons.check,
                  onpressed: () {},
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const EditCustomTextField(),
              const SizedBox(height: 16),
              const EditCustomTextField(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 16, top: 8),
        child: CustomButton(
          text: "Save",
          onPressed: () {},
        ),
      ),
    );
  }
}
