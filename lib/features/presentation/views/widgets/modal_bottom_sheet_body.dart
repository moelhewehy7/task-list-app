import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_list/core/utils/app_styles.dart';
import 'package:task_list/core/utils/helper_methods.dart';
import 'package:task_list/features/presentation/data/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_list/features/presentation/views/widgets/buttons.dart';

import 'package:uuid/uuid.dart';
import 'package:task_list/features/presentation/views/widgets/text_fields.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../data/cubits/task_cubit/task_cubit.dart';
import '../../data/models/task_model.dart';

class ModalBottomSheetBody extends StatefulWidget {
  const ModalBottomSheetBody({
    super.key,
  });

  @override
  State<ModalBottomSheetBody> createState() => _ModalBottomSheetBodyState();
}

class _ModalBottomSheetBodyState extends State<ModalBottomSheetBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();
  DateTime? selectedDate;
  String? title, dueDate;

  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
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
                controller: titleController,
                hint: "Task title",
              ),
              const SizedBox(
                height: 19,
              ),
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
                controller: dateController,
                onTap: () async {
                  String date = await Helper().selectDate(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    dateController: dateController,
                  );
                  dueDate = date;
                },
                readOnly: true,
                hint: "Due Date",
              ),
              const SizedBox(
                height: 18,
              ),
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
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
