


import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:image_picker/image_picker.dart';
import 'package:leadkart/Models/AllStateMosel.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/Models/business_model.dart';
import 'package:leadkart/Models/getAllCityModelREsponce.dart';
import 'package:leadkart/helper/controllerInstances.dart';

import 'package:leadkart/helper/helper.dart';



class EditBusinessProvider with ChangeNotifier
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
  bool _isImageUpdated = false;


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
  bool get isImageUpdated => _isImageUpdated;



  //Initial provider setUp 
  void init(BuildContext context) async
  {

    var bus = Controllers.businessProvider(context,listen: false).currentBusiness;
   var service =  Controllers.businessCategoryProvider(context);

    _businessNameController.text = bus?.businessName??"";
    _businessPhoneNumberController.text = bus?.businessContact!=null?bus!.businessContact.toString():"";
    _businessWatsAppNumberController.text = bus?.whatsappNumber!=null?bus!.whatsappNumber.toString():"";
    _webLinkController.text = bus?.websiteLink??"";
    _instaLinkController.text= bus?.instagramLink??"";
    _twitterLinkController.text= bus?.twitterLink??"";
    _youTubeLinkController.text= bus?.youtubeLink??"";
    _faceBookLinkController.text = bus?.facebookLink??"";
    _addressController.text= bus?.address??"";
    _tagLineController.text=bus?.tagline??"";
    await service.lode(context);
    await service.lodeService(bus?.businessCategoryId??"",context);


    if(bus?.servicesId!=null)
      {

        for(BCategory i in service.allSrvices??[])
        {
          MyHelper.logger.i("{  ${i.id}  ${bus?.servicesId.first}");
          if(bus!.servicesId.contains(i.id))
            {
              addService(i);
            }
        }
      }

    //setting Category id
    for(var i in service.allCategory)
    {

      if(i.id==bus!.businessCategoryId)
      {
        _businessCategoryId = i;
      }
    }


    //Setting City id
    for(var i in service.allCity)
      {
        if(i.id==bus!.cityId)
          {
            _cityId = i;
          }
      }

    //setting State
    for(var i in service.allState)
    {
      if(i.id==bus!.stateId)
      {
        _stateId = i;
      }
    }
     notifyListeners();
  }



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
    _isImageUpdated = false;
  }




  //setters---------
  //select Image
  Future<void> selectbusinessImage (BuildContext context) async
  {

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if(result != null) {
      imageFile = File(result.files.single.path!);
      _businessImage = XFile(imageFile!.path);
      _isImageUpdated = true;
      notifyListeners();
    } else {
      // User canceled the picker
    }
  }

  void clearImaga()
  {
    _businessImage = null;
    _isImageUpdated = false;
    notifyListeners();
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




  Future<void> upDateBusiness(BuildContext context) async
  {

    if(_businessNameController.text=="")
    {
      MyHelper.mySnakebar(context, "Please Provide a business name");
      return ;
    }
    if(_businessCategoryId ==null)
    {
      MyHelper.mySnakebar(context, "Please select business category");
      return ;
    }


    if(_stateId==null)
    {
      MyHelper.mySnakebar(context, "Please select State");
      return ;
    }
    if(cityId==null)
      {
        MyHelper.mySnakebar(context, "Please select City");
        return ;
      }


    var  responce = await MyHelper.bussnissApi.upDateBusiness(
      businessId: Controllers.businessProvider(context,listen: false).currentBusiness?.id??"",
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
    if(responce.statusCode==200)
      {
        BusinessModel data = responce.data;
        Controllers.businessProvider(context,listen: false).setCurrentBusiness(context,data);
        clear();
        Controllers.businessCategoryProvider(context,listen: false).clean();
        context.pop();

      }
  }


  updateFacebookPage() async
  {




  }


//
}