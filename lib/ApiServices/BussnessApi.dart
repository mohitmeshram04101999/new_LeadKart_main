import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:leadkart/Models/AllStateMosel.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/Models/BussnessdetailModel.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/business_model.dart';
import 'package:leadkart/Models/getAllCityModelREsponce.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class BussnissApi {
  //get add Category Api
  Future<CustomResponce> getAllCategory({
    String userId = "66446389926d794e368c8f6c",
    int page = 1,
    String? title,
    String? categoryId,
  }) async {
    // /category/getAllCategory?userId=66446389926d794e368c8f6c&title=category&categoryId=&page=1
    String uri =
        "/category/getAllCategory?userId=$userId&page=$page${title != null ? "&title=$title" : ""}${categoryId != null ? "&categoryId=$categoryId" : ""}";

    var resp = await MyHelper.dio.get(uri);

    if (resp.statusCode == 200) {
      BussnissCategoryApiModel _d =
          BussnissCategoryApiModel.fromJson(resp.data);
      return CustomResponce(
        statusCode: resp.statusCode!,
        message: _d.message.toString(),
        data: _d,
      );
    } else {
      MyHelper.logger
          .i("${'-' * 10} Responce from allCategory api ${'-' * 10}");
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
  }) async {
    try {
      String uri = "/business/getAllBussinessByUserId/$userId";

      final CurrentUser? _user =
          await Controllers.userPreferencesController.getUser();

      var resp = await MyHelper.dio.get(uri,
          options: Options(
            headers: {
              "Authorization": "${_user!.token}",
            },
          ));
      log("status code ${resp.statusCode}");
      if (resp.statusCode == 200) {
        final List<BusinessModel> businessList =
            (resp.data['data'] as List).map((e) {
          return BusinessModel.fromMap(e);
        }).toList();
        // MyHelper.logger.i(businessList);
        return CustomResponce(
          statusCode: resp.statusCode!,
          message: resp.data["message"].toString(),
          data: businessList,
        );
      } else {
        MyHelper.logger
            .e("${'-' * 10} Responce from allCategory api ${'-' * 10}");
        MyHelper.logger.e(resp.statusCode);
        MyHelper.logger.e(resp.data);
        return CustomResponce(
          statusCode: resp.statusCode!,
          errorStatus: true,
          errorMessage: resp.data.toString(),
        );
      }
    } catch (e) {
      MyHelper.logger
          .e("${'-' * 10} Responce from allCategory api ${'-' * 10}");
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
  }) async {
    try {
      // /business/getBusinessByCategory?categoryId=60b9b3b3b3b3b3b3b3b3b3&userId=66446389926d794e368c8f6c&page=1&title=&businessId=
      String uri = "/business/getByIdBussiness/$businessId";

      final CurrentUser? _user =
          await Controllers.userPreferencesController.getUser();
      var resp = await MyHelper.dio.get(uri,
          options: Options(
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
      } else {
        MyHelper.logger.e(resp.statusCode);
        MyHelper.logger.e(resp.data);
        return CustomResponce(
          statusCode: resp.statusCode!,
          errorStatus: true,
          errorMessage: resp.data.toString(),
        );
      }
    } catch (e) {
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
  }) async {
    try {
      // /business/getBusinessByCategory?categoryId=60b9b3b3b3b3b3b3b3b3b3&userId=66446389926d794e368c8f6c&page=1&title=&businessId=
      String uri = "/business/disableBusiness/$businessId";

      final CurrentUser? _user =
          await Controllers.userPreferencesController.getUser();
      var resp = await MyHelper.dio.get(uri,
          options: Options(
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
      } else {
        MyHelper.logger.i(resp.statusCode);
        MyHelper.logger.i(resp.data);
        return CustomResponce(
          statusCode: resp.statusCode!,
          errorStatus: true,
          errorMessage: resp.data.toString(),
        );
      }
    } catch (e) {
      MyHelper.logger.e(e.toString());
      return CustomResponce(
        statusCode: 500,
        errorStatus: true,
        errorMessage: e.toString(),
      );
    }
  }

  //Create BusinessApi

  // Future<CustomResponce> createBusiness({
  //   XFile? logo,
  //   String? businessCategoryId,
  //   String? businessName,
  //   List<String>? serviceId,
  //   String? businessContactNum,
  //   String? whatAppNum,
  //   String? stateId,
  //   String? cityId,
  //   String? webLink,
  //   String? instaLink,
  //   String? twitterLink,
  //   String? youTubeLink,
  //   String? faceBookLink,
  //   String? address,
  //   String? tagLine,
  //   String? countryId,
  // }) async {
  //   String uri = "/business/createBussiness";
  //
  //   CurrentUser? user = await Controllers.useraPrefrenc.getUser();
  //   var head = await Controllers.useraPrefrenc.getHeader();
  //
  //   var data = {
  //     // "businessImage":req,
  //     "businessName": businessName,
  //     "userId": user!.id.toString(),
  //     "businessCategoryId": businessCategoryId,
  //     // "servicesId": "664482f4c7cda5618d2edede",
  //     "businessContact": businessContactNum,
  //     "whatsappNumber": whatAppNum,
  //     "stateId": stateId,
  //     "cityId": cityId,
  //     "websiteLink": webLink,
  //     "instagramLink": instaLink,
  //     "twitterLink": twitterLink,
  //     "youtubeLink": youTubeLink,
  //     "facebookLink": faceBookLink,
  //     "address": address,
  //     "tagline": tagLine,
  //     // "countryId":countryId
  //   };
  //
  //   //
  //   var formatedData =
  //       data.map((key, value) => MapEntry(key, value.toString()));
  //
  //   var request =
  //       http.MultipartRequest("POST", Uri.parse(ApiConst.baseUrl + uri));
  //
  //   if (logo != null) {
  //     request.files.add(await http.MultipartFile.fromPath(
  //       "businessImage",
  //       logo.path ?? "",
  //     ));
  //   }
  //   request.headers.addAll({"Authorization": user.token.toString()});
  //
  //   request.fields.addAll(formatedData);
  //   for (int i = 0; i < serviceId!.length; i++) {
  //     request.fields["servicesId[$i]"] = serviceId[i].toString();
  //   }
  //
  //   var response = await request.send();
  //   var d = await response.stream.bytesToString();
  //   var mapdata = jsonDecode(d);
  //
  //   MyHelper.logger.i(response.statusCode);
  //   MyHelper.logger.i(d);
  //
  //   //
  //   // BusinessModel model = BusinessModel.fromMap(mapdata["data"]);
  //
  //   // geting datad end sending to return
  //
  //   MyHelper.logger.i("OK");
  //
  //   if (response.statusCode == 201) {
  //     return CustomResponce(
  //         statusCode: response.statusCode,
  //         // data: model,
  //         message: mapdata["message"]);
  //   }
  //
  //   //returnig the data is wrong
  //   else {
  //     MyHelper.logger.e(response.statusCode);
  //     var d = await response.stream.bytesToString();
  //     MyHelper.logger.i(d);
  //     return CustomResponce(
  //         statusCode: response.statusCode,
  //         data: mapdata["message"],
  //         errorMessage: d);
  //   }
  // }




  Future<CustomResponce> createBusiness({
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
  }) async {
    String uri = "/business/createBussiness";

    Logger().i("Hi ");
    CurrentUser? user = await Controllers.useraPrefrenc.getUser();
    var head = await Controllers.useraPrefrenc.getHeader();

    var data = {
      // "businessImage":req,
      "businessName": businessName,
      "userId": user!.id.toString(),
      "businessCategoryId": businessCategoryId,
      // "servicesId": "664482f4c7cda5618d2edede",
      "businessContact": businessContactNum,
      "whatsappNumber": whatAppNum,
      "stateId": stateId,
      "cityId": cityId,
      "websiteLink": webLink,
      "instagramLink": instaLink,
      "twitterLink": twitterLink,
      "youtubeLink": youTubeLink,
      "facebookLink": faceBookLink,
      "address": address,
      "tagline": tagLine,
      // "countryId":countryId
    };

    //
    var formatedData =
    data.map((key, value) => MapEntry(key, value.toString()));

    var request =
    http.MultipartRequest("POST", Uri.parse(ApiConst.baseUrl + uri));

    if (logo != null) {
      request.files.add(await http.MultipartFile.fromPath(
        "businessImage",
        logo.path ?? "",
      ));
    }
    request.headers.addAll({"Authorization": user.token.toString()});

    request.fields.addAll(formatedData);
    for (int i = 0; i < serviceId!.length; i++) {
      request.fields["servicesId[$i]"] = serviceId[i].toString();
    }

    var response = await request.send();
    var d = await response.stream.bytesToString();
    var mapdata = jsonDecode(d);

    MyHelper.logger.i(response.statusCode);
    MyHelper.logger.i(d);

    //
    // BusinessModel model = BusinessModel.fromMap(mapdata["data"]);

    // geting datad end sending to return

    MyHelper.logger.i("OK");

    if (response.statusCode == 201) {
      return CustomResponce(
          statusCode: response.statusCode,
          // data: model,
          message: mapdata["message"]);
    }

    //returnig the data is wrong
    else {
      MyHelper.logger.e(response.statusCode);
      var d = await response.stream.bytesToString();
      MyHelper.logger.i(d);
      return CustomResponce(
          statusCode: response.statusCode,
          data: mapdata["message"],
          errorMessage: d);
    }
  }


  Future<CustomResponce> upDateBusiness({
    required String businessId,
    XFile? logo,
    String? businessCategoryId,
    String? businessName,
    List<dynamic>? serviceId,
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
    bool? isFacebookPageLinked = false,
    String? metaAccessToken,
  }) async {
    String uri = "business/updateBussiness/$businessId";

    MyHelper.logger.i(businessId);

    CurrentUser? user = await Controllers.useraPrefrenc.getUser();

    var data = {
      // "businessImage":req,
      "businessName": businessName,
      "userId": user!.id.toString(),
      "businessCategoryId": businessCategoryId,
      // "servicesId": "664482f4c7cda5618d2edede",
      "businessContact": businessContactNum,
      "whatsappNumber": whatAppNum,
      "stateId": stateId,
      "cityId": cityId,
      "websiteLink": webLink,
      "instagramLink": instaLink,
      "twitterLink": twitterLink,
      "youtubeLink": youTubeLink,
      "facebookLink": faceBookLink,
      "address": address,
      "tagline": tagLine,
      "isFacebookPageLinked": isFacebookPageLinked,
      // "disable":false,
      "metaAccessToken": metaAccessToken,
      // "isFacebookPageLinked":'true'
      // "countryId":countryId
    };

    //
    Map<String, String> formatedData = {};

    data.forEach((key, value) {
      if (value != null && value != "null") {
        formatedData[key] = value.toString();
      }
    });

    var request =
        http.MultipartRequest("PUT", Uri.parse(ApiConst.baseUrl + uri));

    if (logo != null) {
      request.files.add(await http.MultipartFile.fromPath(
        "businessImage",
        logo.path ?? "",
      ));
    }
    request.headers.addAll({"Authorization": user.token.toString()});

    request.fields.addAll(formatedData);
    for (int i = 0; i < serviceId!.length; i++) {
      request.fields["servicesId[$i]"] = serviceId[i].toString();
    }

    MyHelper.logger.i(logo?.path ?? "");
    MyHelper.logger.i(ApiConst.baseUrl + uri);
    MyHelper.logger.i(data);

    var response = await request.send();
    var d = await response.stream.bytesToString();
    var mapdata = jsonDecode(d);

    MyHelper.logger.i(response.statusCode);
    MyHelper.logger.i(d);
    MyHelper.logger.i(mapdata);
    //
    BusinessModel model = BusinessModel.fromMap(mapdata["data"]);

    // geting datad end sending to return

    if (response.statusCode == 200) {
      return CustomResponce(
          statusCode: response.statusCode,
          data: model,
          message: mapdata["message"]
          // message: "update Suces,mjcdcj,a"
          );
    }

    //returnig the data is wrong
    else {
      MyHelper.logger.e(response.statusCode);
      // var d = await response.stream.bytesToString();
      MyHelper.logger.e(d);
      return CustomResponce(
          statusCode: response.statusCode,
          data: mapdata["message"],
          // data: "bnbnbhj",
          errorMessage: d);
    }
  }

//Get Coty
  Future<GetAllCityResponceModel?> getAllCity({
    required userId,
    int page = 1,
    String stateId = "664493e6bda98d4d03a5faec",
  }) async {
    String uri = "/city/getAllCity?userId=${userId}";
    var head = await Controllers.useraPrefrenc.getHeader();
    var resp = await MyHelper.dio.get(uri, options: Options(headers: head));

    if (resp.statusCode == 200) {
      GetAllCityResponceModel _mod =
          GetAllCityResponceModel.fromJson(resp.data);
      MyHelper.logger.i("Get ALl City");
      return _mod;
    } else {
      MyHelper.logger.e(resp.data);
    }
  }

  Future<GetAllStateResponceModel?> getAllState({
    int page = 1,
    String countryId = "66448f447decec06b739c215",
  }) async {
    String uri = "/state/getAllState?countryId=${countryId}";
    var head = await Controllers.useraPrefrenc.getHeader();
    var resp = await MyHelper.dio.get(uri, options: Options(headers: head));

    if (resp.statusCode == 200) {
      GetAllStateResponceModel _mod =
          GetAllStateResponceModel.fromJson(resp.data);
      MyHelper.logger.i("Get ALl City");
      return _mod;
    } else {
      MyHelper.logger.e(resp.data);
    }
  }

  Future<BusinessDetailModel?> getFullDetailOfBusiness(
      String businessId) async {
    var logg = Logger();
    var user = await UserPreference().getUser();

    Logger().i(businessId);

    String uri = "/business/getByIdBussiness/$businessId?userId=${user?.id}";

    var header = await UserPreference().getHeader();

    var resp = await MyHelper.dio.get(uri, options: Options(headers: header));

    if (resp.statusCode == 200) {
      var model = BusinessDetailModel.fromJson(resp.data);
      return model;
    } else {
      logg.e("response From Detail Business Api");
      logg.e(resp.statusCode);
      logg.e(resp.data);
    }
  }
}
