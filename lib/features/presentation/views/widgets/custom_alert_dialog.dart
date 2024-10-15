import 'package:flutter/material.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:task_list/features/presentation/views/widgets/text_fields.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffd2f2db), width: 3),
          borderRadius: BorderRadius.circular(
            10,
          )),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 17, vertical: 14), // Optional padding
      content: SizedBox(
        width: 350,
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Ensures the dialog size wraps its content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const Text(
              "Create New Task",
              style: TextStyle(
                fontSize: 16, // Replace AppStyles if not used
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 14),
            const CustomTextField(hint: "Task title"),
            const SizedBox(height: 7),
            const CustomTextField(hint: "Due Date"),
            const SizedBox(height: 49),
            CustomButton(
              text: "Save Task",
              onPressed: () {
                // Add save task logic here
              },
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }
}
