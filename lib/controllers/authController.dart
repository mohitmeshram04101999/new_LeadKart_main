import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/ApiServices/userAPii.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/controllers/businessProvider.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class Authcontroller extends GetxController {
  TextEditingController _phonNumController = TextEditingController();
  String _otp = "";
  UserPreference preference = UserPreference();

  TextEditingController get phonController => _phonNumController;

  //Log In
  Future<dynamic> login(BuildContext context) async {
    if (phonController.text.trim() == "" ||
        phonController.text.trim().length != 10) {
      MyHelper.mySnakebar(context, "Please Enter Mobile Number");
      return;
    }

    var resp = await MyHelper.userApi
        .loginWithPhonNumber(_phonNumController.text.trim());

    Logger().e(resp.statusCode);
    Map<String, dynamic> _d;

    if (resp.statusCode == 201) {
      _d = jsonDecode(resp.body);
      _otp = _d["data"].toString();
      context.pushNamed("otpScreen");
    }
    else if(resp.statusCode==404)
    {


      MyHelper.mySnakebar(context,'Resource not Found');
    }else {
      print("${"--" * 10}Responce from Log In Api${"--" * 10}");
      print(resp.statusCode);
      print("${"--" * 10}Responce from Log In Api${"--" * 10}");

      //snakebArr
      MyHelper.mySnakebar( 
          context, "(${resp.statusCode}) ${jsonDecode(resp.body)["message"].toString()}");
    }
    return resp;
  }

  Future<void> resendOtp(BuildContext context) async {
    var resp = await MyHelper.userApi
        .loginWithPhonNumber(_phonNumController.text.trim());
    Map<String, dynamic> _d;
    if (resp.statusCode == 201) {
       _d = jsonDecode(resp.body);
      _otp = _d["data"].toString();
    } else {
      print(resp.statusCode);
       

      //snakeBar
      MyHelper.mySnakebar(
          context, "(${resp.statusCode}) ${jsonDecode(resp.body)["message"].toString()}");
    }
  }

  //Verifing otp
  Future<dynamic> verifyOtp(String otp, BuildContext context) async {
    if (otp.isEmpty) {
      MyHelper.mySnakebar(context, "Enter otp");
      return;
    }

    CustomResponce _d =
        await UserApi().verifyOtp(_phonNumController.text.trim(), otp);

    if (_d.statusCode == 200 && _d.data != null) {
      _phonNumController.clear();
      VerifyOtpModel v = _d.data;
      CurrentUser user = v.userCred!;
      await preference.saveUser(user).then(
        (value) async {
          if (value) {
            MyHelper.mySnakebar(context, "Logged in successfully",
                color: Colors.green);

            var p = Provider.of<BusinessProvider>(context, listen: false);

            await p.lode(context);
            log(p.allBusiness.length.toString());
            if (p.allBusiness.length == 0) {
              context.goNamed("createBusinessScreen");
            } else {
              Logger().f('allbusiness[0] ${p.allBusiness[0]}');
              p.setCurrentBusiness(context, p.allBusiness[0]);
              context.goNamed("homePage");
            }
            // CustomResponce _d  = await MyHelper.bussnissApi.getBusinessByUserId(userId: user.id!);

            // context.goNamed('homePage');
          }
        },
      );
    } else {
      Get.snackbar(_d.statusCode.toString(), _d.errorMessage.toString());
    }
  }

  RxBool isUser = false.obs;
  //CheckUser is loggedIn or Not
  Future<bool> checkUserLogInOrNot(BuildContext context) async {
    CurrentUser? user = await preference.getUser();
    if (user != null) {
      return true;
      // return "/homePage";
    } else {
      return false;
      // return "/logInScreen";
    }
  }

  logOut(BuildContext context) {
    preference.removeUser().then((v) {
      MyHelper.mySnakebar(context, "Logged out successfully");
      context.goNamed("logInScreen");
    });
  }
}
