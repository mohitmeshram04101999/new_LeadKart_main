

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leadkart/controllers/AllPlansProvider.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';
import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/controllers/authController.dart';
import 'package:leadkart/controllers/businessProvider.dart';
import 'package:leadkart/controllers/creaetAddProvider.dart';
import 'package:leadkart/controllers/editBussnessProvider.dart';
import 'package:leadkart/controllers/imageEditorController.dart';
import 'package:leadkart/controllers/profileProvider.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:provider/provider.dart';

class Controllers
{
  static final useraPrefrenc = UserPreference();
  static final imageEditorController = Get.put(ImageEditorController());
  static final authController = Get.put(Authcontroller());
  static final userPreferencesController = Get.put(UserPreference());
  static CreateBusinessProvider createBusinessProvider(BuildContext context,{bool listen = true}) => Provider.of<CreateBusinessProvider>(context,listen: false);
  static BussnissCategoryProvider bussnissCategoryProvider(BuildContext context,{bool listen = true}) => Provider.of<BussnissCategoryProvider>(context,listen: false);
  static Allplansprovider allplansprovider(BuildContext context,{bool listen = true}) => Provider.of<Allplansprovider>(context,listen: false);
  static Profileprovider profileProvider(BuildContext context,{bool listen = true}) => Provider.of<Profileprovider>(context,listen: false);
  static EditBusinessProvider editBusinessProvider(BuildContext context,{bool listen = true}) => Provider.of<EditBusinessProvider>(context,listen: false);
  static BusinessProvider businessProvider(BuildContext context,{bool listen = true}) => Provider.of<BusinessProvider>(context,listen: false);
  static CreateAddProvider createAddProvider(BuildContext context,{bool listen = true}) => Provider.of<CreateAddProvider>(context,listen: false);
}