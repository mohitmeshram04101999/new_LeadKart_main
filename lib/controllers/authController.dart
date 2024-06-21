import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Authcontroller extends GetxController
{

  TextEditingController _phonNumController = TextEditingController();
  String _otp="";

  TextEditingController get phonController => _phonNumController;

  //Log In
  Future<dynamic> login(BuildContext context) async
  {

    if(phonController.text.trim() =="")
    {
      MyHelper.mySnakebar(context,"Please Enter Mobile Number");
      return;
    }

    var resp = await MyHelper.userApi.loginWithPhonNumber(_phonNumController.text.trim());
    if(resp.statusCode==201)
    {
      Map<String,dynamic> _d = resp.data;
      _otp = _d["data"].toString();
      context.pushNamed("otpScreen");

    }
    else
    {
      //snakebArr
      MyHelper.mySnakebar(context, "(${resp.statusCode}) ${resp.data["message"].toString()}");

    }
    return resp;
  }

  //Verifing otp
  Future<dynamic> verifyOtp(String otp, BuildContext context)async
  {
    CustomResponce _d = await MyHelper.userApi.verifyOtp(_phonNumController.text.trim(), otp);

    if(_d.statusCode==200&&_d.data!=null)
    {
      CurruntUser user =  _d.data;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String storvalue =  jsonEncode(user.toJson());
      print(user.toJson());
      await pref.setString("user", storvalue);
      // Get.snackbar("", _d.message);
      context.pushNamed('homePage');
    }
    else
    {

      // Get.snackbar(_d.statusCode.toString(), _d.errorMessage.toString());
    }

  }

}