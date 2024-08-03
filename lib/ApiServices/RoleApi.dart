

import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:http/http.dart' as http;
import 'package:leadkart/controllers/shredprefrence.dart';
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

    var resp = await http.post(Uri.parse(uri),body: {
      "email":email,
      "otp":otp,
      "businessId":businessId
    });

    return resp;

  }



}