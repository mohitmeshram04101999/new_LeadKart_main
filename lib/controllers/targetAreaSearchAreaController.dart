

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:leadkart/Models/targetAreaResponceModel.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:logger/logger.dart';

class TargateAreaProvider with ChangeNotifier
{

  List _searchResult = [];
  bool _loading = false;


  List get  searchResult =>_searchResult;
  bool get loading => _loading;

  Future<void> search(BuildContext context,{
    required String data,
}) async
  {
    _loading = true;
    notifyListeners();
    var currentBus = Controllers.businessProvider(context).currentBusiness;
    String uri  =  "/searchTargetArea?businessId=664483cb34434c7cec80d6ed&search=$data";
    Logger().e(uri);
    var head = await UserPreference().getHeaderForDio();
    var resp = await MyHelper.dio.get(uri,options: Options(headers: head));
    Logger().i(resp.data);
    if(resp.statusCode==200)
      {
        var d = TaragetAreaApiResponce.fromJson(resp.data);
        _searchResult = d.data??[];
      }
    else
      {
        Logger().i("${resp.statusCode}\n${resp.data}");
      }

    _loading = false;
    notifyListeners();

    
  }

}