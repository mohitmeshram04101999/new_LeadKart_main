
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/ApiServices/addDetaL%20API.dart';
import 'package:leadkart/Models/addRepot%20Model.dart';
import 'package:leadkart/Models/getCampaindetailModel.dart';
import 'package:leadkart/helper/helper.dart';

class CampaignProvider with ChangeNotifier
{
  bool _loading = true;
  GetCampaignDetailModel? _data;
  Map<String,dynamic>? _faceBookReport;
  Map<String,dynamic>? _instReport;
  String? _selectedPlateform;


  GetCampaignDetailModel? get data =>_data;
  bool get loading =>_loading;
  Map<String,dynamic>? get faceBookReport =>_faceBookReport;
  Map<String,dynamic>? get instReport => _instReport;
  String? get selectedPlateform=> _selectedPlateform;


  void setSelectedPlateForm(String? s)
  {
    _selectedPlateform = s;
    notifyListeners();
  }

  Future<void> load(BuildContext context,{required String campaignId})async
  {
    var _d = await AddDetailApi.getAddCampaignData();
    if(_d!=null)
      {
        _data = _d;
        notifyListeners();
        if(_d.data?.isFacebookAdEnabled??false)
          {
             await getFaceBookReport(_d.data?.facebookAdSetId??"");
            _selectedPlateform = "F";
          }
        if(_d.data?.isInstaAdEnabled??false)
        {

        }
      }
    else
      {
        MyHelper.mySnakebar(context, "Something went Wrong");
      }
    _loading =false;
    notifyListeners();
  }

  //get Ad Report
  Future<void> getFaceBookReport(String id) async
  {
    var _d = await AddDetailApi.getaddReport(id);
    if(_d!=null)
      {
        _faceBookReport = _d;
        notifyListeners();
      }
  }

  Future<void> getInstReport(String id) async
  {
    var _d = await AddDetailApi.getaddReport(id);
    if(_d!=null)
    {
      _instReport = _d ;
      notifyListeners();
    }
  }

  clear()
  {
    _data = null;
    _loading = true;
    _faceBookReport = null;
    _selectedPlateform = null;
    _instReport = null;
    notifyListeners();
  }



}