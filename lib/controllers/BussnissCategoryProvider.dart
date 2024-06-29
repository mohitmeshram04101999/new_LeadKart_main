

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/Models/AllStateMosel.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/getAllCityModelREsponce.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';

class BussnissCategoryProvider with ChangeNotifier
{



  //Vars
  List<BCategory> _allCategiry =[];
  List<BCategory> _allService =[];
  List<City> _allCity = [];
  List<StateCity> _allState = [];
  bool _loding = true;
  bool _lodingSevics = false;


  List<BCategory> get allCategory => _allCategiry;
  List<BCategory> get allSrvices => _allService;
  List<City> get allCity =>_allCity;
  List<StateCity> get allState => _allState;
  bool get loding => _loding;
  bool get lodingSevics => _lodingSevics;

  void upDate()=>notifyListeners();

  void clean()
  {
    _allCategiry =[];
    _allService =[];
    _allCity = [];
    _allState = [];
  }

  Future<void> lode(BuildContext context)async{

    CurrentUser? user = await Controllers.useraPrefrenc.getUser();

    _loding = true;
    notifyListeners();
    CustomResponce responce =  await MyHelper.bussnissApi.getAllCategory(userId: user!.id!,);
    var cityResp = await  MyHelper.bussnissApi.getAllCity(userId: user.id);
    var stateResp = await  MyHelper.bussnissApi.getAllState();

    if(responce.data!=null)
      {
        BussnissCategoryApiModel _d = responce.data;
        _allCategiry = _d.data??[];
      }
    else
      {
        MyHelper.mySnakebar(context, "${responce.errorMessage}");
      }

    if(cityResp!=null)
      {
        _allCity = cityResp.data??[];
      }
    if(stateResp !=null)
      {
        _allState = stateResp.data??[];
      }

    _loding  = false;
    notifyListeners();
}

Future<void> lodeService(BCategory category,BuildContext context) async
{

  _lodingSevics = true;
  notifyListeners();

  CurrentUser? user = await Controllers.useraPrefrenc.getUser();
  CustomResponce _d = await MyHelper.bussnissApi.getAllCategory(userId:user!.id!,categoryId: category.id);
  if(_d.data!=null)
    {
      BussnissCategoryApiModel _model = _d.data!;
      _allService = _model.data??[];
    }
  else if(_d.statusCode==404)
    {
      MyHelper.mySnakebar(context, "No Data Found");
    }
  else
    {
      MyHelper.mySnakebar(context, "(${_d.statusCode}) ${_d.errorMessage}");
    }
  _lodingSevics = false;
  notifyListeners();
}



}