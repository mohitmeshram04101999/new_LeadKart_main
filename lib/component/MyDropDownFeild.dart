

import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';

import '../helper/helper.dart';

class MyDropDownField extends StatelessWidget {
  String lebale;
  String value;
  Function? onOpen;
  TextEditingController? controller;
  Widget Function(BuildContext, ScrollController) builder;
  MyDropDownField({this.onOpen,this.value = "",required this.builder,this.lebale="",this.controller,super.key});

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = value;
    return GestureDetector(
      onTap: () {
        MyHelper.mybottomPanel(context: context,
          builder: builder);},
      child: TextFormField(

        enabled: false,
        controller:_controller,

        style: TextStyle(color: Colors.grey.shade700),
        decoration: InputDecoration(

          label: Text(lebale),
          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
          contentPadding: EdgeInsets.symmetric(horizontal: 7),
        ),
      ),
    );
  }
}
