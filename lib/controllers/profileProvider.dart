
import 'package:flutter/cupertino.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/helper/helper.dart';

class Profileprovider with ChangeNotifier
{
  bool _initing = true;
  CurrentUser? _user;


  bool  get initing => _initing;
  CurrentUser? get user => _user;

  Future<void> lode() async
  {
    _user = await MyHelper.userApi.getUserById();
    print(_user!.toJson());
    _initing = false;
    notifyListeners();
  }


}