import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:leadkart/ApiServices/api%20Path.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/Models/ads_plan_model.dart';
import 'package:leadkart/Models/offering_model.dart';
import 'package:leadkart/Models/plansModel.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class PlansApi{

 Future<List<PlanDetail>?> getAllAiImagePlans() async
 {
   final CurrentUser? _user = await Controllers.userPreferencesController
       .getUser();
   var resp = await MyHelper.dio.get('plan/getAllPlan', options: Options(
       headers: {
         "Authorization": "${_user!.token}",
       }
   ));
   // MyHelper.logger.i(resp.data);
   if(resp.statusCode ==200)
   {
     List<PlanDetail> AllPlans  = [];
     var _d = ViewPlansModel.fromJson(resp.data);
     AllPlans.addAll(_d.data!);

     return AllPlans;
   }

 }


 Future<http.Response> getPlansByTypeId(String typeId) async
 {
   var user = await UserPreference().getUser();
   var head = await UserPreference().getHeader();
   String uri = ApiConst.baseUrl+"/plan/getAdvertisementTypeIdByPlan?advertisementTypeId=$typeId";
   var resp  = await http.get(Uri.parse(uri),headers: head);
   return resp;
 }

 createAiImagePlan( String userId) async
 {
   try {
     CurrentUser? _user = await Controllers.userPreferencesController.getUser();
     AdsPlan _plan = AdsPlan(
       advertisementTypeId: '615f4b3b7b3b3b001f3b3b3b',
       title: 'SK e solution',
       price: 100,
       duration: 30,
       dailySpendBudget: 10,
       aiImageCount: 10,
       instaBudget: 10,
       googleBudget: 10,
       facebookBudget: 10,
     );
     var resp = await MyHelper.dio.post('plan/createPlan?userId=$userId', data: _plan.toJson(), options: Options(
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

 Future<http.Response> getOfferingByAddType(String planId) async
 {
   final uri =  "${ApiConst.baseUrl}/offering/getAllOffering?planId=$planId";
   var head =  await UserPreference().getHeader();
   var resp = await http.get(Uri.parse(uri),headers: head);
   return resp;
 }

}