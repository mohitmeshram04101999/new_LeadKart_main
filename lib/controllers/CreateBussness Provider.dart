


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';


class CreateBusinessProvider with ChangeNotifier
{

  //Vars ---
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessCatTitleController = TextEditingController();
  final TextEditingController _businessPhoneNumberController = TextEditingController();
  final TextEditingController _businessWatsAppNumberController = TextEditingController();
  final TextEditingController _webLinkController = TextEditingController();
  final TextEditingController _instaLinkController = TextEditingController();
  final TextEditingController _twitterLinkController = TextEditingController();
  final TextEditingController _youTubeLinkController = TextEditingController();
  final TextEditingController _faceBookLinkController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _tagLineController = TextEditingController();
  String? _businessImage;
  String? _businessCategoryId;
  int? _stateId;
  String? _cityId;
  List<String> _service_ids= [];


  //Getters ----
  TextEditingController get businessNameController  => _businessNameController;
  TextEditingController get businessCatTitleController  => _businessCatTitleController;
  TextEditingController get businessPhoneNumberController  => _businessPhoneNumberController;
  TextEditingController get businessWatsAppNumberController  => _businessWatsAppNumberController;
  TextEditingController get webLinkController  => _webLinkController;
  TextEditingController get instaLinkController  => _instaLinkController;
  TextEditingController get twitterLinkController  => _twitterLinkController;
  TextEditingController get youTubeLinkController  => _youTubeLinkController;
  TextEditingController get faceBookLinkController  => _faceBookLinkController;
  TextEditingController get addressController  => _addressController;
  TextEditingController get tagLinecontroller  => _tagLineController;
  String? get businessImage => _businessImage;
  String? get businessCategoryId => _businessCategoryId;
  int? get stateId => _stateId;
  String? get cityId=>_cityId;
  List<String> get service_ids=> _service_ids;


  //setters---------
  //select Image
Future<void> selectbusinessImage () async
{

}

void upDate()=>notifyListeners();

//set CategoryId
 void setCategoryId(BCategory category){
  _businessCategoryId=category.id;
  _businessCatTitleController.text = category.title??"";
  notifyListeners();

}

//set Stateid
void setStateId(int? id)  {_stateId = id;notifyListeners();}

//set cityId
void setCityId(String? id) {_cityId=id;notifyListeners();}

  //add Service Id
void addService(String id) {_service_ids.add(id);notifyListeners();}

  //Remove id
void removeServiceId(String id) {_service_ids.removeWhere((v)=>v==id);notifyListeners();}




  Future<void> createBussness() async
  {
   print("(${_businessNameController.text})");
   print("(${_businessCategoryId})");
  }


  //
}