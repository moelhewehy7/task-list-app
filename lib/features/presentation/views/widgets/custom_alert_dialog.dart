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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;
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
            CustomTextField(
                controller: _dateController,
                onTap: () async {
                  await selectDate(context);
                },
                hint: "Due Date"),
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

  Future selectDate(context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = picked.toString().split(" ")[0];
        //  output of just picked.toString(): = 2024-10-15 00:00:00.000
        //  The split(" ") function breaks the string at the first space character " "
      });
    }
  }
}
