import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final double paddingHeight;
  final double borderRadiusHeight;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.onChanged,
    this.validator,
    this.paddingHeight = 12.0,
    this.borderRadiusHeight = 7.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SC.from_height(7)),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        labelText: labelText,
        labelStyle:     TextStyle(color:Colors.grey.shade700,fontSize: SC.from_height(15.5)),
        contentPadding: EdgeInsets.symmetric(
            vertical: SC.from_height(12),
            horizontal: SC.from_height(10)),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SC.from_height(7)),
          borderSide:
          BorderSide(color: Colors.grey.shade400), // Set border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SC.from_height(7)),
          borderSide: BorderSide(
              color: Colors.grey.shade400), // Set border color when focused
        ),
      ),
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
