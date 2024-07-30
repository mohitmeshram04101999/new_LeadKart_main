

import 'package:flutter/cupertino.dart';
import 'package:leadkart/ApiServices/plansApi.dart';
import 'package:leadkart/Models/plansModel.dart';
import 'package:logger/logger.dart';

class Allplansprovider with ChangeNotifier
{
  PlanDetail? _selectedPlan;
  bool _initing = true;
  List<PlanDetail> _allPlans = [];

  bool get initing => _initing;
  PlanDetail? get selectedPlan => _selectedPlan;
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

  void selectPlan(PlanDetail? plan)async
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