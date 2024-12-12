import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leadkart/helper/dimention.dart';



class CustomTextField2 extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final List<TextInputFormatter>? format;
  final TextInputType? textInputType;
  final int? maxLength;
  final String labelText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final double paddingHeight;
  final double borderRadiusHeight;
  final Widget? icon;
  final bool isTransparent;

  const CustomTextField2({
    Key? key,
    this.icon,
    this.hintText,
    this.format,
    this.maxLength,
    this.textInputType,
    required this.controller,
    required this.labelText,
    this.onChanged,
    this.validator,
    this.paddingHeight = 12.0,
    this.borderRadiusHeight = 7.0,
    this.isTransparent = false,
  }) : super(key: key);

  @override
  State<CustomTextField2> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(widget.labelText,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: SC.from_width(16)
        ),),
        
        TextFormField(
          inputFormatters: widget.format,
          maxLength: widget.maxLength,
          keyboardType: widget.textInputType,
          controller: widget.controller,
          cursorColor: Colors.grey,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: SC.from_width(18)
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,

            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(172, 172, 172, 1),
              fontSize: SC.from_width(16),
            ),

            prefixIcon: (widget.icon!=null)? Container(
                height: SC.from_width(30),
                width: SC.from_width(30),
                child: Center(child: widget.icon)):null,


            //
            border: UnderlineInputBorder(),



            //
            errorBorder: UnderlineInputBorder(),

            //
            focusedErrorBorder:UnderlineInputBorder(),

            //
            errorStyle: TextStyle(
                fontWeight: FontWeight.w400, fontSize: SC.from_height(12)),


            //
            contentPadding: EdgeInsets.symmetric(horizontal: SC.from_width(8),),

            //
            filled: false,

            //
            fillColor: Colors.red,

            prefixStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SC.from_width(18)
            ),

            //
            enabledBorder: UnderlineInputBorder(

            ),

            //
            focusedBorder:UnderlineInputBorder(
            ),
          ),
          onChanged: (c) {
            if (widget.onChanged != null) {
              widget.onChanged!(c);
            }
            setState(() {});
          },
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
