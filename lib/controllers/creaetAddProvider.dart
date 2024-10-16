import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leadkart/ApiServices/adsApi.dart';
import 'package:leadkart/ApiServices/plansApi.dart';
import 'package:leadkart/Models/PlanBYTypIdModel.dart';
import 'package:leadkart/Models/estimateddataModel.dart';
import 'package:leadkart/Models/targetAreaResponceModel.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:logger/logger.dart';

import '../Models/ad_type_model.dart';
import '../Models/offeringResponceModel.dart';

class CreateAddProvider with ChangeNotifier {
  AdvertisementTypeModel? _addType;
  PlanDetail2? _plan;
  final TextEditingController _titleController = TextEditingController();
  String? _imagePath;
  TextEditingController _faceBookBudget = TextEditingController();
  TextEditingController _instBudget = TextEditingController();
  TextEditingController _googleBudget = TextEditingController();
  final TextEditingController _destinationUrlController =
      TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  List<int> _targetGender = [1, 2, 3];
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
  List<String> _adInterests = [];
  TargetArea? _targetArea;

  AdvertisementTypeModel? get addType => _addType;
  String? get image => _imagePath;
  PlanDetail2? get plan => _plan;
  TextEditingController get titleController => _titleController;
  TextEditingController get faceBookBudgetController => _faceBookBudget;
  TextEditingController get instBudgetController => _instBudget;
  TextEditingController get googleBudgetController => _googleBudget;
  TextEditingController get destinationUrlController =>
      _destinationUrlController;
  TextEditingController get captionController => _captionController;
  RangeValues get ageRange => _ageRange;
  EstimatedData? get estimatedData => _estimatedData;
  List<int> get days => _days;
  TimeOfDay? get dayStartTime => _dayStartTime;
  TimeOfDay? get dayEndTime => _dayEndTime;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  bool get isFaceBookAddEnable => _isFaceBookAddEnable;
  bool get isInstEnable => _isInstEnable;
  bool get isGoogleAddEnable => _isGoogleAddEnable;
  bool get loadingOffer => _lodingOffer;
  List<int> get targetGenders => _targetGender;
  List<OfferDetail> get offers => _offers;
  TargetArea? get targetArea => _targetArea;
  List<String> get adInterests => _adInterests;

  //
  //addType
  void setAddType(AdvertisementTypeModel add) {
    _addType = add;
    notifyListeners();
  }

  //
  //Increase FaceBook Budget
  void incFacebookBudget() {
    if (_faceBookBudget.text.trim().isEmpty) {
      _faceBookBudget.clear();
    }

    int b = int.parse(_faceBookBudget.text.trim());
    b = b + 200;
    _faceBookBudget.text = b.toString();
    _plan = null;
    getEstimatedPlan();
  }

  //
  void setFaceBookBudget(String b) {
    _faceBookBudget.text = int.parse(b).toString();
  }

  void setTargetArea(TargetArea t) {
    _targetArea = t;
    notifyListeners();
  }

  //
  //set Gender Target
  void setTargetGender(int i) {
    if (_targetGender.contains(i)) {
      _targetGender.removeWhere((v) => (i == v));
    } else {
      _targetGender.add(i);
    }
    notifyListeners();
  }

  //
  //Decrese Facbbo Budget
  void decFacebookBudget() {
    int b = int.parse(_faceBookBudget.text.trim());
    int _d = b - 200;
    _faceBookBudget.text = (_d < 0) ? "0" : _d.toString();
    _plan = null;
    getEstimatedPlan();
  }

  //
  //Increase inst Budget
  void incInstBudget() {
    if (_instBudget.text.trim().isEmpty) {
      _instBudget.clear();
    }
    int b = int.parse(_instBudget.text.trim());
    b = b + 200;
    _instBudget.text = b.toString();
    _plan = null;
    getEstimatedPlan();
  }

  void setInstBudget(String b) {
    _instBudget.text = int.parse(b).toString();
  }

  //
  //dec Inst Budget
  void decInstBudget() {
    int b = int.parse(_instBudget.text.trim());
    int _d = b - 200;
    _instBudget.text = (_d < 0) ? "0" : _d.toString();
    _plan = null;
    getEstimatedPlan();
  }

  void incGoogleBudget() {
    int b = int.parse(_googleBudget.text.trim());
    b = b + 200;
    _googleBudget.text = b.toString();
    getEstimatedPlan();
  }

  void setGoogleBudget(String b) {
    _googleBudget.text = int.parse(b).toString();
  }

  void decGoogleBudget() {
    int b = int.parse(_googleBudget.text.trim());
    int _d = b - 200;
    _googleBudget.text = (_d < 0) ? "0" : _d.toString();
    getEstimatedPlan();
  }

  void getEstimatedPlan() async {
    if (_plan != null) {
      var _d = await AdsApi().getEstimatedPlan(
          instaBudget: _plan?.facebookBudget ?? 0,
          facebookBudget: _plan?.facebookBudget ?? 0);
      if (_d != null) {
        _estimatedData = _d.data;
        notifyListeners();
        return;
      }
    }

    if (_faceBookBudget != 0 || _instBudget != 0) {
      var _d = await AdsApi().getEstimatedPlan(
          instaBudget: int.parse(_instBudget.text.trim()),
          facebookBudget: int.parse(_faceBookBudget.text.trim()));
      if (_d != null) {
        _estimatedData = _d.data;
        notifyListeners();
        return;
      }
    } else {
      _estimatedData = null;
      notifyListeners();
    }
  }

  void clearFaceBookBudget() {
    _faceBookBudget.text = "0";
    notifyListeners();
  }

  void clearInstBudget() {
    _instBudget.text = "0";
    notifyListeners();
  }

  Future<void> getOffering(BuildContext context, String typeId) async {
    _lodingOffer = true;
    notifyListeners();
    var resp = await PlansApi().getOfferingByAddType(typeId);
    Logger().i("${resp.statusCode}\n${resp.body}");
    if (resp.statusCode == 200) {
      var decode = jsonDecode(resp.body);
      var d = OfferingApiResponce.fromJson(decode);
      _offers = d.data ?? [];
    } else if (resp.statusCode == 404) {
      _offers = [];
      var decode = jsonDecode(resp.body);
      MyHelper.mySnakebar(context, decode["message"]);
    } else {
      Logger().i("${resp.statusCode}\n${resp.body}");
    }

    _lodingOffer = false;
    notifyListeners();
  }

  void setPlan(PlanDetail2? p) {
    if (p != null) {
      _plan = p;
      _instBudget.text = "0";
      _faceBookBudget.text = "0";
      getEstimatedPlan();
      notifyListeners();
    } else {
      _plan = p;
    }
  }

  Future<void> selectImage(BuildContext context) async {
    var _d = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);
    if (_d != null) {
      _imagePath = _d.path;
      notifyListeners();
    }
  }

  void setAgeRange(RangeValues range) {
    _ageRange = range;
    notifyListeners();
  }

  Future<void> setDayStartTime(BuildContext context) async {
    _dayStartTime = await showTimePicker(
        context: context, initialTime: const TimeOfDay(hour: 0, minute: 0));
    notifyListeners();
  }

  Future<void> setEndTime(BuildContext context) async {
    _dayEndTime = await showTimePicker(
        context: context, initialTime: const TimeOfDay(hour: 0, minute: 0));
    notifyListeners();
  }

  Future<void> setStartDay(BuildContext context) async {
    _startDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2800),
    );
    notifyListeners();
  }

  void setDay(int i) {
    if (_days.contains(i)) {
      _days.removeWhere((e) => i == e);
    } else {
      _days.add(i);
    }
    notifyListeners();
  }

  void setAdInterests(String i) {
    if (_adInterests.contains(i)) {
      // _adInterests.removeWhere((e)=>i==e);
    } else {
      _adInterests.add(i);
    }
    notifyListeners();
  }

  void removeAdInterests(String i) {
    if (_adInterests.contains(i)) {
      _adInterests.removeWhere((e) => i == e);
    }
    notifyListeners();
  }

  Future<void> setEndDay(BuildContext context) async {
    _endDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2800),
    );
    notifyListeners();
  }

  void addCaption(String caption) {
    captionController.text = caption;
  }

  Future<dynamic> createAdd(BuildContext context) async {
    try {
      var api = AdsApi();
      var d = await api.createAdd(
        location: _targetArea,
        businessId: Controllers.businessProvider(context, listen: false)
                .currentBusiness
                ?.id ??
            "",
        adTypeId: _addType?.id ?? "",
        startDate: _startDate?.toIso8601String(),
        endDate: _endDate?.toIso8601String(),
        dayEndTime: "${_dayEndTime?.hour}:${_dayEndTime?.minute}",
        dayStartTime: "${_dayStartTime?.hour}:${_dayStartTime?.minute}",
        ageRangeFrom: _ageRange?.start.toInt(),
        ageRangeTo: _ageRange?.end.toInt(),
        caption: _captionController.text.trim(),
        name: _titleController.text.trim(),
        days: _days,
        instBudget: int.parse(_instBudget.text),
        googleBudget: int.parse(_googleBudget.text),
        faceBookBudget: int.parse(_faceBookBudget.text),
        destinationUrl: _destinationUrlController.text.trim(),
        file: _imagePath,
        isFaceBookAddEnable:
            plan == null && int.parse(_faceBookBudget.text) > 0,
        isInstaAddEnable: plan == null && int.parse(_instBudget.text) > 0,
        isGoogleAddEnable: plan == null && int.parse(_faceBookBudget.text) > 0,
        planId: plan?.id,
      );

      if (d is Map) {
        if (kDebugMode) {
          MyHelper.mySnakebar(context, "${d["message"]}");
        }
      }
      return d;
    } catch (e) {
      Logger().e(e);
      MyHelper.mySnakebar(context, "Something went wrong ");
    }
  }

  Future<List<dynamic>?> getInterests(BuildContext context,
      {required String businessId, required String query}) async {
    var resp =
        await AdsApi().getInterests(businessId: businessId, query: query);

    if (resp?.statusCode == 200) {
      if (resp?.data?['message'] == 'Target Serch Area Data') {
        return resp?.data['data'];
      } else {
        Logger().i("$resp");
        return [];
      }
    } else {
      if (kDebugMode) {
        MyHelper.mySnakebar(context, "${resp?.statusCode}\n${resp?.data}");
      } else {
        MyHelper.mySnakebar(context, "Something went wrong ");
      }
    }
  }

  void clear() {
    _addType = null;
    _plan = null;
    _imagePath = null;
    _titleController.clear();
    _faceBookBudget.text = "0";
    _instBudget.text = "0";
    _googleBudget.text = "0";
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
    _targetGender = [1, 2, 3];
    _targetArea = null;

    notifyListeners();
    Logger().i("create add provider is clear ");
  }
}
