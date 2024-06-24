import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Authcontroller extends GetxController
{

  TextEditingController _phonNumController = TextEditingController();
  String _otp="";
  UserPreference preference = UserPreference();

  TextEditingController get phonController => _phonNumController;

  //Log In
  Future<dynamic> login(BuildContext context) async
  {

    if(phonController.text.trim() =="" || phonController.text.trim().length!=10)
    {
      MyHelper.mySnakebar(context,"Please Enter Mobile Number");
      return;
    }

    var resp = await MyHelper.userApi.loginWithPhonNumber(_phonNumController.text.trim());

    print(resp.statusCode);

    if(resp.statusCode==201)
    {
      Map<String,dynamic> _d = resp.data;
      _otp = _d["data"].toString();
      context.pushNamed("otpScreen");
    }
    else
    {
      print("${"--"*10}Responce from Log In Api${"--"*10}");
      print(resp.statusCode);
      print(resp.data);
      print("${"--"*10}Responce from Log In Api${"--"*10}");

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
      VerifyOtpModel v  = _d.data;
      CurruntUser user =  v.userCred!;
      await preference.saveUser(user);
      MyHelper.mySnakebar(context, "Log In SuccesFull");
      _phonNumController.clear();
      await Future.delayed(Duration(milliseconds: 500));
      context.pushNamed('homePage');
    }
    else
    {

      // Get.snackbar(_d.statusCode.toString(), _d.errorMessage.toString());
    }

  }
RxBool isUser= false.obs;
  //CheckUser is loggedIn or Not
 Future<bool> checkUserLogInOrNot(BuildContext context) async
  {
    CurruntUser? user =await preference.getUser();
    if(user!=null)
      {
        return true;
        // return "/homePage";
      }
    else
      {
        return false;
        // return "/logInScreen";
      }
  }


  Future<void> logOut(BuildContext context) async
  {
    preference.removeUser().then((v){
      MyHelper.mySnakebar(context, "Log out Success");
      context.goNamed("logInScreen");
    });

  }

}