import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/business_model.dart';
import 'package:leadkart/controllers/businessProvider.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/busines_category.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:provider/provider.dart';
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
      print("1");
      Map<String,dynamic> _d = resp.data;
      print("2");
      _otp = _d["data"].toString();
      print("3");
      context.pushNamed("otpScreen");
      print("4");

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
      CurrentUser user =  v.userCred!;
      await preference.saveUser(user).then((value)async{
        if(value) {
          MyHelper.mySnakebar(context, "Logged in successfully", color: Colors.green);

          var p =  Provider.of<BusinessProvider>(context,listen: false);

          await p.lode();

          if(p.allBusiness.length==0)
            {
context.goNamed("createBusinessScreen");
            }
          else
            {
              p.setCurrentBusiness(p.allBusiness[0]);
context.goNamed("homePage");
            }
          // CustomResponce _d  = await MyHelper.bussnissApi.getBusinessByUserId(userId: user.id!);

          // context.goNamed('homePage');
        }
      },);

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
    CurrentUser? user =await preference.getUser();
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


  logOut(BuildContext context)
  {
    preference.removeUser().then((v){
      MyHelper.mySnakebar(context, "Logged out successfully");
      context.goNamed("logInScreen");
    });

  }

}