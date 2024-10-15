import 'package:flutter/material.dart';
import 'package:task_list/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.readOnly = false,
    this.onTap,
    required this.controller,
  });
  final String hint;
  final bool readOnly;
  final Function()? onTap;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainerLowest,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          hintText: hint,
          hintStyle: AppStyles.stylesInterRegular14),
    );
  }
}

class EditCustomTextField extends StatelessWidget {
  const EditCustomTextField(
      {super.key,
      this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.initialValue,
      this.fontSize = 16});

  final String? hint;
  final int maxLines;
  final String? initialValue;

  final void Function(String?)? onSaved;
  final double fontSize;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          //and if value is not empty but null, it also returns Text("try again").
          return 'Field is required ';
        } else {
          return null;
        }
      },
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
      ),
      style: TextStyle(fontSize: fontSize),
    );
  }
}
