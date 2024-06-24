

import 'package:flutter/foundation.dart';
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

    //inputDecoration
    inputDecorationTheme: InputDecorationTheme(

        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade400)
        ),

      hintStyle: TextStyle(
        fontSize: SC.from_width(17),
        fontWeight: FontWeight.w400
      ),



      labelStyle: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w500,
        fontSize: SC.from_width(17)
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade700),
        borderRadius: BorderRadius.circular(10)
      ),

      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade700),
          borderRadius: BorderRadius.circular(10)
      )
    ),
    
    
    checkboxTheme: CheckboxThemeData(
      
      side: BorderSide(
        color: MyHelper.appConstent.primeryColor,
        width: 2
      ),
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),

      fillColor: WidgetStateProperty.resolveWith((state)=>Colors.white),
      checkColor: MaterialStateProperty.resolveWith((states) =>MyHelper.appConstent.primeryColor),
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
        padding:MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(horizontal: SC.fromWidth(25))),
          shape: MaterialStateProperty.resolveWith((states) =>RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )),
        side:MaterialStateProperty.resolveWith((states) => BorderSide(color: MyHelper.appConstent.primeryColor))
      ),
    ),



    //ColorScheme
    colorScheme: ColorScheme.light(
      primary: MyHelper.appConstent.primeryColor,
      onSecondary: MyHelper.appConstent.secondaryColor,
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