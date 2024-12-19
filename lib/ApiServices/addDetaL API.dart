

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:leadkart/Models/addRepot%20Model.dart';
import 'package:leadkart/Models/getCampaindetailModel.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class AddDetailApi
{
  static final _log =  Logger();

  ///1 get Campaign Detail
  static Future<GetCampaignDetailModel?> getAddCampaignData({
    // String  campaignId = "6694c0012d938ab030433868"
    required String  campaignId
}) async
  {

    String uri = "${ApiConst.baseUrl}/getInternalCampiagnDataById/?internalCampaignId=$campaignId";


    var head = await UserPreference().getHeaderForDio();
    Map<String,String> filterHeader = {};

    head!.forEach((key, value){
      filterHeader[key]= value.toString();
    });
    var resp = await http.get(Uri.parse(uri),headers: filterHeader);

    _log.e(resp);



    if(resp.statusCode ==200)
      {
        var decode = jsonDecode(resp.body);
        GetCampaignDetailModel model = GetCampaignDetailModel.fromJson(decode);
        return model;
      }
    else
      {
        _log.i("Resp From Campaign Report APi \n${resp.statusCode} \n${resp.body}");
      }
    return null;

  }

  static Future<dynamic> getaddReport(String adId) async
  {
   String uri = "/getAdReport?metaAdsetId=$adId";
   var head = await UserPreference().getHeaderForDio();
   var resp = await MyHelper.dio.get(uri,options: Options(headers: head));

   if(resp.statusCode==200)
     {


       return resp.data["fullReport"];
     }
   else
     {
       _log.i("Resp From add Report APi \n${resp.statusCode} \n${resp.data}");
     }
  }


  //

}