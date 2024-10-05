


import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:flutter/widgets.dart';

import 'package:image_picker/image_picker.dart';
import 'package:leadkart/Models/AllStateMosel.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/Models/getAllCityModelREsponce.dart';
import 'package:leadkart/helper/controllerInstances.dart';

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
  XFile? _businessImage;
  File? imageFile;
  BCategory? _businessCategoryId;
  StateCity? _stateId;
  City? _cityId;
  List<BCategory> _service_ids= [];


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
  XFile? get businessImage => _businessImage;
  BCategory? get businessCategoryId => _businessCategoryId;
  StateCity? get stateId => _stateId;
  City? get cityId=>_cityId;
  List<BCategory> get service_ids=> _service_ids;

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
    _service_ids = [];
  }




  //setters---------
  //select Image
Future<void> selectbusinessImage (BuildContext context) async
{
  // ImagePicker picker = ImagePicker();
  // XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 1);
  // if(pickedFile !=null)
  //   {
  //     _businessImage = pickedFile;
  //     notifyListeners();
  //   }
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'jpeg', 'png'],
  );
  if(result != null) {
    imageFile = File(result.files.single.path!);
    _businessImage = XFile(imageFile!.path);
    notifyListeners();
  } else {
    // User canceled the picker
  }
}

void upDate()=>notifyListeners();

//set CategoryId
 void setCategoryId(BCategory category,BuildContext context) async {
   var _serviece  = Controllers.businessCategoryProvider(context,listen: false);
  _businessCategoryId=category;
   await _serviece.lodeService(category.id??"", context);
   if(_serviece.allSrvices.length!=0)
     {
       _service_ids = [];
       _service_ids.addAll(_serviece.allSrvices);
     }
   else
     {
       _service_ids = [];
     }
  _businessCatTitleController.text = category.title??"";
  notifyListeners();

}

//set Stateid
void setStateId(StateCity? state)  {_stateId = state;notifyListeners();}

//set cityId
void setCityId(City? city) {_cityId=city;notifyListeners();}


  //addService
void addService(BCategory service) {_service_ids.add(service);notifyListeners();}

  //Remove id
void removeServiceId(String id) {_service_ids.removeWhere((v)=>v.id==id);notifyListeners();}




  Future<void> createBusiness(BuildContext context) async
  {

    if(_businessNameController.text=="")
      {
        MyHelper.mySnakebar(context, "Please Provide a business name");
        return ;
      }
    if(_businessNameController.text=="")
    {
      MyHelper.mySnakebar(context, "Please select business category");
      return ;
    }

    if(_stateId==null)
    {
      MyHelper.mySnakebar(context, "Please select City");
      return ;
    }
    if(cityId==null)
    {
      MyHelper.mySnakebar(context, "Please select State");
      return ;
    }

    var  responce = await MyHelper.bussnissApi.createBusiness(
      logo: _businessImage,
      cityId: _cityId?.id??"",
      stateId: _stateId?.id??"",
      businessName: _businessNameController.text,
      businessCategoryId: _businessCategoryId?.id??"",
      // serviceId: _service_ids,
      serviceId: _service_ids.map((e)=>e.id!).toList(),
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



    //if Business created successfull then perfoming action
    if(responce.statusCode==201)
    {
      MyHelper.mySnakebar(context, color: AppConstent().primeryColor,"${responce.message}");
      clear();
      Controllers.businessCategoryProvider(context,listen: false).clean();
      Controllers.businessProvider(context).lode(context);
      context.goNamed("homePage");
    }
    else
      {
        MyHelper.mySnakebar(context, "${responce.message}");
      }
  }


  //
}