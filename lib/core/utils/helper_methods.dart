import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_list/features/presentation/data/models/task_model.dart';

class Helper {
  Future<void> syncTaskToFirestore(
    TaskModel task,
  ) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.taskId)
        .set(task.toJson());
  }

  Future<void> syncDeletedToFirestore(
    TaskModel task,
  ) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.taskId)
        .delete();
  }

  Future<String> selectDate({
    required BuildContext context,
    required TextEditingController dateController,
    required DateTime? initialDate,
  }) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      //// Format the picked date  2024-10-15 00:00:00.000as "Mon. 21/3/2024"
      dateController.text = DateFormat('EEE. dd/MM/yyyy').format(picked);
    }

    return dateController.text; // Return the current value if no date is picked
  }
}
