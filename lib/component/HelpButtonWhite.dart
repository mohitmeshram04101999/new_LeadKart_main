import 'package:flutter/material.dart';

import '../helper/dimention.dart';



class HelpButton extends StatelessWidget {
  void Function()? onPress;
  HelpButton({this.onPress,super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: SC.from_height(30),

      //Outlin Button
      child: OutlinedButton(


        //Button Style
          style: ButtonStyle(
              side: MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.white))
          ),
          onPressed:onPress,

          //Icon and Text
          child: Row(
            children: [
              Icon(Icons.call_outlined,color: Colors.white,),
              SizedBox(width: SC.from_width(2),),
              Text("Help ?",style: TextStyle(
                  color: Colors.white,fontSize: SC.from_height(16)
              )),
            ],
          )),
    );
  }
}
