import 'package:flutter/cupertino.dart';
import 'package:leadkart/ApiServices/BussnessApi.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/business_model.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/controllerInstances.dart';


class BusinessProvider with ChangeNotifier {
  //Variables
  bool _loding = false;
  List<BusinessModel> _allBusiness = [];
  BusinessModel? _currentBusiness;
  //

  //Getters
  bool get loding => _loding;
  List<BusinessModel> get allBusiness => _allBusiness;
  BusinessModel? get currentBusiness => _currentBusiness;
  //

//lode Method
  Future<void> lode() async {
    _loding = true;
    CurrentUser? user = await Controllers.userPreferencesController.getUser();
    CustomResponce responce =
        await BussnissApi().getBusinessByUserId(userId: user!.id!);

    if (responce.statusCode == 200) {
      _allBusiness = responce.data;
    }

    _loding = false;
    _currentBusiness = await Controllers.useraPrefrenc.getBusiness();
    notifyListeners();
  }
  //

  //set Current Business
  setCurrentBusiness(BusinessModel business) {
    _currentBusiness = business;
    notifyListeners();
    UserPreference().saveBusiness(business);
  }
  //
}
