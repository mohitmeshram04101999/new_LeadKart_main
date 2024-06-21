

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/ApiServices/userAPii.dart';
import 'package:leadkart/controllers/imageEditorController.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/them/constents.dart';

class MyHelper
{
  static AppConstent appConstent = AppConstent();
  static TextStyles textStyls = TextStyles();
  static UserApi userApi = UserApi();
  static Dio dio = Dio(
    BaseOptions(baseUrl: "https://server.leadkart.dsmacademy.in/api/"),
  );
  static mySnakebar(BuildContext context,String descriptioin)
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior:SnackBarBehavior.floating,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
        margin:EdgeInsets.symmetric(horizontal: 30,vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.red,

        //Container
        content: Center(child: Text(descriptioin,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: SC.from_width(13)),))));
  }
}