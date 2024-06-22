

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
        // margin:EdgeInsets.symmetric(horizontal: 30,vertical: 8),
        backgroundColor: Colors.transparent,

        //Container
        content: Center(child: Container(
          padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.6),
                  blurRadius: 2,offset: Offset(1,2),
                )
              ],
              color: Colors.red,
            ),
            child: Text(descriptioin,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: SC.from_width(17)),)))));
  }
}