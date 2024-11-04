import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:leadkart/Models/permissions_model.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class RoleApi {
  final _log = Logger();
  final _userPref = UserPreference();
  //
  //Get All Sub Users
  Future<http.Response> getAllSubUsers({
    required String businessId,
    required String userId,
  }) async {
    final String uri =
        "${ApiConst.baseUrl}/user/getAllSubUser?userId=$userId&businessId=$businessId";
    // final String uri2 = "${ApiConst.baseUrl}/user/getAllSubUser?userId=66446389926d794e368c8f6c&businessId=664483cb34434c7cec80d6ed";
    var head = await UserPreference().getHeader();

    var resp = await http.get(Uri.parse(uri), headers: head);

    return resp;
  }

  //
  //send Otp to Email
  Future<http.Response> sendOtpToEmail(String phone) async {
    const uri = "${ApiConst.baseUrl}/user/V2/sendOtpForMobileV2";
    var head = await UserPreference().getHeader();

    var resp =
        await http.post(Uri.parse(uri), headers: head, body: {"mobile": phone});
    _log.i(resp.body);
    return resp;
  }

  //
  //verify Otp
  Future<http.Response> verifyOtp({
    required String phone,
    required String otp,
    required String businessId,
  }) async {
    const String uri = "${ApiConst.baseUrl}/user/V2/verifyMobileOtpV2";
    var head = await UserPreference().getHeader();

    var resp = await http.post(Uri.parse(uri),
        headers: head,
        body: {"mobile": phone, "otp": otp, "businessId": businessId});

    return resp;
  }

  Future<List<dynamic>?> getUserRoleAndPermissons({
    String userId = "66446389926d794e368c8f6c",
    required String businessId,
  }) async {
    String uri = "/permissionListApiForBusiness";
    var head = await UserPreference().getHeaderForDio();

    var resp = await MyHelper.dio.get(uri, options: Options(headers: head));

    _log.i("$businessId\n${resp.statusCode} \n${resp.data}");

    if (resp.statusCode == 200) {
      BusinessPermissionsResponse d =
          BusinessPermissionsResponse.fromJson(resp.data);
      return resp.data['data'];
    } else {
      _log.i("${resp.statusCode} \n${resp.data}");
    }
  }

  Future<List<dynamic>?> getAllSubUserByBusinessId({
    String userId = "66446389926d794e368c8f6c",
    required String businessId,
  }) async {
    String uri =
        "/user/getAllSubUserByBusinessId?businessId=$businessId&userId=$userId";
    var head = await UserPreference().getHeaderForDio();

    var resp = await MyHelper.dio.get(uri, options: Options(headers: head));

    _log.i("$businessId\n${resp.statusCode} \n${resp.data}");

    if (resp.statusCode == 200) {
      BusinessPermissionsResponse d =
          BusinessPermissionsResponse.fromJson(resp.data);
      return resp.data['data'];
    } else {
      _log.i("${resp.statusCode} \n${resp.data}");
    }
  }

  Future<Response> assignPermssionsToUser({
    required String businessId,
    required dynamic permissions,
    required String memberId,
  }) async {
    String uri = "/assignPermssionsToUser";
    var head = await UserPreference().getHeader();
    log("assignPermssionsToUser $permissions");
    log(head.toString());
    var data = {
      "businessId": businessId,
      "memberId": memberId,
      "permissions": "$permissions"
    };

    var resp = await MyHelper.dio
        .put(uri, data: data, options: Options(headers: head));

    return resp;
  }

  Future<Response> getAllRoleAndPerm({required String businessId}) async {
    var user = await _userPref.getUser();
    var head = await _userPref.getHeaderForDio();
    String uri = "/getAllUserRole?userId=${user?.id}&businessId=$businessId";

    var resp = await MyHelper.dio.get(uri, options: Options(headers: head));

    return resp;
  }

  Future<Response> getPermissionsList() async {
    var user = await _userPref.getUser();
    var head = await _userPref.getHeaderForDio();
    String uri = "/permissionListApi?userId=${user?.id ?? ""}";

    var resp = await MyHelper.dio.get(uri, options: Options(headers: head));

    return resp;
  }

  Future<Response> createRolePerm(
      {required String roleName,
      required List<Map<String, List<String>>> data,
      required String businessId}) async {
    var user = await _userPref.getUser();
    var head = await _userPref.getHeaderForDio();
    String uri = "/createuserRole?userId=${user?.id ?? ""}";

    var sendData = {
      "roleName": roleName,
      "permissions": data,
      "businessId": businessId
    };

    var resp = await MyHelper.dio
        .post(uri, data: sendData, options: Options(headers: head));

    return resp;
  }
}
