import 'package:flutter/material.dart';
import 'package:leadkart/them/constents.dart';


class CustomPicker extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final Widget child;
  const CustomPicker({required this.label,required this.child,this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppConstent().primeryColor

          )
        ),
        margin: EdgeInsets.symmetric(vertical: 12,horizontal: 3),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label,style: TextStyle(
              fontSize: 16,
              color: AppConstent().primeryColor
            ),),
            SizedBox(height: 2,),
            child
          ],
        ),
      ),
    );
  }
}
