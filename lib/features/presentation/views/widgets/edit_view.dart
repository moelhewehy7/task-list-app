import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_list/core/utils/app_constants.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:task_list/features/presentation/views/widgets/custom_header.dart';
import 'package:task_list/features/presentation/views/widgets/text_fields.dart';

class EditView extends StatefulWidget {
  const EditView({super.key});

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            child: Column(
              children: [
                CustomHeader(
                  text: "Edit Task",
                  trailing: SvgPicture.asset(
                    AppConstants.selectedCheckMarkPic,
                    height: 45,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const EditCustomTextField(
                  icon: Icons.title,
                  hint: "Title",
                ),
                const SizedBox(height: 16),
                EditCustomTextField(
                  onTap: () async {
                    await selectDate(context);
                  },
                  icon: Icons.calendar_today,
                  hint: "Due Date",
                  readOnly: true,
                ),
              ],
            ),
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
