


import 'package:flutter/cupertino.dart';
import 'package:leadkart/ApiServices/leads%20api.dart';
import 'package:leadkart/Models/LeadsApiresponce.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';

class LeadsProvider with ChangeNotifier{


  //const var

  final _leadsApi =  LeadsApi();

  bool _isLoad = false;
  List<Lead> _allLeads = [];
  String _filterType = "ALL";
  bool _filterOn = false;

  List<Lead> get allLeads => _allLeads;
  bool get isLoad => _isLoad;
  String get filterType =>_filterType;
  bool get filterIsOn => _filterOn;





  //get Leads by BusinessId;
  Future<void> getLeads(BuildContext context) async
  {
    var currutBusiness = Controllers.businessProvider(context).currentBusiness;
    var resp = await _leadsApi.getAllLeads(stage: _filterType=="ALL"?null:_filterType);

    if(resp.statusCode==200)
      {
        try
            {
              var d = LeadsApiResponce.fromJson(resp.data);
              _allLeads = d.data??[];
            }
            catch(e)
    {
      MyHelper.mySnakebar(context, "$e");
    }

      }
    else
      {
        MyHelper.mySnakebar(context, "${resp.statusCode} ${resp.data}");
      }
    _filterOn = false;
    _isLoad = true;
    notifyListeners();

  }

  Future<void> filter(BuildContext context,String type)async
  {
    _filterType = type;
    _filterOn = true;
    notifyListeners();
    getLeads(context);

  }


  clear()
  {
    _isLoad = true;
    _allLeads = [];
    _filterType ="All";
    _filterOn = false;
    notifyListeners();
  }





}