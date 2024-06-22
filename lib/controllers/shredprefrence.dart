import 'dart:convert';

import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{
  Future<bool> saveUser (CurruntUser user)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String _data = jsonEncode(user.toJson());
    sp.setString("currentUser", _data);
    return true;
  }



  Future<CurruntUser?> getUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    var _data = sp.getString("currentUser");
    if(_data!=null)
      {
        var decode = jsonDecode(_data);
        CurruntUser user = CurruntUser.fromJson(decode);
        return user;
      }
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool success = await sp.clear();
    print('User data cleared: $success'); // Debug log
    return success;
  }



}