import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/them/constents.dart';

import '../helper/dimention.dart';
import '../helper/helper.dart';


class HelpButton extends StatelessWidget {
  String title;
  IconData? icon;
  void Function()? onTap;

  HelpButton({this.onTap,this.title ="Help?",this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: SC.from_height(35),
      child: OutlinedButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon??Icons.call_outlined),
            SizedBox(width: SC.from_width(5),),
            Text(title, style: TextStyles().leadTileWhiteText,),
          ],
        ), onPressed: onTap,
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal:0, vertical: 5)),
          backgroundColor: MaterialStatePropertyAll( AppConstent().primeryColor),
          foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
          fixedSize: MaterialStatePropertyAll(Size(120, 25)),
          side: MaterialStatePropertyAll( BorderSide(color: Colors.white)),
        ), ),

      width: SC.from_width(90),

    );
  }
}