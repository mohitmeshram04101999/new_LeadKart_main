

import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/helper/helper.dart';

class BussnissApi
{

  //get add Category Api
  Future<CustomResponce> getAllCategory({
    String userId = "66446389926d794e368c8f6c",
    int page = 1,
    String? title,
    String? categoryId,

}) async
  {
    // /category/getAllCategory?userId=66446389926d794e368c8f6c&title=category&categoryId=&page=1
    String uri = "/category/getAllCategory?userId=$userId&page=$page${title!=null?"&title=$title":""}${categoryId!=null?"&categoryId=$categoryId":""}";

    var resp = await MyHelper.dio.get(uri);

    if(resp.statusCode==200)
      {
        BussnissCategoryApiModel _d = BussnissCategoryApiModel.fromJson(resp.data);
        return CustomResponce(
          statusCode: resp.statusCode!,
          message: _d.message.toString(),
          data:_d,
        );
      }
    else
      {
        print("${'-'*10} Responce from allCategory api ${'-'*10}");
        print(resp.statusCode);
        print(resp.data);
      }
        return CustomResponce(
          statusCode: resp.statusCode!,
          errorStatus: true,
          errorMessage: resp.data.toString(),
        );
      }

}
