import 'package:flutter/material.dart';
import 'package:task_list/core/utils/app_styles.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:task_list/features/presentation/views/widgets/text_fields.dart';

class ModalBottomSheetBody extends StatefulWidget {
  const ModalBottomSheetBody({
    super.key,
  });

  @override
  State<ModalBottomSheetBody> createState() => _ModalBottomSheetBodyState();
}

class _ModalBottomSheetBodyState extends State<ModalBottomSheetBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 8),
        child: Column(
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
                    ))
              ],
            ),
            const Text(
              "Create New Task",
              style: AppStyles.stylesInterBold17,
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextField(
              controller: _titleController,
              hint: "Task title",
            ),
            const SizedBox(
              height: 19,
            ),
            CustomTextField(
              controller: _dateController,
              onTap: () async {
                await selectDate(context);
              },
              readOnly: true,
              hint: "Due Date",
            ),
            const SizedBox(
              height: 18,
            ),
            CustomButton(
              text: "Save Task",
              onPressed: () {},
            ),
            const SizedBox(
              height: 18,
            ),
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
