
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/ApiServices/RoleApi.dart';
import 'package:leadkart/Models/rolsforSubUsersapiResponce.dart';
import 'package:leadkart/Models/verifsubuserOtpModel.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String? _otp;
  List<Role> _role = [];

  TextEditingController get emailController =>_emailController;
  TextEditingController get passController =>_passController;
  TextEditingController get nameController =>_nameController;
  List<Role> get roles => _role;



  Future<void>  addUser(BuildContext context)async
  {

    final cancelButton = Align(alignment: Alignment.centerRight,child:InkWell(
        onTap: (){
          Navigator.pop(context);
          clear();
        },
        child: Icon(Icons.close)),);

    bool proside;
    SubUserData? subUserData;
    var currentBusiness = Controllers.businessProvider(context).currentBusiness;
    //getting Email
    proside = await OpenDailovgWithAnimation(
        context,
        barriarDissmesible: false,
        curve: Curves.easeOut,
        dailog: AlertDialog(
          icon:cancelButton,
      title: const  Text("Enter Email"),
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
            barriarDissmesible: true,
            animation: dailogAnimation.slidUp,
            dailog: AlertDialog(
              icon: cancelButton,
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

                    var decode = jsonDecode(resp.body);
                    var d  = VerifySubUsersOtpApiResponce.fromJson(decode);
                    subUserData = d.data;
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
        String? selectedRoleId;
        await OpenDailovgWithAnimation(context, barriarDissmesible: false,dailog: AlertDialog(
          icon: cancelButton,

          title: const Text("Add a Member"),
          content:FutureBuilder<List<Role>?>(
            future: _roleApi.getUserRole(businessId: currentBusiness?.id??""),
            builder: (context,snap){
              if(snap.connectionState==ConnectionState.waiting)
                {
                  return const SizedBox(
                    height: 50,
                      width: 50,
                      child:  Center(child: CircularProgressIndicator()));
                }
              if(snap.hasError)
                {
                  return Center(child: Text(
                    snap.error.toString(),
                  ),);
                }

              if(snap.data?.isEmpty??true)
                {
                  return const Center(child: Text("No Role Found"),);
                }


              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(_emailController.text,
                  style: const TextStyle(color: Colors.grey),),
                  const SizedBox(height: 10,),

                  CustomTextField(
                      controller: _nameController,
                      labelText: "Name"),
                  const SizedBox(height: 10,),

                  CustomTextField(
                      controller: _passController,
                      labelText: "Password"
                  ),
                  const SizedBox(height: 10,),


                  DropdownButtonFormField(
                    onChanged: (c){
                      _log.e(c);
                      selectedRoleId = c;
                    },
                    items: [
                      for(Role rol in snap.data??[])
                        DropdownMenuItem(
                            value: rol.id,
                            child: Text(rol.roleName??"")
                        )
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Center(
                    child: ElevatedButton(onPressed: () async{
                      if(_nameController.text.isEmpty)
                        {
                          MyHelper.mySnakebar(context, "Enter user name please");
                          return ;
                        }
                      if(_passController.text.isEmpty)
                        {
                          MyHelper.mySnakebar(context, "Enter password please");
                          return ;
                        }
                      if(selectedRoleId==null)
                        {
                          MyHelper.mySnakebar(context, "Select Role");
                          return ;
                        }

                      var  resp = await _roleApi.assignRoleToSubUser(
                          userToken: subUserData?.token??"",
                          roleId: selectedRoleId??"",
                          businessId: currentBusiness?.id??"",
                          name: _nameController.text.trim(),
                          password: _passController.text.trim());

                      if(resp.statusCode==200)
                        {
                          MyHelper.mySnakebar(context, "${resp.data["message"]}");
                          Navigator.pop(context);
                          clear();
                          Controllers.subUserProvider(context).lode(context);
                        }
                      else
                        {
                          MyHelper.mySnakebar(context, "${resp.statusCode}\n${resp.data}");
                        }

                    }, child: const Text("Add Member")),
                  ),
                ],
              );
            },
          ),
        ));
      }


    clear();

  }

  clear()
  {
    _emailController.clear();
    _nameController.clear();
    _passController.clear();
    _otp = null;
    _role = [];
  }

}