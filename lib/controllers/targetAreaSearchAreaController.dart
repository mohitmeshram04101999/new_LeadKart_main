

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

  List<TargetArea> _searchResult = [];
  bool _loading = false;
  TextEditingController _searchController = TextEditingController();


  List<TargetArea> get  searchResult =>_searchResult;
  bool get loading => _loading;
  TextEditingController get  searchController => _searchController;


  Future<void> search(BuildContext context,{
    required String data,
}) async
  {
    _loading = true;
    notifyListeners();
    var currentBus = Controllers.businessProvider(context).currentBusiness;
    String uri  =  "/searchTargetArea?businessId=${currentBus?.id}&search=$data";
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

  void clear()
  {
    _loading = false;
    _searchResult = [];
    _searchController.clear();
    notifyListeners();
  }

}