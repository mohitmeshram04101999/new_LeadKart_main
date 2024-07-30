

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
  })async
  {
    String uri = "/getLeadOfYourBussiness?businessId=$businessId";
    var toc= await UserPreference().getUser();

    var head =  {"Authorization":toc?.token??""};
    var resp = await MyHelper.dio.get(uri,options: Options(headers: head));
    return resp;
  }


  //
  //get leadeDetaile
Future<Response> getLeadeDetail(String leadId)async
{
  String uri = "/getLeadDetails?leadId=$leadId";

  var head = await UserPreference().getHeaderForDio();
  var resp = await MyHelper.dio.get(uri,options: Options(headers: head));
  return resp;
}

Future<Response> updateLeads(
    String leadId,
    String changeType,
    )async
{
  String uri = "/updateLeadDetails?leadId=$leadId";
  var head = await UserPreference().getHeaderForDio();
  var data = {
    "leadStatus":changeType,
  };
  var resp = await MyHelper.dio.put(uri,data: data,options: Options(headers: head));
  return resp;
}

}