import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/ad_type_model.dart';
import 'package:leadkart/Models/ads_model.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class AdsApi{



  //create Add Api
  createAdd({
    required String businessId,
    String? planId,
    String? name,
    String  optimizationGoal ="REACH",
    String billingEvent = "IMPRESSIONS",
    dynamic targating,
    Map<String,dynamic> interest  = const  {"id": 6018341976753, "name": "Movies"},
    bool isFaceBookAddEnable = false,
    bool isInstaAddEnable = false,
    bool isGoogleAddEnable = false,
    String? file,
    int? faceBookBudget,
    int? instBudget,
    int? googleBudget,
    String? destinationUrl,
    dynamic location = const {"countries":["IN"]},
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

})async
  {

    var  data = {
      "businessId": businessId,
      "planId": planId,
      "name": name,
      "optimization_goal": "REACH",
      "billing_event": "IMPRESSIONS",
      // "start_time":"2024-10-06T04:45:17+0000",
      // "status": "PAUSED",
      // "file":file
      "dailySpendBudget": 10000,
      // "externalCampiagnId": "66879f2b9cc7c8273dfd0901",
      "isFacebookAdEnabled": isFaceBookAddEnable,
      "isInstaAdEnabled": isInstaAddEnable,
      "isGoogleAdEnabledokAdSetId": isGoogleAddEnable,
      "facebookBudget": faceBookBudget,
      "instaBudget": instBudget,
      "googleBudget": googleBudget,
      "destinationUrl": destinationUrl,
      // "audienceId": null,
      "location": { "countries": ["IN"] },
      "interest": { "id": 6018341976753, "name": "Movies" },
      // "audienceGender": audienceGender,
      "ageRangeFrom": ageRangeFrom,
      "ageRangeTo": ageRangeTo,
      "dayStartTime": dayStartTime?.toString(),
      "dayEndTime": dayEndTime?.toString(),
      "addTypeId": adTypeId,
      "caption": caption,
      "startDate":startDate,
      "endDate":endDate,
    };

    String uri = "/adsDetails/createAdsDetails";
    Map<String,String> dataToSend = {};
    data.forEach((key,value){
      if(value !=null  && value !="")
        {
          dataToSend[key] = value.toString();
        }
    });


    var request =  http.MultipartRequest("POST",Uri.parse(ApiConst.baseUrl+uri));

    request.fields.addAll(dataToSend);

    if(file!=null)
      {
        request.files.add(await http.MultipartFile.fromPath("filename", file.toString()??"", ));
      }


    var resp = await request.send();

    String responceBody = await resp.stream.bytesToString();
    Logger().e(resp.statusCode);
    Logger().e(responceBody);


    Logger().i(dataToSend);

  }


  // get all adds
  getAllAdvertisementTypes() async
  {
    try{
      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
    var resp = await MyHelper.dio.get('advertisement/getAllAdvertisment', options: Options(
      headers: {
        "Authorization": "${_user!.token}",
      }
    ));
    MyHelper.logger.i(resp.data['data']);
    List<AdvertisementTypeModel> adsTypeModel = [];
    for(var i in resp.data['data'])
    {
      adsTypeModel.add(AdvertisementTypeModel.fromJson(i));
    }

    if(resp.statusCode==200){
      MyHelper.logger.i(adsTypeModel);
    }else{
      MyHelper.logger.i(adsTypeModel);
    }
    return adsTypeModel;
    }
    catch(e)
    {
      MyHelper.logger.e(e);
    }
  }

  // get single ad by id
  getSingleAdvertisementById(String adId) async
  {
    try{
      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
    var resp = await MyHelper.dio.get('advertisement/getSingleAdvertisment/$adId', options: Options(
      headers: {
        "Authorization": "${_user!.token}",
      }
    ));
    MyHelper.logger.i(resp.data);
    return resp;
    }
    catch(e)
    {
      MyHelper.logger.e(e);
    }
  }
}