


import 'package:dio/dio.dart';
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../Models/MycustomResponce.dart';
import '../Models/VerifyOtpModel.dart';

class UserApi
{
  // String _baseUrl = "https://server.leadkart.dsmacademy.in/api/";
  String _baseUrl = "https://api.leadkart.in/";


  //Log in with PhonNumber
  Future<http.Response> loginWithPhonNumber(String phonNum) async
  {
    var data = {
      "mobile":phonNum
    };
    var resp = await http.post(Uri.parse(ApiConst.baseUrl+ApiConst.loginWithPhon+phonNum),body:data );
    Logger().e('${resp.statusCode}\n${resp.body}');

    return resp;

  }

  //verify otp
  Future<CustomResponce> verifyOtp(String phonNum,String otp) async
  {

    var _d = await MyHelper.dio.post(ApiConst.verifyOtp,data: {
      "mobile":phonNum,
      "otp":otp,
    });


    Logger().e('${_d.statusCode} ${_d.data}');

    if(_d.statusCode==200)
    {
      VerifyOtpModel data = VerifyOtpModel.fromJson(_d.data);
      return CustomResponce(
        statusCode: _d.statusCode!,
        data: data,
        message: data.message!,
      );

    }
    else
    {

      print("${"--"*10} responce from Verify Otp ${"--"*10}");
      print(_d.statusCode);
      print(_d.data);
      print("${"--"*10} responce from Verify Otp ${"--"*10}");
      return CustomResponce(
        statusCode: _d.statusCode!,
        errorMessage: _d.data.toString(),
        errorStatus: true,
        message: _d.statusMessage!,

      );
    }

  }

  // get user by id
  Future<CurrentUser?> getUserById() async
  {
    try{
      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
    var resp = await MyHelper.dio.get('user/getByIdUser/${_user!.id!}', options: Options(
      headers: {
        "Authorization": "${_user.token}",
      }
    ));
      MyHelper.logger.i(resp.data);
    resp.data;
    CurrentUser user = CurrentUser.fromJson(resp.data["data"]);
    MyHelper.logger.i(user);
    MyHelper.logger.i(user.toJson());
    return user;
    }
    catch(e)
    {
      MyHelper.logger.e(e);
    }
  }


  // update user profile
   updateUserProfile(String userId) async
  {
    try{
      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
    var resp = await MyHelper.dio.put('/user/updateProfile/$userId',data: {
      "email":"hjghghwghweg@heefe.com"
    }, options: Options(
      headers: {
        "Authorization": "${_user!.token}",
      }
    ));
    CurrentUser user = CurrentUser.fromJson(resp.data);
    MyHelper.logger.i(resp.data);
    return resp;
    }
    catch(e)
    {
      MyHelper.logger.e(e);
    }
  }


}


//
// class PinController extends GetxController {
//   var pin = ''.obs;
//
//   void setPin(String value) {
//     pin.value = value;
//   }
//
//   void submitPin() async {
//     final response = await http.post(
//       Uri.parse('https://example.com/submit-pin'), // Replace with your endpoint
//       body: {'pin': pin.value},
//     );
//
//     if (response.statusCode == 200) {
//       Get.snackbar('Success', 'PIN submitted successfully!');
//     } else {
//       Get.snackbar('Error', 'Failed to submit PIN');
//     }
//   }
// }