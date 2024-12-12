

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leadkart/ApiServices/adsApi.dart';
import 'package:leadkart/Models/locationAreaResponceModel.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class LocationSelecterProvider with ChangeNotifier
{
  final adsApi = AdsApi();
  TextEditingController _textEditingController = TextEditingController() ;
  List<Area> _areas = [];


  List<Area>  get areas =>_areas;
  TextEditingController get textEditingController =>_textEditingController;



  load(BuildContext context,{
    String location = "Bhopal"
}) async
  {

    print("YO Yo");

    var responce = await adsApi.getLocationData(location);


    switch(responce.statusCode)
    {
      case(200):
        var decodeXData = jsonDecode(responce.body);
        var data = LocationAreaResponseModel.fromJson(decodeXData);
        _areas = data.data??[];
        Logger().t('${_areas.length}');
        break;

      case(400):
        MyHelper.mySnakebar(context, "Bad Request");
        break;

      case(500):
        MyHelper.mySnakebar(context, "Server Not Responsing");
        break;

      case(404):
        MyHelper.mySnakebar(context, "Not Found");
        break;



      default :
        print("Some Thing Went wrong ${responce.statusCode}");
        break;

    }

  try{


  }
  catch(e)
    {
      print("asdf asd");
      throw(e);


    }


  }

  clear()
  {
    _areas =[];
    _textEditingController.text;

  }
}