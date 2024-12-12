

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';

import '../them/constents.dart';

class OptionChip extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final bool active;
  const OptionChip({
    required this.label,
    this.onTap,
    this.active = false,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
      child: InkWell(
        onTap: onTap,
        child: Chip(
            shape:RoundedRectangleBorder(

              side: BorderSide(color: active? AppConstent().primeryColor:Color.fromRGBO(217, 217, 217, 1),width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor:active?AppConstent().primeryColor:Color.fromRGBO(255, 255, 255, .2),
            label:
            Text(label,style: TextStyle(fontSize: SC.fromWidth(28),color: active ?Colors.white:Colors.black),)),
      ),
    );
  }
}
