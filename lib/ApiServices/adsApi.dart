import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/ad_type_model.dart';
import 'package:leadkart/Models/addListByBussnesIdModel.dart';
import 'package:leadkart/Models/estimateddataModel.dart';
import 'package:leadkart/Models/targetAreaResponceModel.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class AdsApi {
  final _log = Logger();

  //create Add Api
  Future<dynamic> createAdd({
    required String businessId,
    String? planId,
    String? name,
    String optimizationGoal = "REACH",
    String billingEvent = "IMPRESSIONS",
    dynamic targating,
    Map<String, dynamic> interest = const {
      "id": 6018341976753,
      "name": "Movies"
    },
    bool isFaceBookAddEnable = false,
    bool isInstaAddEnable = false,
    bool isGoogleAddEnable = false,
    String? file,
    int? faceBookBudget,
    int? instBudget,
    int? googleBudget,
    String? destinationUrl,
    List<TargetArea>? location,
    List<int>? audienceGender,
    int? ageRangeFrom,
    List<int>? days,
    int? ageRangeTo,
    String? dayStartTime,
    String? dayEndTime,
    required String adTypeId,
    String? caption,
    String? startDate,
    String? endDate,
  }) async {

    List<Map<String,String>> locationData = [];

    if(location!=null)
      {
        location.forEach((area) {
          locationData.add({"key":"${area.key}"});
        },);
      }

    var data = {
      "businessId": businessId,
      // "planId": planId,
      "name": name,
      //static
      "optimization_goal": "REACH",
      "billing_event": "IMPRESSIONS",
      // "start_time": "2024-10-06T04:45:17+0000",
      // "status": "PAUSED",
      // "file":file
      "dailySpendBudget": 10000,
      // "externalCampiagnId": "66879f2b9cc7c8273dfd0901",
      "isFacebookAdEnabled": isFaceBookAddEnable,
      // "isInstaAdEnabled": isInstaAddEnable,
      // "isGoogleAdEnabledokAdSetId": isGoogleAddEnable,
      // "facebookBudget": faceBookBudget,
      "facebookBudget": faceBookBudget,
      // "instaBudget": instBudget,
      // "googleBudget": googleBudget,
      "destinationUrl": destinationUrl,
      // "audienceId": null,
      // "location": location!=null? location.toJson().toString() :null,

      "days": 1,
      "interest": {"id": 6018341976753, "name": "Movies"},
      "audienceGender": "1",
      "ageRangeFrom": ageRangeFrom,
      "ageRangeTo": ageRangeTo,
      "dayStartTime": dayStartTime,
      // "dayStartTime": dayStartTime?.toString(),
      "dayEndTime": dayEndTime,
      // "dayEndTime": dayEndTime?.toString(),
      "addTypeId": "667a7c6df68bde8bec7ad3a7",
      // "caption": caption,
      "startDate": startDate,
      // "startDate":startDate,
      "endDate": endDate,
      // "endDate":endDate,
    };


    Logger().t(data);

//     Map<String, String> fakeData = {
//       "businessId": businessId,
// //planId:6656cf2e1302350b8be0af21
//       "name": "bhupendra",
//       "optimization_goal": "REACH",
//       "billing_event": "IMPRESSIONS",
// //status:PAUSED
//       "dailySpendBudget": "100000",
// //externalCampiagnId:66879f2b9cc7c8273dfd0901
//       "isFacebookAdEnabled": "true",
// //isInstaAdEnabled:true
// //isGoogleAdEnabledokAdSetId:false
//       "facebookBudget": "145400",
// //instaBudget:200000
// //googleBudget:
//       "destinationUrl": "jhghjjkhghjhj.com",
// //audienceId:
//       "location": "{countries:['IN']}",
//       "interest": "{id: '6018341976753', name: 'Movies'}",
//       "audienceGender": "1",
//       "ageRangeFrom": "18",
//       "ageRangeTo": "50",
//       "days": "1",
//       "dayStartTime": "0",
//       "dayEndTime": "23:59",
//       "addTypeId": "667a7c6df68bde8bec7ad3a7",
// //caption:
//       "startDate": "1723186321",
//       "endDate": "1723359121",
//       "days": "2",
//       "audienceGender": "2",
// //filename:
//     };

    String uri = "/adsDetails/createAdsDetails";
    // var head = await UserPreference().getHeader() as Map<String, String>;
    var dataToSend = data.map((key, value) => MapEntry(key, value.toString()));
    // data.forEach((key, value) {
    //   if (value != null && value != "") {
    //     dataToSend[key] = value.toString();
    //   }
    // });


    var request =
        http.MultipartRequest("POST", Uri.parse(ApiConst.baseUrl + uri));
    CurrentUser? user = await Controllers.useraPrefrenc.getUser();
    request.fields.addAll(dataToSend);
    request.headers.addAll({"Authorization": user!.token.toString()});


    Logger().t(" gender ${audienceGender}");

    if (audienceGender != null) {
      for (int i = 0; i < audienceGender.length; i++) {
        request.fields["audienceGender[$i]"] = audienceGender[i].toString();
      }
    }

    Logger().t(" days ${days}");
    if (days != null) {
      for (int i = 0; i < days.length; i++) {

        request.fields["days[$i]"] = days[i].toString();
      }
    }

    Logger().t(" Location ${location?[0].key}");

    if(location!=null)
      {
        for (int i = 0; i < location.length; i++) {
          request.fields["location[$i]"] = location[i].key.toString();
        }
      }

    if (file != null) {
      request.files.add(await http.MultipartFile.fromPath(
        "filename",
        file ?? "",
      ));
    }
    _log.e(file.toString());

    var resp = await request.send();
    Logger().e("frome create add ${resp.statusCode}");
    String responceBody = await resp.stream.bytesToString();
    Logger().e(responceBody);
    var j = jsonDecode(responceBody);

    _log.e("${resp.statusCode}\n$j}");

    return j;
  }

  // get all adds
  getAllAdvertisementTypes() async {
    try {
      final CurrentUser? _user =
          await Controllers.userPreferencesController.getUser();
      var resp = await MyHelper.dio.get('advertisement/getAllAdvertisment',
          options: Options(headers: {
            "Authorization": "${_user!.token}",
          }));
      // MyHelper.logger.i(resp.data['data']);
      List<AdvertisementTypeModel> adsTypeModel = [];
      for (var i in resp.data['data']) {
        adsTypeModel.add(AdvertisementTypeModel.fromJson(i));
      }

      if (resp.statusCode == 200) {
        // MyHelper.logger.i(adsTypeModel);
      } else {
        MyHelper.logger.i(adsTypeModel);
      }
      return adsTypeModel;
    } catch (e) {
      MyHelper.logger.e(e);
    }
  }

  // get single ad by id
  getSingleAdvertisementById(String adId) async {
    try {
      final CurrentUser? _user =
          await Controllers.userPreferencesController.getUser();
      var resp =
          await MyHelper.dio.get('advertisement/getSingleAdvertisment/$adId',
              options: Options(headers: {
                "Authorization": "${_user!.token}",
              }));
      MyHelper.logger.i(resp.data);
      return resp;
    } catch (e) {
      MyHelper.logger.e(e);
    }
  }

  Future<EstimetedDataResponce?> getEstimatedPlan({
    String? adTypeId,
    required int? instaBudget,
    required int? facebookBudget,
  }) async {
    var user = await UserPreference().getUser();

    var head = await UserPreference().getHeader();

    String uri =
        "/advertisement/getEstimates/667a7c6df68bde8bec7ad3a7?instaBudget=$instaBudget&fbBudget=$facebookBudget&userId=${user?.id ?? ""}";

    var resp = await MyHelper.dio.get(uri);

    if (resp.statusCode == 200) {
      EstimetedDataResponce data = EstimetedDataResponce.fromJson(resp.data);
      return data;
    } else {
      Logger().i("THis Resp\n${resp.statusCode}\n$resp");
    }
  }

  Future<AddListByBusinessResponce?> getAddListByBusiness(
      {String businessId = "664483cb34434c7cec80d6ed",
      required int page}) async {
    try {
      String uri = "/getAllMyAdsListApi?businessId=$businessId&page=$page";

      var head = await UserPreference().getHeader();

      var resp = await MyHelper.dio.get(uri, options: Options(headers: head));

      if (resp.statusCode == 200) {
        var _d = await AddListByBusinessResponce.fromJson(resp.data);
        return _d;
      } else {
        _log.e("Responce From\n${resp.statusCode}\n${resp.data}");
      }
    } catch (e) {
      _log.e(e);
    }
  }

  Future<Response?> getInterests(
      {required String businessId, required String query}) async {
    try {
      final CurrentUser? _user =
          await Controllers.userPreferencesController.getUser();

      var head = await UserPreference().getHeaderForDio();
      Logger().i(ApiConst.baseUrl +
          'targetingInterest?businessId=$businessId&search=$query');
      var resp = await MyHelper.dio.get(
          'targetingInterest?businessId=$businessId&search=$query',
          options: Options(headers: head));
      MyHelper.logger.i(resp.data['data']);
      return resp;
    } catch (e) {
      MyHelper.logger.e(e);
    }
  }


  Future<http.Response> getLocationData(String location,{String businessId = "664483cb34434c7cec80d6ed"}) async
  {

    final String uri =  ApiConst.baseUrl+"/searchTargetArea?businessId=$businessId&search=Bhopal";
    var resp = await http.get(Uri.parse(uri));
    Logger().i("Location area api\n${resp.statusCode}\n${jsonDecode(resp.body)}");
    return resp;
    
  }
}
