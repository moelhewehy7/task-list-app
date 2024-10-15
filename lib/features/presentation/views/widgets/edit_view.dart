import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:task_list/core/utils/app_constants.dart';
import 'package:task_list/features/presentation/data/cubits/task_cubit/task_cubit.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:task_list/features/presentation/views/widgets/custom_header.dart';
import 'package:task_list/features/presentation/views/widgets/text_fields.dart';

class EditView extends StatefulWidget {
  const EditView({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final TextEditingController _dateController = TextEditingController();
  String? _selectedDate;
  String? title, dueDate;
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
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.taskModel.isDone = !widget.taskModel.isDone;
                        });
                      },
                      child: SvgPicture.asset(
                        widget.taskModel.isDone
                            ? AppConstants.selectedCheckMarkPic
                            : AppConstants.unSelectedCheckMarkPic,
                        height: 45,
                      ),
                    )),
                const SizedBox(
                  height: 24,
                ),
                EditCustomTextField(
                  onChanged: (data) {
                    title = data;
                  },
                  fontsize: 18,
                  icon: Icons.title,
                  hint: widget.taskModel.title,
                ),
                const SizedBox(height: 16),
                EditCustomTextField(
                  onChanged: (data) {
                    dueDate = data;
                  },
                  controller: _dateController,
                  onTap: () async {
                    await selectDate(context);
                  },
                  icon: Icons.calendar_today,
                  hint: "Due Date: ${widget.taskModel.dueDate}",
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
          onPressed: () {
            widget.taskModel.title = title ?? widget.taskModel.title;
            widget.taskModel.dueDate =
                _selectedDate ?? widget.taskModel.dueDate;
            widget.taskModel.save();
            BlocProvider.of<TasksCubit>(context)
                .fecthAllTasks(); // to refresh data
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Task updated successfully!"),
              ),
            );

            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Future selectDate(context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        // convert  date string to the correct format "Thu. 17/10/2024"
        initialDate:
            DateFormat('EEE. dd/MM/yyyy').parse(widget.taskModel.dueDate),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('EEE. dd/MM/yyyy').format(picked);
        _selectedDate = _dateController.text;
        //  output of just picked.toString(): = 2024-10-15 00:00:00.000
        //  The split(" ") function breaks the string at the first space character " "
      });
    }
  }
}
