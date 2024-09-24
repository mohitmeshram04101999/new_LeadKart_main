import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:leadkart/Models/getPagesModel.dart';

abstract class MetaApis {
  static Future<FacebookPageData> getPages(String accessToken) async {
    try {
      final dio = Dio(BaseOptions(
        baseUrl: "https://graph.facebook.com/v20.0",
      ));
      final response = await dio.get(
        "/me/accounts",
        queryParameters: {
          "access_token":
              accessToken, // This is the access token that we got from the user
        },
      );
      log("Raw response data: ${response.data}");
      final data = jsonDecode(response.data);
      final value = FacebookPageData.fromMap(data);
      log("Parsed FacebookPageData: $value");
      // log("First page category list: ${value.data[0].categoryList}");

      return value;
    } catch (e, stackTrace) {
      log("Error in getPages: $e");
      log("Stack trace: $stackTrace");
      rethrow; // This will allow the error to propagate to the FutureBuilder
    }
  }
}
