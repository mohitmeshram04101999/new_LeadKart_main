

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/dimention.dart';

import '../helper/helper.dart';

ThemeData AppTheme()
{
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: AppConstent().primeryColor,
secondaryHeaderColor: AppConstent().leadTiletagColor,
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
        color: AppConstent().primeryColor,
        width: 2
      ),
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),

      // fillColor: WidgetStateProperty.resolveWith((state)=>Colors.white),
      checkColor: MaterialStateProperty.resolveWith((states) =>Colors.white),
    ),
    textTheme: TextTheme(
      displayMedium: TextStyles().mediumText,
      displaySmall: TextStyles().smallText,
      displayLarge: TextStyles().onBordingMainText,
      bodySmall: TextStyles().smallBoldText,
      titleMedium: TextStyles().greenMediumText,
      titleSmall: TextStyles().leadTileSubTitle,
    ),

    appBarTheme: AppBarTheme(
      titleSpacing: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppConstent().primeryColor
    ),




    outlinedButtonTheme: OutlinedButtonThemeData(

      style: ButtonStyle(

          iconSize: MaterialStateProperty.resolveWith((states) => SC.fromWidth(20)),
        padding:MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(horizontal: SC.fromWidth(25))),
          shape: MaterialStateProperty.resolveWith((states) =>RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )),
        side:MaterialStateProperty.resolveWith((states) => BorderSide(color: AppConstent().primeryColor))
      ),
    ),

    
    expansionTileTheme: const  ExpansionTileThemeData(
      shape: RoundedRectangleBorder(

      )
    ),


    //ColorScheme
    colorScheme: ColorScheme.light(
      primary: AppConstent().primeryColor,
      onSecondary: AppConstent().secondaryColor,
    ),
    
    //Eleveted Button THeme
    elevatedButtonTheme: ElevatedButtonThemeData(
      
      style: ButtonStyle(
        //border
        shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )),

        foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),

        backgroundColor: MaterialStateProperty.resolveWith((states) => AppConstent().primeryColor),

        textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(fontSize: SC.from_width(14),fontWeight: FontWeight.w600,color: Colors.white))
      )
    ),



  );
}