

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
    return InkWell(
      onTap: onTap,
      child: Chip(
          shape:RoundedRectangleBorder(
            side: BorderSide(color: AppConstent().primeryColor),
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor:active?AppConstent().primeryColor.withOpacity(.3):null,
          label:
          Text(label,style: TextStyle(fontSize: SC.fromWidth(28),color: AppConstent().primeryColor),)),
    );
  }
}
