

import 'package:flutter/cupertino.dart';
import 'package:leadkart/ApiServices/adsApi.dart';
import 'package:leadkart/Models/addListByBussnesIdModel.dart';
import 'package:logger/logger.dart';

class AddListByBusinessProvider with ChangeNotifier
{

  bool _loding = true;
  List<AddByBuinesss> _allAds = [];

  bool get loding => _loding;
  List<AddByBuinesss> get allAdds => _allAds;

  clear()
  {
    _loding = true;
    _allAds = [];
    notifyListeners();
  }

  Future<void> load()async
  {
    _loding = true;
    notifyListeners();
    var _d = await AdsApi().getAddListByBusiness("businessId");
    if(_d!=null)
      {
        Logger().i("In Log");
        _allAds = _d.data??[];

      }
    _loding = false;
    notifyListeners();
  }



}