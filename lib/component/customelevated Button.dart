import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';

import '../them/constents.dart';

 class CustomElevetdButton extends StatelessWidget {
   final String title;
   final void Function()? onPressed;
   const CustomElevetdButton({
     this.title = "Lets Get Started",
     required this.onPressed,super.key});

   @override
   Widget build(BuildContext context) {
     return SizedBox(
       height: 72,
       width: double.infinity,
       child: ElevatedButton(
         onPressed: onPressed , child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(title,
             style: TextStyle(
                 fontSize: SC.from_width(20),
                 fontWeight: FontWeight.w700
             ),),
           SizedBox(width: 5,),
           Icon(Icons.arrow_forward,color: Colors.white,)
         ],
       ),
       style: ButtonStyle(
           backgroundColor: WidgetStateProperty.resolveWith((states) => AppConstent().primeryColor,),
           foregroundColor:  WidgetStateProperty.resolveWith((states) => Colors.white,)
       ),),
     );
   }
 }

