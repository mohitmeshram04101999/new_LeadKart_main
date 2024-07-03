import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:leadkart/helper/dimention.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final List<TextInputFormatter>? format;
  final TextInputType? textInputType;
  final int? maxLength;
  final String labelText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final double paddingHeight;
  final double borderRadiusHeight;

  const CustomTextField({
    Key? key,
    this.format,
    this.maxLength,
    this.textInputType,
    required this.controller,
    required this.labelText,
    this.onChanged,
    this.validator,
    this.paddingHeight = 12.0,
    this.borderRadiusHeight = 7.0,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters:widget.format,
      maxLength: widget.maxLength,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SC.from_height(7)),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        labelText: widget.labelText,
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
      onChanged: (c){
        if(widget.onChanged!=null)
          {
            widget.onChanged!(c);
          }
        setState(() {

        });
      },
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
