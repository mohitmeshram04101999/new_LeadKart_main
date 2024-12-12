import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:logger/logger.dart';

class LeadsApi {
  final _log = Logger();

  //
  //get Lead for bussinessID

  Future<Response> getAllLeads(
      {String businessId = "671cc3bef39c726dd9ff519b",
      String userId = "6670116523cab593bbffda08",
      String? stage}) async {
    String uri =
        "/getLeadOfYourBussinessByMemberId?businessId=$businessId&userId=$userId${(stage != null) ? "&stage=$stage" : ""}";
    var toc = await UserPreference().getUser();

    var head = {"Authorization": toc?.token ?? ""};
    var resp = await MyHelper.dio.get(uri, options: Options(headers: head));
    // log(resp.data.toString());
    return resp;
  }

  Future<dynamic> assignLeads(
      {required List<String> leadIds,
      String userId = "6670116523cab593bbffda08",
      required String transferId}) async {
    var toc = await UserPreference().getUser();

    String uri = "/createLeadHistoryWithTransferAndRevolked?userId=${toc!.id}";

    var head = {"Authorization": toc?.token ?? ""};
    var resp = await MyHelper.dio.post(uri,
        options: Options(headers: head),
        data: {
          "leadId": leadIds,
          "transferId": transferId,
          "assignLead": true
        });
    // log(resp.data.toString());
    return resp;
  }

  Future<Response> listOfLeadAssignUser({required String leadId}) async {

    final userId = await UserPreference().getUser();

    Logger().w("${ApiConst.baseUrl}/listOfLeadAssignUser?userId=${userId!.id}&leadId=$leadId");
    String uri = "/listOfLeadAssignUser?userId=${userId!.id}&leadId=$leadId";
    var toc = await UserPreference().getUser();
    Logger().w("${toc?.token}");


    var head = {"Authorization": toc?.token ?? ""};
    var resp = await MyHelper.dio.get(uri, options: Options(headers: head));
    // log(resp.data.toString());
    return resp;
  }

  //
  //get leadeDetaile
  Future<Response> getLeadeDetail(
    String leadId,
  ) async {
    String uri = "/getLeadDetails?leadId=$leadId";

    var head = await UserPreference().getHeaderForDio();
    var resp = await MyHelper.dio.get(uri, options: Options(headers: head));
    return resp;
  }

  Future<Response> updateLeads(String leadId,
      {String? changeType,
      String? note,
      String? followUpDate,
      String? email,
      String? whatsappNumber,
      String? name,
      String? userContactNumber}) async {
    String uri = "/updateLeadDetails?leadId=$leadId";
    var head = await UserPreference().getHeaderForDio();
    var data = {
      "leadStatus": changeType,
      "note": note,
      "followUpDate": followUpDate,
      "email": email,
      "whatsappNumber": whatsappNumber,
      // "adsetId":"",
      // "adId":"",
      "name": name,
      "userContactNumber": userContactNumber,
    };

    var officialData = {};
    _log.i(data);

    for (MapEntry e in data.entries) {
      if (e.value != null) {
        officialData[e.key] = e.value;
      }
    }

    var resp = await MyHelper.dio
        .put(uri, data: officialData, options: Options(headers: head));
    return resp;
  }

//get Lead History
  Future<Response> getLeadHistory(String leadId, String? specificUser) async {
    log('leadId $leadId');
    log('specificUser $specificUser');
    var user = await UserPreference().getUser();
    var head = await UserPreference().getHeaderForDio();
    String uri =
        "/getAllLeadHistoryByLeadId?userId=${user?.id}&leadId=$leadId${specificUser != '' ? "&specificUserId=$specificUser" : ""}";
    log(uri);
    var resp = await MyHelper.dio.get(uri, options: Options(headers: head));
    return resp;
  }
}
