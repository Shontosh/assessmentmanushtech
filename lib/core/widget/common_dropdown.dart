import 'package:assesmentmanushtech/config/theme/colors.dart';
import 'package:flutter/material.dart';

class CommonDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String hint;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  const CommonDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.hint,
    this.focusNode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: validator,
      value: selectedValue,
      focusNode: focusNode,
      hint: Text(
        hint,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      onChanged: onChanged,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Rounded border
          borderSide: BorderSide(color: grey), // Border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              BorderSide(color: bluePrimary), // Border color when focused
        ),
      ),
      icon: Icon(Icons.arrow_drop_down), // Arrow icon
    );
  }
}
