
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/ApiServices/leads%20api.dart';
import 'package:leadkart/ApiServices/userAPii.dart';
import 'package:leadkart/Models/LeadsApiresponce.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class LeadDetailProvider with ChangeNotifier
{

  final _leadApi = LeadsApi();
  final _log = Logger();


  //Variables
  Lead? _lead;
  bool _loading = true;

  Lead? get lead =>_lead;
  bool get loading =>_loading;

  Future<void> loadLeadDetail({
    required BuildContext context,
    required String leadId
}) async
  {
    var resp = await _leadApi.getLeadeDetail(leadId);
    if(resp.statusCode==200)
      {
        var _d = Lead.fromJson(resp.data["data"]);
        _lead = _d;
      }
    else
      {
        _log.e("responce from leadeDetail api \n${resp.statusCode}\n${resp.data}");
        MyHelper.mySnakebar(context, "${resp.statusCode}\n${resp.data}",color:Colors.red);
      }

    _loading = false;
    notifyListeners();

  }


  Future<void> updateLeadStatus(BuildContext context,String type) async
  {
    var resp = await _leadApi.updateLeads(_lead?.id??"", type);
    _log.i(resp.data);
    loadLeadDetail(context: context, leadId: _lead?.id??"");
  }



  //
  //Clear provider

clear()
{
  _lead = null;
  _loading = true;
  _log.i("Lead detailProvider is clear");

}

}