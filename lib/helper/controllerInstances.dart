

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';
import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/controllers/authController.dart';
import 'package:leadkart/controllers/imageEditorController.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:provider/provider.dart';

class Controllers
{
  static final useraPrefrenc = UserPreference();
  static final imageEditorController = Get.put(ImageEditorController());
  static final authController = Get.put(Authcontroller());
  static CreateBusinessProvider createBusinessProvider(BuildContext context,{bool listen = true}) => Provider.of<CreateBusinessProvider>(context,listen: false);
  static BussnissCategoryProvider bussnissCategoryProvider(BuildContext context,{bool listen = true}) => Provider.of<BussnissCategoryProvider>(context,listen: false);
}