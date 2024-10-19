import 'package:flutter/cupertino.dart';
import 'package:leadkart/ApiServices/adsApi.dart';
import 'package:leadkart/Models/addListByBussnesIdModel.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:logger/logger.dart';

class AddListByBusinessProvider with ChangeNotifier {
  bool _loding = true;
  List<AddByBuinesss> _allAds = [];
  int _page = 1;
  bool _hasReachedMax = false;

  bool get loding => _loding;
  List<AddByBuinesss> get allAdds => _allAds;
  int get currentPage => _page;
  bool get hasReachedMax => _hasReachedMax;

  clear() {
    _loding = true;
    _allAds = [];
    notifyListeners();
  }

  load(BuildContext context, {required int page}) async {
    Logger().i("Loading business data...");
    _loding = true;
    // clear();
    notifyListeners();
    var business = Controllers.businessProvider(context).currentBusiness;
    var _d = await AdsApi()
        .getAddListByBusiness(businessId: business?.id ?? "", page: page);
    if (_d != null) {
      // Logger().i("In Log");
      for (var i in _d.data ?? []) {
        if (_allAds.where((element) => element.id == i.id).isEmpty) {
          _allAds.add(i);
        }
      }
      _page = _d.page ?? 1;
      _hasReachedMax = _d.page == page;
      notifyListeners();
    }
    _loding = false;
    notifyListeners();
  }
}
