import 'package:flutter/material.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:task_list/features/presentation/views/widgets/text_fields.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
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
        width: 370,
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
            CustomTextField(controller: _titleController, hint: "Task title"),
            const SizedBox(height: 7),
            CustomTextField(controller: _dateController, hint: "Due Date"),
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
