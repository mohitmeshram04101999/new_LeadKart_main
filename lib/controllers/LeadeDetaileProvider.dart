
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/ApiServices/leads%20api.dart';
import 'package:leadkart/ApiServices/userAPii.dart';
import 'package:leadkart/Models/LeadHisteryDataModel.dart';
import 'package:leadkart/Models/LeadsApiresponce.dart';
import 'package:leadkart/controllers/leadeProvider.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';



class LeadDetailProvider with ChangeNotifier
{

  final _leadApi = LeadsApi();
  final _log = Logger();


  //Variables
  Lead? _lead;
  bool _loading = true;
  List<LeadeHistory> _leadeHestory = [];
  final TextEditingController _noteController = TextEditingController();


  Lead? get lead =>_lead;
  bool get loading =>_loading;
  List<LeadeHistory> get leadHistory => _leadeHestory;
  TextEditingController get noteController => _noteController;

  //
  //lodeLead Detail
  Future<void> loadLeadDetail({
    required BuildContext context,
    required String leadId
}) async
  {
    var resp = await _leadApi.getLeadeDetail(leadId);
    if(resp.statusCode==200)
      {
        var _d = Lead.fromJson(resp.data["data"]);
        _lead = _d;
      }
    else
      {
        _log.e("responce from leadeDetail api \n${resp.statusCode}\n${resp.data}");
        MyHelper.mySnakebar(context, "${resp.statusCode}\n${resp.data}",color:Colors.red);
      }

    _loading = false;
    getHistory(context);
    notifyListeners();

  }


  //
  //updateLead
  Future<void> updateLeadStatus(BuildContext context,String type) async
  {
    _lead?.leadStatus  = type;
    notifyListeners();
    var resp = await _leadApi.updateLeads(_lead?.id??"", changeType:type);
    if(resp.statusCode==200)
      {
        loadLeadDetail(context: context, leadId: _lead?.id??"");
      }
    else
      {
        MyHelper.mySnakebar(context,resp.data["message"]);
        _log.i(resp.data);
      }
  }

  Future<void> getHistory(BuildContext context) async
  {
    var resp = await _leadApi.getLeadHistory(_lead?.id??"");

    if(resp.statusCode==200)
      {
        List  _d = resp.data["data"];
        _leadeHestory = _d.map((e)=>LeadeHistory.fromJson(e)).toList();
      }
    else
      {
        MyHelper.mySnakebar(context, "${resp.statusCode} - \n${resp.data}");
        _log.e("Responce from getHistry api\n${resp.statusCode}\n${resp.data}");
      }

    notifyListeners();
  }


  Future<void> updateNote(BuildContext context) async
  {

    _noteController.text=_lead?.note??"";
    bool? save = await showDialog(context: context, barrierDismissible: false,builder: (context)=>AlertDialog(

      title: const Text("Add Note"),

      content: TextFormField(
        controller: _noteController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppConstent().primeryColor,width:10),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppConstent().primeryColor,)
          ),
        ),

      ),

      actions: [ElevatedButton(onPressed: (){Navigator.pop(context,true);}, child: const Text("Save"))],
    ));

    if(_noteController.text.trim().isNotEmpty && save == true)
      {
        _lead?.note = _noteController.text.trim();
        notifyListeners();
        var resp = await _leadApi.updateLeads(_lead?.id??"",note: _noteController.text.trim());
        MyHelper.mySnakebar(context,resp.data["message"].toString(),color: Colors.green);
        loadLeadDetail(context: context, leadId: _lead?.id??"");
      }
  }



  //
  //Clear provider

clear()
{
  _lead = null;
  _loading = true;
  _leadeHestory = [];
  _noteController.clear();
  _log.i("Lead detailProvider is clear");


}

}