


import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/Models/MycustomResponce.dart';
import 'package:leadkart/component/imagePickerDialog.dart';
import 'package:leadkart/helper/helper.dart';



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
  File? imageFile;
  String? _businessCategoryId;
  int? _stateId;
  String? _cityId;
  List<String> _service_ids= ["664482f4c7cda5618d2edede"];


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

  void clear()
  {
    _businessNameController.clear();
    _businessCatTitleController.clear();
    _businessPhoneNumberController.clear();
    _businessWatsAppNumberController.clear();
    _webLinkController.clear();
    _instaLinkController.clear();
    _twitterLinkController.clear();
    _youTubeLinkController.clear();
    _faceBookLinkController.clear();
    _addressController.clear();
    _tagLineController.clear();
    _businessImage = null;
    _businessCategoryId = null;
    _stateId = null;
    _cityId = null;
    _service_ids = ["664482f4c7cda5618d2edede"];
  }


  //setters---------
  //select Image
Future<void> selectbusinessImage (BuildContext context) async
{
  var pickedFile = await FilePicker.platform.pickFiles(type: FileType.custom,allowMultiple: false, allowedExtensions: [
'jpeg','png'
  ]);
  if(pickedFile!=null)
    {
      _businessImage = pickedFile.files.single.path;
      notifyListeners();
    }
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




  Future<void> createBusiness(BuildContext context) async
  {
    var  responce = await MyHelper.bussnissApi.createBusiness(
      logo: _businessImage,
      businessName: _businessNameController.text,
      businessCategoryId: _businessCategoryId,
      serviceId: _service_ids,
      businessContactNum: _businessPhoneNumberController.text.trim(),
      whatAppNum: _businessWatsAppNumberController.text.trim(),
      webLink: _webLinkController.text.trim(),
      instaLink: _instaLinkController.text.trim(),
      twitterLink: _twitterLinkController.text.trim(),
      youTubeLink: _youTubeLinkController.text.trim(),
      faceBookLink: _faceBookLinkController.text.trim(),
      address: _addressController.text.trim(),
      tagLine: _tagLineController.text.trim(),
    );


  }


  //
}