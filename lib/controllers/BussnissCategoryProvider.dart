

import 'package:flutter/cupertino.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';

class BussnissCategoryProvider with ChangeNotifier
{



  //Vars
  List<BCategory> _allCategiry =[];
  List<BCategory> _allService =[];
  bool _loding = true;


  List<BCategory> get allCategory => _allCategiry;
  bool get loding => _loding;

  void upDate()=>notifyListeners();

  Future<void> lode(BuildContext context)async{

    CurruntUser? user = await Controllers.useraPrefrenc.getUser();

    _loding = true;
    notifyListeners();
    CustomResponce responce =  await MyHelper.bussnissApi.getAllCategory(
      userId: user!.id!,
    );
    if(responce.data!=null)
      {
        BussnissCategoryApiModel _d = responce.data;
        _allCategiry = _d.data??[];
      }
    else
      {
        MyHelper.mySnakebar(context, "${responce.errorMessage}");
      }
    _loding  = false;
    notifyListeners();
}

Future<void> lodeService(BCategory category,BuildContext context) async
{
  CurruntUser? user = await Controllers.useraPrefrenc.getUser();
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
}



}