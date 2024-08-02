

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:leadkart/ApiServices/plansApi.dart';
import 'package:leadkart/Models/PlanBYTypIdModel.dart';
import 'package:leadkart/Models/ad_type_model.dart';
import 'package:leadkart/Models/plansModel.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class Allplansprovider with ChangeNotifier
{
  PlanDetail2? _selectedPlan;
  bool _initing = true;
  List<PlanDetail2> _allPlans = [];
  AdvertisementTypeModel? _advertisementTypeModel;

  bool get initing => _initing;
  PlanDetail2? get selectedPlan => _selectedPlan;
  List<PlanDetail2> get allPlans => _allPlans;

  Future<void> load(BuildContext context) async
  {

    var resp = await PlansApi().getPlansByTypeId(_advertisementTypeModel?.id??"");
    Logger().i(resp.statusCode);
    Logger().i(resp.body);
    if(resp.statusCode==200)
      {
        var decode = jsonDecode(resp.body);
        var d = PlansByAddTypeIdResponce.fromJson(decode);
        _allPlans = d.data??[];
        if(_allPlans.isEmpty)
          {
            MyHelper.mySnakebar(context, "No Plans Found");
          }
      }
    else if(resp.statusCode==404)
      {
        var decode = jsonDecode(resp.body);
        MyHelper.mySnakebar(context, "${decode["message"]}");

      }
    else
      {
        MyHelper.mySnakebar(context, "Error");
        Logger().i("${resp.statusCode}  ${resp.body}");
      }

    // _allPlans = await PlansApi().getAllAiImagePlans()??[];
    _initing =  false;

    notifyListeners();
  }

  void selectAddPlane(AdvertisementTypeModel ad){
    _advertisementTypeModel = ad;
    notifyListeners();
  }

  void removePlan(PlanDetail plan){
    _allPlans.removeWhere((e)=>e.id==plan.id);
    notifyListeners();
  }

  void selectPlan(PlanDetail2? plan)async
  {
    _selectedPlan = plan;
    notifyListeners();
  }

  void clear()
  {
    _selectedPlan=null;
    _allPlans = [];
    _initing = true;
    notifyListeners();
    Logger().i("all Plan PRovider is clear ");
  }




}