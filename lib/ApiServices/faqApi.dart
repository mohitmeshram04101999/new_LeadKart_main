import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:logger/logger.dart';



class FaqApi
{
  final _log = Logger();
  final _userPref = UserPreference();

  Future<Response> getAllFaqList({
    bool? disable,
    String? type,
}) async
  {

    var user = await _userPref.getUser();
    var head = await _userPref.getHeader();

    String uri = "/faq/getAllfaq?userId=${user?.id??""}${(disable!=null)?"&disable=$disable":""}${(type!=null)?"&type=$type":""}";

    var resp = await MyHelper.dio.get(uri,options: Options(headers: head));

    return resp;
  }

}