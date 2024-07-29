

import 'package:dio/dio.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class LeadsApi
{
  final _log = Logger();
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

}