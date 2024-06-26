import 'package:dio/dio.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';

class StatesApi{

  // get all states by country id
  getAllStatesByCountryId(String countryId) async
  {
    try{
      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
    var resp = await MyHelper.dio.get('state/getAllState?countryId=$countryId', options: Options(
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

  // get all cities by state and user id

  getAllCitiesByStateAndUserId(String stateId, String userId) async
  {
    try{
      final CurrentUser? _user = await Controllers.userPreferencesController
          .getUser();
    var resp = await MyHelper.dio.get('city/getAllCity?stateId=$stateId&userId=$userId', options: Options(
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