

import 'package:dio/dio.dart';
import 'package:leadkart/Models/addRepot%20Model.dart';
import 'package:leadkart/Models/getCampaindetailModel.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class AddDetailApi
{
  static final _log =  Logger();

  ///1 get Campaign Detail
  static Future<GetCampaignDetailModel?> getAddCampaignData() async
  {

    String uri = "/getInternalCampiagnDataById/?internalCampaignId=6694c0012d938ab030433868";
    var head = await UserPreference().getHeaderForDio();
    var resp = await MyHelper.dio.get(uri,options: Options(headers: head));


    if(resp.statusCode ==200)
      {
        GetCampaignDetailModel model = GetCampaignDetailModel.fromJson(resp.data);
        return model;
      }
    else
      {
        _log.i("Resp From Campaign Report APi \n${resp.statusCode} \n${resp.data}");
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