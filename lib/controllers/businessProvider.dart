

import 'package:flutter/cupertino.dart';
import 'package:leadkart/ApiServices/BussnessApi.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/business_model.dart';
import 'package:leadkart/helper/controllerInstances.dart';

class BusinessProvider with ChangeNotifier
{
  bool _loding = false;
  List<BusinessModel> _allBusiness = [];
  BusinessModel? _currentBusiness;

  bool get loding => _loding;
  List<BusinessModel> get  allBusiness =>_allBusiness;
BusinessModel? get currentBusiness => _currentBusiness;
  Future<void> lode() async
  {
    _loding = true;
    CurrentUser? user = await Controllers.userPreferencesController.getUser();
    CustomResponce responce = await BussnissApi().getBusinessByUserId(userId: user!.id!);
    if(responce.statusCode==200)
      {
        _allBusiness = responce.data;
      }

    _loding = false;
    notifyListeners();

  }

  setCurrentBusiness(BusinessModel business)
  {
    _currentBusiness = business;
    notifyListeners();
  }

}