import 'package:dio/dio.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
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
    MyHelper.logger.i(resp.data);
    return resp;
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