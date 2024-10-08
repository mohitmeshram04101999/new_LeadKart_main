import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LinkedPageProvider with ChangeNotifier {
  String? _pageId;
  String? _pageName;
  String? _pageAccessToken;

  setLinkedPage(
      {required String name,
      required String id,
      required String accessToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("pageId", id);
    prefs.setString("pageName", name);
    prefs.setString("pageAccessToken", accessToken);
    loadLinkedPage();
    notifyListeners();
  }

  Future<bool> loadLinkedPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pageId = prefs.getString("pageId");
    String? pageName = prefs.getString("pageName");
    String? pageAccessToken = prefs.getString("pageAccessToken");
    _pageId = pageId;
    _pageName = pageName;
    _pageAccessToken = pageAccessToken;
    notifyListeners();
    if (pageId != null && pageName != null && pageAccessToken != null) {
      return true;
    }
    return false;
  }

  String? get pageId => _pageId;
  String? get pageName => _pageName;
  String? get pageAccessToken => _pageAccessToken;

  void clear() {
    _pageId = null;
    _pageName = null;
    _pageAccessToken = null;
    notifyListeners();
  }
}
