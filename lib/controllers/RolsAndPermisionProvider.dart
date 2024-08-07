


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

class RolesAndPermProvider with ChangeNotifier
{

  final _log = Logger();


  List _rolesAndPer = [];
  bool _loading = false;

  List  get rolesAndPer => _rolesAndPer;
  bool get loading => _loading;


  Future<void> getAllPerm(BuildContext context)async
  {
    var user = await UserPreference().getUser();
    var head = await UserPreference().getHeaderForDio();
    String uri = "/permissionListApi?userId=${user?.id??""}";

    var resp = await MyHelper.dio.get(uri,options: Options(headers: head));

    if(resp.statusCode==200)
      {
        _log.e(resp.data["data"].runtimeType);
        _rolesAndPer = resp.data["data"];
      }
    else
      {
        _log.i("Responce From get Rols And Permition\n${resp.statusCode} \n ${resp.data}");
      }

    notifyListeners();

}

}