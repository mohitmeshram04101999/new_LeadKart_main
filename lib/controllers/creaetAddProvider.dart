import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leadkart/ApiServices/addDetaL%20API.dart';
import 'package:leadkart/ApiServices/adsApi.dart';
import 'package:leadkart/ApiServices/plansApi.dart';
import 'package:leadkart/Models/PlanBYTypIdModel.dart';
import 'package:leadkart/Models/estimateddataModel.dart';
import 'package:leadkart/Models/offeringResponceModel.dart';
import 'package:leadkart/Models/plansModel.dart';
import 'package:leadkart/Models/targetAreaResponceModel.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

import '../Models/ad_type_model.dart';

class CreateAddProvider with ChangeNotifier{
  AdvertisementTypeModel? _addType;
  PlanDetail2? _plan;
  final TextEditingController _titleController = TextEditingController();
  String? _imagePath;
  double _faceBookBudget = 0;
  double  _instBudget = 0;
  double _googleBudget = 0;
  final TextEditingController _destinationUrlController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  List<int> _targetGender = [1,2,3];
  RangeValues _ageRange = const RangeValues(18, 66);
  List<int> _days = [];
  TimeOfDay? _dayStartTime;
  TimeOfDay? _dayEndTime;
  DateTime? _startDate;
  EstimatedData? _estimatedData;
  DateTime? _endDate;
  final bool _isFaceBookAddEnable = false;
  bool _isInstEnable = false;
  bool _isGoogleAddEnable = false;
  bool _lodingOffer = false;
  List<OfferDetail> _offers = [];
  TargetArea? _targetArea;

  AdvertisementTypeModel? get addType => _addType;
  String? get image => _imagePath;
  PlanDetail2? get plan => _plan;
  TextEditingController get titleController => _titleController;
  double get faceBookBudgetController => _faceBookBudget;
  double get instBudgetController => _instBudget;
  double  get googleBudgetController => _googleBudget;
  TextEditingController get destinationUrlController => _destinationUrlController;
  TextEditingController get captionController => _captionController;
  RangeValues get ageRange => _ageRange;
  EstimatedData?  get estimatedData => _estimatedData;
  List<int> get days => _days;
  TimeOfDay? get dayStartTime => _dayStartTime;
  TimeOfDay? get dayEndTime => _dayEndTime;
  DateTime? get startDate  => _startDate;
  DateTime? get endDate => _endDate;
  bool get isFaceBookAddEnable => _isFaceBookAddEnable;
  bool get isInstEnable => _isInstEnable;
  bool get isGoogleAddEnable => _isGoogleAddEnable;
  bool get loadingOffer => _lodingOffer;
  List<int> get  targetGenders => _targetGender;
  List<OfferDetail> get offers =>_offers;
  TargetArea? get targetArea  => _targetArea;

  //
  //addType
  void setAddType(AdvertisementTypeModel add)
  {
    _addType = add;
    notifyListeners();
  }

  //
  //Increase FaceBook Budget
  void incFacebookBudget()
  {
    _faceBookBudget = _faceBookBudget+200;
    _plan = null;
    getEstimatedPlan();
    notifyListeners();
  }

  void setTargetArea(TargetArea t)
  {
    _targetArea = t;
    notifyListeners();
  }


  //
  //set Gender Target
  void setTargetGender(int i)
  {
    if(_targetGender.contains(i))
      {
        _targetGender.removeWhere((v)=>(i==v));
      }
    else
      {
        _targetGender.add(i);
      }
    notifyListeners();
  }

  //
  //Decrese Facbbo Budget
  void decFacebookBudget()
  {
    double _d = _faceBookBudget-200;
    _faceBookBudget = (_d<0)?0:_d;
    _plan = null;
    getEstimatedPlan();
    notifyListeners();
  }

  //
  //Increase inst Budget
  void incInstBudget()
  {
    _instBudget = _instBudget+200;
    _plan = null;
    getEstimatedPlan();
    notifyListeners();
  }

  //
  //dec Inst Budget
  void decInstBudget()
  {
    double _d = _instBudget-200;
    _instBudget = (_d<0)?0:_d;
    _plan = null;
    getEstimatedPlan();
    notifyListeners();
  }

  void incGoogleBudget()
  {
    _googleBudget = _googleBudget+200;
    getEstimatedPlan();
    notifyListeners();
  }

  void decGoogleBudget()
  {
    double _d = _googleBudget -200;
    _googleBudget = (_d<0)?0:_d;
    getEstimatedPlan();
    notifyListeners();
  }

  void getEstimatedPlan() async
  {

    if(_plan!=null)
    {
      var _d = await AdsApi().getEstimatedPlan( instaBudget: _plan?.facebookBudget??0, facebookBudget: _plan?.facebookBudget??0);
      if(_d!=null)
      {
        _estimatedData  = _d.data;
        notifyListeners();
        return ;
      }
    }

    if(_faceBookBudget!=0|| _instBudget !=0)
      {
        var _d = await AdsApi().getEstimatedPlan( instaBudget: _instBudget.toInt(), facebookBudget: _faceBookBudget.toInt());
        if(_d!=null)
          {
            _estimatedData  = _d.data;
            notifyListeners();
            return ;
          }
      }

    else
      {
        _estimatedData = null;
        notifyListeners();
      }
  }

  void clearFaceBookBudget()
  {
    _faceBookBudget = 0;
    notifyListeners();
  }

  void clearInstBudget()
  {
    _instBudget = 0;
    notifyListeners();
  }

  Future<void> getOffering(BuildContext context,String typeId) async
  {
    _lodingOffer = true;
    notifyListeners();
    var resp  = await PlansApi().getOfferingByAddType(typeId);
    Logger().i("${resp.statusCode}\n${resp.body}");
    if(resp.statusCode==200)
      {
        var decode = jsonDecode(resp.body);
        var d = OfferingApiResponce.fromJson(decode);
        _offers = d.data??[];
      }
    else if(resp.statusCode==404)
      {
        _offers = [];
        var decode = jsonDecode(resp.body);
        MyHelper.mySnakebar(context, decode["message"]);
      }
    else
      {

        Logger().i("${resp.statusCode}\n${resp.body}");
      }

    _lodingOffer = false;
    notifyListeners();
  }

  void setPlan(PlanDetail2? p)
  {
    _plan = p;
    _instBudget =0;
    _faceBookBudget = 0;
    getEstimatedPlan();
    notifyListeners();
  }

  Future<void> selectImage(BuildContext context)async
  {
    var _d =await ImagePicker.platform.getImageFromSource(source: ImageSource.gallery);
    if(_d!=null)
      {
        _imagePath = _d.path;
        notifyListeners();
      }
  }

  void setAgeRange(RangeValues range)
  {
    _ageRange = range;
    notifyListeners();
  }

  Future<void> setDayStartTime(BuildContext context) async
  {
    _dayStartTime = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 0, minute: 0));
    notifyListeners();
  }

  Future<void> setEndTime(BuildContext context) async
  {
    _dayEndTime = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 0, minute: 0));
    notifyListeners();
  }

  Future<void> setStartDay(BuildContext context) async
  {
    _startDate = await showDatePicker(
        context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2800),
    );
    notifyListeners();
  }

  void setDay(int i)
  {
    if(_days.contains(i))
      {
       _days.removeWhere((e)=>i==e);
      }
    else
      {
        _days.add(i);
      }
    notifyListeners();
  }


  Future<void> setEndDay(BuildContext context) async
  {
    _endDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2800),
    );
    notifyListeners();
  }


  void addCaption(String caption){
    captionController.text = caption;
}



  Future<void> createAdd(BuildContext context) async
  {
    var api = AdsApi();
    var d  = await api.createAdd(
      location: _targetArea,
        businessId: Controllers.businessProvider(context,listen: false).currentBusiness?.id??"",
        adTypeId: _addType?.id??"",
      startDate: _startDate?.toIso8601String(),
      endDate: _endDate?.toIso8601String(),
      dayEndTime: "${_dayEndTime?.hour}:${_dayEndTime?.minute}",
      dayStartTime:"${_dayStartTime?.hour}:${_dayStartTime?.minute}",
      ageRangeFrom: _ageRange?.start.toInt(),
      ageRangeTo: _ageRange?.end.toInt(),
      caption: _captionController.text.trim(),
      name:  _titleController.text.trim(),
      days: _days,
      instBudget: _instBudget.toInt(),
      googleBudget: _googleBudget.toInt(),
      faceBookBudget: _faceBookBudget.toInt(),
      destinationUrl: _destinationUrlController.text.trim(),
      file: _imagePath,
      isFaceBookAddEnable: plan==null&&_faceBookBudget>0,
      isInstaAddEnable: plan==null&&_instBudget>0,
      isGoogleAddEnable: plan==null&&_googleBudget>0,
      planId: plan?.id,
    );

    if(d is Map)
      {
        MyHelper.mySnakebar(context, "${d["message"]}");
      }
  }







  void clear()
  {
   _addType = null;
   _plan = null;
   _imagePath = null;
   _titleController.clear();
   _faceBookBudget=0;
   _instBudget = 0;
   _googleBudget =0;
   _destinationUrlController.clear();
   _captionController.clear();
   _ageRange = RangeValues(18, 66);
   _days = [];
   _offers = [];
   _dayStartTime = null;
   _dayEndTime = null;
   _startDate = null;
   _endDate = null;
   _estimatedData = null;
   _targetGender = [1,2,3];
   _targetArea = null;

   notifyListeners();
   Logger().i("create add provider is clear ");
  }
}