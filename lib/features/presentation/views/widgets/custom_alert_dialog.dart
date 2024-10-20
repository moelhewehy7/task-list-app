import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task_list/core/utils/helper_methods.dart';
import 'package:task_list/features/presentation/data/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_list/features/presentation/views/widgets/text_fields.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';
import 'package:uuid/uuid.dart';
import '../../data/cubits/task_cubit/task_cubit.dart';
import '../../data/models/task_model.dart';

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
  final GlobalKey<FormState> _formkey = GlobalKey();
  String? title, dueDate;
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xffd2f2db), width: 3),
            borderRadius: BorderRadius.circular(
              10,
            )),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 17, vertical: 14),
        content: SizedBox(
          width: 370,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              CustomTextField(
                onsaved: (data) {
                  title = data;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Field is required';
                  } else {
                    return null;
                  }
                },
                controller: _titleController,
                hint: "Task title",
              ),
              const SizedBox(height: 7),
              CustomTextField(
                onsaved: (data) {
                  dueDate = data;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Field is required';
                  } else {
                    return null;
                  }
                },
                controller: _dateController,
                onTap: () async {
                  String date = await Helper().selectDate(
                    context: context,
                    dateController: _dateController,
                    initialDate: _selectedDate ?? DateTime.now(),
                  );
                  _dateController.text = date;
                },
                readOnly: true,
                hint: "Due Date",
              ),
              const SizedBox(height: 49),
              BlocConsumer<AddTaskCubit, AddTaskState>(
                listener: (context, state) {
                  if (state is AddTaskSuccessful) {
                    Navigator.pop(context);
                  } else if (state is AddTaskFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.errMessage),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is AddTaskILoading) {
                    return SpinKitCircle(
                      color: Theme.of(context).colorScheme.primary,
                      size: 20.0,
                    );
                  } else {
                    return CustomButton(
                      text: "Save Task",
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();

                          TaskModel task = TaskModel(
                            taskId: const Uuid().v4(),
                            title: title!,
                            dueDate: dueDate!,
                            isDone: false,
                          );
                          BlocProvider.of<AddTaskCubit>(context)
                              .addTask(task: task);
                          BlocProvider.of<TasksCubit>(context).fecthAllTasks();
                        }
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 7),
            ],
          ),
        ),
      ),
    );
  }
}
