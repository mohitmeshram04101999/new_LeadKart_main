import 'package:flutter/material.dart';

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
            Text(title, style: MyHelper.textStyls.leadTileWhiteText,),
          ],
        ), onPressed: onTap,
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal:0, vertical: 5)),
          backgroundColor: MaterialStatePropertyAll( MyHelper.appConstent.primeryColor),
          foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
          fixedSize: MaterialStatePropertyAll(Size(120, 25)),
          side: MaterialStatePropertyAll( BorderSide(color: Colors.white)),
        ), ),

      width: SC.from_width(90),

    );
  }
}