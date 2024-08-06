

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:http/http.dart' as http;
import 'package:leadkart/Models/rolsforSubUsersapiResponce.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:logger/logger.dart';

class RoleApi
{

  final _log = Logger();
  //
  //Get All Sub Users
  Future<http.Response> getAllSubUsers({
    required String businessId,
    required String userId,
})async
  {
    final String uri = "${ApiConst.baseUrl}/user/getAllSubUser?userId=$userId&businessId=$businessId";
    // final String uri2 = "${ApiConst.baseUrl}/user/getAllSubUser?userId=66446389926d794e368c8f6c&businessId=664483cb34434c7cec80d6ed";
    var head =  await UserPreference().getHeader();

    var resp = await http.get(Uri.parse(uri),headers: head);

    return resp;
  }

  //
  //send Otp to Email
  Future<http.Response> sendOtpToEmail(String email)async
  {
    const uri = "${ApiConst.baseUrl}/user/sendOtpForEmail";
    var head =  await UserPreference().getHeader();

    var resp = await http.post(Uri.parse(uri),headers: head,body: {
      "email":email
    });
    _log.i(resp.body);
    return resp;
  }

  //
  //verify Otp
  Future<http.Response> verifyOtp({
    required String email,
    required String otp,
    required String businessId,
}) async
  {
    const String uri = "${ApiConst.baseUrl}/user/verifyEmailOtp";
    var head =  await UserPreference().getHeader();

    var resp = await http.post(Uri.parse(uri),headers: head,body: {
      "email":email,
      "otp":otp,
      "businessId":businessId
    });

    return resp;

  }


  Future<List<Role>?> getUserRole({
    String userId = "66446389926d794e368c8f6c",
    required String businessId,
}) async
  {
    String uri = "/getAllUserRole?userId=$userId&businessId=$businessId";
    var head = await UserPreference().getHeaderForDio();
    
    var resp = await MyHelper.dio.get(uri,options: Options(headers: head));
    
    _log.i("$businessId\n${resp.statusCode} \n${resp.data}");

    if(resp.statusCode==200)
      {
        GetRoleForSubUserApiResponce d = GetRoleForSubUserApiResponce.fromJson(resp.data) ;
        return d.data;
      }
    else
      {
        _log.i("${resp.statusCode} \n${resp.data}");
      }



  }


  Future<Response> assignRoleToSubUser({
    required String userToken,
    required String roleId,
    required String businessId,
    required String name,
    required String password,

}) async
  {
    const uri =  "/user/CreateSubUser";
    var head = await UserPreference().getHeader();

   var  data = {
     "businessId":businessId,
     "password":password,
     "name":name,
     "roleId":roleId,
     "memberToken":userToken,
   };

    var resp = await MyHelper.dio.put(uri,data:data ,options: Options(headers: head));

    return resp;
  }



}