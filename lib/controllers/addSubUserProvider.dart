
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/ApiServices/RoleApi.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/animated%20dilog.dart';
import 'package:logger/logger.dart';
import 'package:pinput/pinput.dart';

class AddSubUserProvider with ChangeNotifier
{

  final RoleApi _roleApi = RoleApi();
  final _log  = Logger();

  final TextEditingController _emailController = TextEditingController();
  String? _otp;

  TextEditingController get emailController =>_emailController;


  Future<void>  addUser(BuildContext context)async
  {

    bool proside;

    //getting Email
    proside = await OpenDailovgWithAnimation(
        context,
        barriarDissmesible: false,
        curve: Curves.easeOut,
        dailog: AlertDialog(
      title: const Text("Enter user email"),
      content: CustomTextField(
        labelText: "Email",
        validator: (v){
          if(emailController.text.isEmpty)
            {
              return null;
            }
          if(emailController.text.trim().isNotEmpty&&emailController.text.contains(".")&&emailController.text.contains("@"))
            {
              return null;
            }
          else
            {
              return "Enter proper Email";
            }
        },
        controller: emailController,
      ),
          actions: [MyactionButton(
            action: ()async{
                if(emailController.text.trim().isNotEmpty&&emailController.text.contains(".")&&emailController.text.contains("@"))
                  {
                    var resp =await _roleApi.sendOtpToEmail(emailController.text.trim());
                    if(resp.statusCode==200)
                      {
                        Navigator.pop(context,true);
                      }
                    else
                      {
                        MyHelper.mySnakebar(context, "${resp.statusCode} ${resp.body}");
                      }
                  }
                else
                  {MyHelper.mySnakebar(context, "Envalid Email");
                  }
              }, lable: "Next",)],
    ));

    //get Otp
    if(proside)
      {
        proside = await OpenDailovgWithAnimation(context,
            animation: dailogAnimation.slidUp,
            dailog: AlertDialog(
          title:const  Text("Verify Otp"),
          content: SizedBox(
            height: SC.from_width(60),
            child: Pinput(
              length: 4,
              onChanged: (b){
                _otp = b;
              },
              onCompleted: (b){
                _otp = b;
              },
            ),
          ),
          actions: [MyactionButton(action: ()async{
            if(_otp?.length==4)
              {
                String bId= Controllers.businessProvider(context).currentBusiness?.id??"";
                var resp = await _roleApi.verifyOtp(
                    email: _emailController.text.trim(),
                    otp: _otp??"",
                    businessId: bId);

                _log.i(resp.body);
                print(resp.body);
                if(resp.statusCode==200)
                  {
                    Navigator.pop(context,true);
                  }
                else
                  {
                    var decode = jsonDecode(resp.body);
                    _log.i("${resp.statusCode} \n ${resp.body}");
                    MyHelper.mySnakebar(context, "${decode["message"]}");
                  }
              }
            else
              {
                MyHelper.mySnakebar(context, "Enter Velid Otp");
              }
          },lable: "Verify",)],
        ));
      }

    if(proside)
      {
        await OpenDailovgWithAnimation(context, dailog: AlertDialog(
          title: const Text("Select Role"),
          content: DropdownButtonFormField(
            onChanged: (c){},
            items: [
              DropdownMenuItem(
                value: "sd",
                child: Text("Options"),),
              DropdownMenuItem(
                value: "sdf",
                child: Text("Options"),),
              DropdownMenuItem(
                value: "sdf",
                child: Text("Options"),),
              DropdownMenuItem(
                value: "sdfd",
                child: Text("Options"),),
            ],
          ),
        ));
      }
    clear();

  }

  clear()
  {
    _emailController.clear();
    _otp = null;
  }

}