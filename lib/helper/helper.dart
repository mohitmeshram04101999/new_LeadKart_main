

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:leadkart/ApiServices/BussnessApi.dart';
import 'package:leadkart/ApiServices/userAPii.dart';
import 'package:leadkart/controllers/imageEditorController.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/them/constents.dart';
import 'package:logger/logger.dart';

class MyHelper
{
  static AppConstent appConstent = AppConstent();
  static TextStyles textStyls = TextStyles();
  static UserApi userApi = UserApi();
  static BussnissApi bussnissApi = BussnissApi();
  static Logger logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );



  static Dio dio = Dio(
    BaseOptions(baseUrl: "https://server.leadkart.dsmacademy.in/api/"),
  );
  static mySnakebar(BuildContext context,String descriptioin, {Color? color})
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior:SnackBarBehavior.floating,
        duration:const  Duration(milliseconds: 2000),
        // margin:EdgeInsets.symmetric(horizontal: 30,vertical: 8),
        backgroundColor: Colors.transparent,

        //Container
        content: Center(child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 2,offset:const  Offset(1,2),
                )
              ],
              color: color??Colors.red.withOpacity(.75),
            ),
            child: Text(descriptioin,textAlign: TextAlign.center,style: TextStyle(height: 1,fontWeight: FontWeight.w400,fontSize: SC.from_width(17)),)))));
  }

  static  String titleFormate(String s)
  {

    String d = s.replaceAll("_", " ").capitalizeFirst!;
    return d;
  }

  static mybottomPanel({required BuildContext context,required Widget Function(BuildContext, ScrollController) builder})=>showModalBottomSheet(
    showDragHandle: true,
    context: context,
    // backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => DraggableScrollableSheet(
      snap: true,
      expand: false,
      controller: DraggableScrollableController(),
      minChildSize: .4,
      builder: builder,
    ),
  );


  static String formatDateTime(DateTime dateTime)
  {
    var month ={
      1:"Jan",
      2:"Fab",
      3:"Mar",
      4:"Apr",
      5:"May",
      6:"Jun",
      7:"Jul",
      8:"Aug",
      9:"Sep",
      10:"Oct",
      11:"Nov",
      12:"Dec",
    };


    String date = dateTime.toString().split(" ").first;
    return "${dateTime.day} ${month[dateTime.month]},${dateTime.year}";
  }


  static String reFormatDatTime(String date)
  {
    var _n = date.split(" ");
    String newData = "";
    for(int i = 0;i<3;i++)
      {
        newData += "${_n[i]} ";
      }
    return newData;
  }

  static String formatTime(TimeOfDay time)
  {
    return "${time.hour%12} : ${time.minute} ${time.hour>=12?"PM":"AM"}";
  }
}