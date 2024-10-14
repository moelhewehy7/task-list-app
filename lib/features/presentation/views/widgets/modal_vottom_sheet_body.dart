import 'package:flutter/material.dart';
import 'package:task_list/core/utils/app_styles.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:task_list/features/presentation/views/widgets/text_fields.dart';

class ModalBottomSheetBody extends StatelessWidget {
  const ModalBottomSheetBody({
    super.key,
  });

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
              style: AppStyles.stylesInterBold16,
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 14,
            ),
            const CustomTextField(
              hint: "Task title",
            ),
            const SizedBox(
              height: 19,
            ),
            const CustomTextField(
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
}
