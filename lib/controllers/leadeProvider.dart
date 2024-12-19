import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leadkart/ApiServices/leads%20api.dart';
import 'package:leadkart/Models/LeadsApiresponce.dart';
import 'package:leadkart/Models/lead_assign_history_model.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class LeadsProvider with ChangeNotifier {
  //const var

  final _leadsApi = LeadsApi();

  bool _isLoad = false;
  List<Lead> _allLeads = [];
  String _filterType = "ALL";
  bool _filterOn = false;

  List<Lead> get allLeads => _allLeads;

  bool get isLoad => _isLoad;
  String get filterType => _filterType;
  bool get filterIsOn => _filterOn;

  //get Leads by BusinessId;
  Future<void> getLeads(BuildContext context) async {
    var currutBusiness = Controllers.businessProvider(context).currentBusiness;

    var resp = await _leadsApi.getAllLeads(
        stage: _filterType == "ALL" ? null : _filterType);
    Logger().i("${resp.statusCode}\n${resp.data}");

    if (resp.statusCode == 200) {
      try {
        // log(resp.data.toString());
        var d = LeadsApiResponce.fromJson(resp.data);
        _allLeads = d.data ?? [];

        // for (var item in _allLeads) {
        //   log(item.assignUser.toString());
        // }
      } catch (e) {
        log("$e");
        MyHelper.mySnakebar(context, "$e");
      }
    } else if (resp.statusCode == 400) {
      MyHelper.mySnakebar(context, "Clint Error");
    } else {
      MyHelper.mySnakebar(context, "${resp.statusCode} ${resp.data}");
    }
    _filterOn = false;
    _isLoad = true;
    notifyListeners();
  }





  Future<void> filter(BuildContext context, String type) async {
    _filterType = type;
    _filterOn = true;
    notifyListeners();
    getLeads(context);
  }

  clear() {
    _isLoad = true;
    _allLeads = [];
    _filterType = "All";
    _filterOn = false;
    notifyListeners();
  }
}
