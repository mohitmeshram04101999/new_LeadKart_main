

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:leadkart/Models/AllStateMosel.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/getAllCityModelREsponce.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

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

  void update()
  {
    notifyListeners();
  }

  Future<void> lode(BuildContext context)async{

    CurrentUser? user = await Controllers.useraPrefrenc.getUser();

    _loding = true;
    notifyListeners();
    var resp =  await MyHelper.bussnissApi.getAllCategory(userId: user!.id!,);
    var cityResp = await  MyHelper.bussnissApi.getAllCity(userId: user.id);
    var stateResp = await  MyHelper.bussnissApi.getAllState();

    Logger().i('${resp.statusCode}\n${resp.body}');

    if(resp.statusCode==200)
      {
        var _data = BussnissCategoryApiModel.fromJson(jsonDecode(resp.body));
        _allCategiry = _data.data??[];
      }

    _allCity =cityResp?.data??[];

    _allState=stateResp?.data??[];


    _loding  = false;
    notifyListeners();
}

Future<void> lodeService(String categoryId,BuildContext context) async
{

  _lodingSevics = true;
  notifyListeners();

  CurrentUser? user = await Controllers.useraPrefrenc.getUser();
  var _d = await MyHelper.bussnissApi.getAllCategory(userId:user!.id!,categoryId: categoryId);

  if(_d.statusCode==200)
    {
      var data_decode = BussnissCategoryApiModel.fromJson(jsonDecode(_d.body));
       _allService = data_decode.data??[];
      _lodingSevics = false;
       notifyListeners();
       return ;
    }
  else if(_d.statusCode==401)
    {
      _allCategiry = [];
      MyHelper.mySnakebar(context, "same Dude");
    }
  else if(_d.statusCode==500)
    {
      _allCategiry = [];
      MyHelper.mySnakebar(context, "Server Error");
    }
  else
    {
      _allCategiry = [];
      MyHelper.mySnakebar(context, "same Dude");
    }

  _lodingSevics = false;
  notifyListeners();
}



}