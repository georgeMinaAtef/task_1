import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType? keyboardType;
  bool? isPassword;
  String? Function(String?)? onSubmit;
  String? Function(String?)? onChange;
  void Function()? onTab;
  String? Function(String?)? validate;
  String? label;
  Icon? prefix;
  IconData? suffix;
  int maxLine;
  bool? enable;
  void Function()? suffixPressed;
  AutovalidateMode? validationMode;

  CustomTextFormField({super.key,
    required this.controller,
    this.keyboardType,
    this.isPassword = false,
    this.enable = true,
    this.onSubmit,
    this.onChange,
    this.onTab,
    this.validate,
    this.label,
    this.prefix,
    this.suffix,
    this.maxLine = 1,
    this.validationMode,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword!,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      onTap: onTab,
      enabled: enable,
      maxLines: maxLine,
      autovalidateMode: validationMode,
      decoration: InputDecoration(
        helperText: '',
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
