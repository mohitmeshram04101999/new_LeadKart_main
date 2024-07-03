

import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:leadkart/Models/AllStateMosel.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/getAllCityModelREsponce.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/business_model.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class BussnissApi
{

  //get add Category Api
  Future<CustomResponce> getAllCategory({
    String userId = "66446389926d794e368c8f6c",
    int page = 1,
    String? title,
    String? categoryId,

}) async
  {
    // /category/getAllCategory?userId=66446389926d794e368c8f6c&title=category&categoryId=&page=1
    String uri = "/category/getAllCategory?userId=$userId&page=$page${title!=null?"&title=$title":""}${categoryId!=null?"&categoryId=$categoryId":""}";

    var resp = await MyHelper.dio.get(uri);

    if(resp.statusCode==200)
      {
        BussnissCategoryApiModel _d = BussnissCategoryApiModel.fromJson(resp.data);
        return CustomResponce(
          statusCode: resp.statusCode!,
          message: _d.message.toString(),
          data:_d,
        );
      }
    else
      {
        MyHelper.logger.i("${'-'*10} Responce from allCategory api ${'-'*10}");
        MyHelper.logger.i(resp.statusCode);
        MyHelper.logger.i(resp.data);
      }
        return CustomResponce(
          statusCode: resp.statusCode!,
          errorStatus: true,
          errorMessage: resp.data.toString(),
        );
      }


  //get business by user id
  Future<CustomResponce> getBusinessByUserId({
    required String userId,
  }) async
  {
    try {
      // /business/getBusinessByCategory?categoryId=60b9b3b3b3b3b3b3b3b3b3b3&userId=66446389926d794e368c8f6c&page=1&title=&businessId=
      String uri = "/business/getAllBussinessByUserId/$userId";

      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
      var resp = await MyHelper.dio.get(uri, options: Options(
        headers: {
          "Authorization": "${_user!.token}",
        },
      ));

      if (resp.statusCode == 200) {
        final List<BusinessModel> businessList = (resp.data['data'] as List)
            .map((e) {
          return BusinessModel.fromMap(e);
        }).toList();
        // MyHelper.logger.i(businessList);
        return CustomResponce(
          statusCode: resp.statusCode!,
          message: resp.data["message"].toString(),
          data: businessList,
        );
      }else{
        MyHelper.logger.e("${'-' * 10} Responce from allCategory api ${'-' * 10}");
        MyHelper.logger.e(resp.statusCode);
        MyHelper.logger.e(resp.data);
        return CustomResponce(
          statusCode: resp.statusCode!,
          errorStatus: true,
          errorMessage: resp.data.toString(),
        );
      }
    }
    catch(e)
    {
      MyHelper.logger.e("${'-'*10} Responce from allCategory api ${'-'*10}");
      MyHelper.logger.e(e.toString());
      return CustomResponce(
        statusCode: 500,
        errorStatus: true,
        errorMessage: e.toString(),
      );
    }

  }

  // get single business by id

  Future<CustomResponce> getSingleBusinessById({
    required String businessId,
  }) async
  {
    try {
      // /business/getBusinessByCategory?categoryId=60b9b3b3b3b3b3b3b3b3b3&userId=66446389926d794e368c8f6c&page=1&title=&businessId=
      String uri = "/business/getByIdBussiness/$businessId";

      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
      var resp = await MyHelper.dio.get(uri, options: Options(
        headers: {
          "Authorization": "${_user!.token}",
        },
      ));

      if (resp.statusCode == 200) {
        final BusinessModel business = BusinessModel.fromMap(resp.data['data']);
        MyHelper.logger.i(business);
        return CustomResponce(
          statusCode: resp.statusCode!,
          message: resp.data["message"].toString(),
          data: business,
        );
      }else{
        MyHelper.logger.e(resp.statusCode);
        MyHelper.logger.e(resp.data);
        return CustomResponce(
          statusCode: resp.statusCode!,
          errorStatus: true,
          errorMessage: resp.data.toString(),
        );
      }
    }
    catch(e)
    {
      MyHelper.logger.e(e.toString());
      return CustomResponce(
        statusCode: 500,
        errorStatus: true,
        errorMessage: e.toString(),
      );
    }

  }

  // disable business by category id

  Future<CustomResponce> disableBusinessById({
    required String businessId,
  }) async
  {
    try {
      // /business/getBusinessByCategory?categoryId=60b9b3b3b3b3b3b3b3b3b3&userId=66446389926d794e368c8f6c&page=1&title=&businessId=
      String uri = "/business/disableBusiness/$businessId";

      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
      var resp = await MyHelper.dio.get(uri, options: Options(
        headers: {
          "Authorization": "${_user!.token}",
        },
      ));

      if (resp.statusCode == 200) {
        final BusinessModel business = BusinessModel.fromMap(resp.data['data']);
        MyHelper.logger.i(business);
        return CustomResponce(
          statusCode: resp.statusCode!,
          message: resp.data["message"].toString(),
          data: business,
        );
      }else{
        MyHelper.logger.i(resp.statusCode);
        MyHelper.logger.i(resp.data);
        return CustomResponce(
          statusCode: resp.statusCode!,
          errorStatus: true,
          errorMessage: resp.data.toString(),
        );
      }
    }
    catch(e)
    {
      MyHelper.logger.e(e.toString());
      return CustomResponce(
        statusCode: 500,
        errorStatus: true,
        errorMessage: e.toString(),
      );
    }

  }





      //Create BusinessApi

  Future<void>createBusiness({
     XFile? logo,
     String? businessCategoryId,
     String? businessName,
     List<String>? serviceId,
      String? businessContactNum,
      String? whatAppNum,
    String? stateId,
    String? cityId,
    String? webLink,
    String? instaLink,
    String? twitterLink,
    String? youTubeLink,
    String? faceBookLink,
    String? address,
  String? tagLine,
  String? countryId,
}) async
{

  String uri = "/business/createBussiness";

  CurrentUser? user = await Controllers.useraPrefrenc.getUser();
// log(user!.id.toString());
  final file = File(logo!.path);
  var data = {
    // "businessImage":req,
    "businessName":businessName,
    "userId":user!.id.toString(),
    "businessCategoryId":businessCategoryId,
    "servicesId": "664482f4c7cda5618d2edede",
    "businessContact":businessContactNum,
    "whatsappNumber":whatAppNum,
    "stateId": stateId,
    "cityId":cityId,
    "websiteLink":webLink,
    "instagramLink":instaLink,
    "twitterLink":twitterLink,
    "youtubeLink":youTubeLink,
    "facebookLink":faceBookLink,
    "address":address,
    "tagline":tagLine,
    // "countryId":countryId
  };
  var formatedData = data.map((key,value)=>MapEntry(key, value.toString()));
  FormData Fdata = FormData.fromMap(data);



  var request = http.MultipartRequest("POST",Uri.parse(ApiConst.baseUrl+uri));

  request.files.add(await http.MultipartFile.fromPath("businessImage", logo.path, ));
  request.headers.addAll({"Authorization":user.token.toString()});

  request.fields.addAll(formatedData);







  var response = await request.send();
  if (response.statusCode == 200) {
    MyHelper.logger.w(json.encode(response.stream.bytesToString()));
  }
  else {
    MyHelper.logger.e(response.statusCode);
  }

  if(response.statusCode==201)
    {

      MyHelper.logger.i(response.statusCode);
    }
  else
    {
      MyHelper.logger.e(response.statusCode);
      MyHelper.logger.e(logo.path);
      MyHelper.logger.e(await response.stream.bytesToString());
    }




}


//Get Coty
 Future<GetAllCityResponceModel?> getAllCity({
    required userId,
   int page = 1,
   String stateId  = "664493e6bda98d4d03a5faec",

})async
 {
   String uri = "/city/getAllCity?userId=${userId}";
   var head  =await Controllers.useraPrefrenc.getHeader();
   var resp = await MyHelper.dio.get(uri,options: Options(headers: head));

   if(resp.statusCode==200)
     {
       GetAllCityResponceModel _mod = GetAllCityResponceModel.fromJson(resp.data);
       MyHelper.logger.i("Get ALl City");
       return _mod;

     }
   else
     {
       MyHelper.logger.e(resp.data);
     }

   
 }


  Future<GetAllStateResponceModel?> getAllState({
    int page = 1,
    String countryId  = "66448f447decec06b739c215",
  })async
  {
    String uri = "/state/getAllState?countryId=${countryId}";
    var head  =await Controllers.useraPrefrenc.getHeader();
    var resp = await MyHelper.dio.get(uri,options: Options(headers: head));

    if(resp.statusCode==200)
    {
      GetAllStateResponceModel _mod = GetAllStateResponceModel.fromJson(resp.data);
      MyHelper.logger.i("Get ALl City");
      return _mod;

    }
    else
    {
      MyHelper.logger.e(resp.data);
    }


  }


}
