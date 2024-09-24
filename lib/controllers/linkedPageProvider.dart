import 'package:flutter/cupertino.dart';
import 'package:leadkart/Models/getPagesModel.dart';

class LinkedPageProvider with ChangeNotifier {
  FacebookPage? _page;

  FacebookPage? get page => _page;

  setLinkedPage(FacebookPage page) {
    _page = page;
    notifyListeners();
  }

  void clear() {
    _page = null;
    notifyListeners();
  }
}
