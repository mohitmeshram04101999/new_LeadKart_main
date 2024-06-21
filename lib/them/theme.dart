

import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';

import '../helper/helper.dart';

ThemeData AppTheme()
{
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: MyHelper.appConstent.primeryColor,
secondaryHeaderColor: MyHelper.appConstent.leadTiletagColor,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: SC.fromWidth(20)
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) => MyHelper.appConstent.checkBoxColor),
      checkColor: MaterialStateProperty.resolveWith((states) => Colors.white),
    ),
    textTheme: TextTheme(
      displayMedium: MyHelper.textStyls.mediumText,
      displaySmall: MyHelper.textStyls.smallText,
      displayLarge: MyHelper.textStyls.onBordingMainText,
    ),

    appBarTheme: AppBarTheme(
      titleSpacing: 0,
      foregroundColor: Colors.white,
      backgroundColor: MyHelper.appConstent.primeryColor
    ),


    outlinedButtonTheme: OutlinedButtonThemeData(
      
      style: ButtonStyle(
        iconSize: MaterialStateProperty.resolveWith((states) => SC.fromWidth(20)),
        padding:MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(horizontal: SC.fromWidth(10))),
          shape: MaterialStateProperty.resolveWith((states) =>RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )),
        side:MaterialStateProperty.resolveWith((states) => BorderSide(color: MyHelper.appConstent.primeryColor))
      ),
    ),



    //ColorScheme
    colorScheme: ColorScheme.light(
      primary: MyHelper.appConstent.primeryColor,
    ),
    
    //Eleveted Button THeme
    elevatedButtonTheme: ElevatedButtonThemeData(
      
      style: ButtonStyle(
        //border
        shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )),

        foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),

        backgroundColor: MaterialStateProperty.resolveWith((states) => MyHelper.appConstent.primeryColor),

        textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(fontSize: SC.from_width(14),fontWeight: FontWeight.w600,color: Colors.white))
      )
    ),



  );
}