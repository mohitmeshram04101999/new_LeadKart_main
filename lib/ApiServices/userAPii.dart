


import 'package:dio/dio.dart';
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:leadkart/helper/helper.dart';

import '../Models/MycustomResponce.dart';
import '../Models/VerifyOtpModel.dart';

class UserApi
{
  String _baseUrl = "https://server.leadkart.dsmacademy.in/api/";


  //Log in with PhonNumber
  Future<Response<dynamic>> loginWithPhonNumber(String phonNum) async
  {
    var resp = await MyHelper.dio.post(ApiConst.loginWithPhon+phonNum,data: {
      "mobile":phonNum
    });

    return resp;

  }

  //verify otp
  Future<CustomResponce> verifyOtp(String phonNum,String otp) async
  {
    var _d = await MyHelper.dio.post(ApiConst.verifyOtp,data: {
      "mobile":phonNum,
      "otp":otp,
    });

    if(_d.statusCode==200)
    {
      VerifyOtpModel data = VerifyOtpModel.fromJson(_d.data);
      return CustomResponce(
        statusCode: _d.statusCode!,
        data: data.userCred,
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