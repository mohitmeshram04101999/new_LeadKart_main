

import 'package:flutter/cupertino.dart';
import 'package:leadkart/ApiServices/plansApi.dart';
import 'package:leadkart/Models/plansModel.dart';

class Allplansprovider with ChangeNotifier
{

  bool _initing = true;
  List<PlanDetail> _allPlans = [];

  bool get initing => _initing;
  List<PlanDetail> get allPlans => _allPlans;

  Future<void> load() async
  {
    _allPlans = await PlansApi().getAllAiImagePlans()??[];
    _initing =  false;
    notifyListeners();
  }

  void removePlan(PlanDetail plan){
    _allPlans.removeWhere((e)=>e.id==plan.id);
    notifyListeners();
  }




}