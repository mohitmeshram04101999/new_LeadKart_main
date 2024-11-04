

import 'package:dio/dio.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class LeadsApi
{
  final _log = Logger();

  //
  //get Lead for bussinessID
  Future<Response> getAllLeads({
    String businessId = "664483cb34434c7cec80d6ed",
    String userId = "66446389926d794e368c8f6c",
    String? stage
  })async
  {
    String uri = "/getLeadOfYourBussiness?userId=$userId${(stage!=null)?"&stage=$stage":""}";
    var toc= await UserPreference().getUser();

    var head =  {"Authorization":toc?.token??""};
    var resp = await MyHelper.dio.get(uri,options: Options(headers: head));
    return resp;
  }


  //
  //get leadeDetaile
Future<Response> getLeadeDetail(
    String leadId,
    )async
{
  String uri = "/getLeadDetails?leadId=$leadId";

  var head = await UserPreference().getHeaderForDio();
  var resp = await MyHelper.dio.get(uri,options: Options(headers: head));
  return resp;
}

Future<Response> updateLeads(
    String leadId,
  {
    String? changeType,
    String? note,
    String? followUpDate,
    String? email,
    String?whatsappNumber,
    String? name,
    String? userContactNumber
  }
    )async
{
  String uri = "/updateLeadDetails?leadId=$leadId";
  var head = await UserPreference().getHeaderForDio();
  var data = {
    "leadStatus":changeType,
    "note":note,
    "followUpDate":followUpDate,
    "email":email,
    "whatsappNumber":whatsappNumber,
    // "adsetId":"",
    // "adId":"",
    "name":name,
    "userContactNumber":userContactNumber,
  };

  var officialData = {};
  _log.i(data);

  for(MapEntry e in data.entries)
    {
      if(e.value!=null)
        {
          officialData[e.key] = e.value;
        }
    }


  var resp = await MyHelper.dio.put(uri,data: officialData,options: Options(headers: head));
  return resp;
}

//get Lead History
Future<Response> getLeadHistory(String leadId) async
{
  var user = await UserPreference().getUser();
  var head = await UserPreference().getHeaderForDio();
  String uri = "/getAllLeadHistoryByLeadId?userId=${user?.id}&leadId=$leadId";
  var resp = await MyHelper.dio.get(uri,options: Options(headers: head));
  return resp;
}

}