import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart'; // Assuming GFButton is from the GetWidget package

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  CustomButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SC.from_height(45), // Adjust as needed
      width: SC.from_height(340),
      child: GFButton(
        onPressed: onPressed,
        color: MyHelper.appConstent.primeryColor,
        borderShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: SC.fromWidth(22),
            ),
          ),
        ),
      ),
    );
  }
}
