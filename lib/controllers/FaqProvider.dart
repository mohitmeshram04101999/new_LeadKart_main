


import 'package:flutter/cupertino.dart';
import 'package:leadkart/ApiServices/faqApi.dart';
import 'package:leadkart/Models/faq_responce_model.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/web.dart';

class FaqProvider with ChangeNotifier
{
  final _faqApi = FaqApi();
  final _lod = Logger();

  bool _loding = true;

  bool get loading => _loding;



  Future<List<Question>?> getAllFaq(BuildContext context,{String? type})async{
    var resp = await _faqApi.getAllFaqList(type: type);
    if(resp.statusCode==200)
      {
        FaqApiResponce responce = FaqApiResponce.fromJson(resp.data);
        _loding =false;
        notifyListeners();
        return responce.data;
      }
    else
      {
        _lod.e("${resp.statusCode}\n${resp.data}");

        MyHelper.mySnakebar(context, "${resp.statusCode}\n${resp.data}");
        _loding =false;
        notifyListeners();
      }
   ;
  }

}