import 'package:flutter/material.dart';
import 'package:task_list/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.readOnly = false,
    this.onTap,
    required this.controller,
    this.validator,
    this.onsaved,
  });
  final String hint;
  final bool readOnly;
  final Function()? onTap;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      validator: validator,
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
      this.fontsize = 14,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.initialValue,
      this.readOnly = false,
      required this.icon,
      this.onTap,
      this.controller});

  final String? hint;
  final int maxLines;
  final String? initialValue;

  final void Function(String?)? onSaved;

  final Function(String)? onChanged;

  final Function()? onTap;
  final IconData icon;
  final double? fontsize;
  final bool readOnly;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          hintText: hint,
          hintStyle:
              AppStyles.stylesInterRegular14.copyWith(fontSize: fontsize)),
    );
  }
}
