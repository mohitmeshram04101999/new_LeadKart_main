import 'package:dio/dio.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/ad_type_model.dart';
import 'package:leadkart/Models/ads_model.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';

class AdsApi{

  // get all ads
  getAllAdvertisementTypes() async
  {
    try{
      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
    var resp = await MyHelper.dio.get('advertisement/getAllAdvertisment', options: Options(
      headers: {
        "Authorization": "${_user!.token}",
      }
    ));
    MyHelper.logger.i(resp.data['data']);
    List<AdvertisementTypeModel> adsTypeModel = [];
    for(var i in resp.data['data'])
    {
      adsTypeModel.add(AdvertisementTypeModel.fromJson(i));
    }

    if(resp.statusCode==200){
      MyHelper.logger.i(adsTypeModel);
    }else{
      MyHelper.logger.i(adsTypeModel);
    }
    return adsTypeModel;
    }
    catch(e)
    {
      MyHelper.logger.e(e);
    }
  }

  // get single ad by id
  getSingleAdvertisementById(String adId) async
  {
    try{
      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
    var resp = await MyHelper.dio.get('advertisement/getSingleAdvertisment/$adId', options: Options(
      headers: {
        "Authorization": "${_user!.token}",
      }
    ));
    MyHelper.logger.i(resp.data);
    return resp;
    }
    catch(e)
    {
      MyHelper.logger.e(e);
    }
  }
}