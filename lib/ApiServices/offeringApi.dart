import 'package:dio/dio.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/offering_model.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';

class OfferingApi{

  // create new offering
createOfferingByUserId(String title, String desc, String planId, bool disable, String _id,String userId) async
{
  try {
    CurrentUser? _user = await Controllers.userPreferencesController.getUser();
    Offering _offering = Offering(title: title,
        description: desc,
        planId: planId,
        disable: disable,
        id: _id,
        image: "");
    var resp = await MyHelper.dio.post('offering/createOffering?userId=$userId', data: _offering.toJson(), options: Options(
        headers: {
          "Authorization": "${_user!.token}",
        }
    ));
MyHelper.logger.i(resp.data);
return resp;
  } catch (e) {
MyHelper.logger.e(e);
  }
}
}