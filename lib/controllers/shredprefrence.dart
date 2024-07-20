import 'dart:convert';

import 'package:get/get.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/business_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference extends GetxController{

  Rxn<SharedPreferences> prefs= Rxn<SharedPreferences>();
  Future<bool> saveUser (CurrentUser user)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String _data = jsonEncode(user.toJson());
    sp.setString("currentUser", _data);
    return true;
  }


  //getUser
  Future<CurrentUser?> getUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    var _data = sp.getString("currentUser");
    if(_data!=null)
      {
        var decode = jsonDecode(_data);
        CurrentUser user = CurrentUser.fromJson(decode);
        return user;
      }
  }

  //removeUser
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool success = await sp.clear();
    print('User data cleared: $success'); // Debug log
    return success;
  }

  //get header
  Future<Map<String,String>?> getHeader()async
  {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var _data = sp.getString("currentUser");
    if(_data!=null)
    {
      var decode = jsonDecode(_data);
      CurrentUser user = CurrentUser.fromJson(decode);
      return {"Authorization":user.token??""};
    }

  }


  saveBusiness(BusinessModel business) async
  {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String d = jsonEncode(business.toMap());
    sp.setString("userBusiness", d);
  }

  Future<BusinessModel?> getBusiness() async
  {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var _data = sp.getString("userBusiness");
    if(_data!=null)
    {
      var decode = jsonDecode(_data);
      BusinessModel businessModel = BusinessModel.fromMap(decode);
      return businessModel;
    }

  }



}