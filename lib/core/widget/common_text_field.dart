import 'package:assesmentmanushtech/config/theme/colors.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final FocusNode? focusNode;

  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final String? Function(String?)? validator;

  const CommonTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.borderColor,
    this.focusedBorderColor,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.onEditingComplete,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? grey, width: 1.5),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: focusedBorderColor ?? bluePrimary, width: 1.5),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
