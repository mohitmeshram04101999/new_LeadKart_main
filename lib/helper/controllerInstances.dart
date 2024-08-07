

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leadkart/Models/getCampaindetailModel.dart';
import 'package:leadkart/Models/targetAreaResponceModel.dart';
import 'package:leadkart/controllers/AllPlansProvider.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';
import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/controllers/GetCampaignProvider.dart';
import 'package:leadkart/controllers/LeadeDetaileProvider.dart';
import 'package:leadkart/controllers/RolsAndPermisionProvider.dart';
import 'package:leadkart/controllers/SubUserProvider.dart';
import 'package:leadkart/controllers/addListByBussnessProvider.dart';
import 'package:leadkart/controllers/authController.dart';
import 'package:leadkart/controllers/businessProvider.dart';
import 'package:leadkart/controllers/creaetAddProvider.dart';
import 'package:leadkart/controllers/editBussnessProvider.dart';
import 'package:leadkart/controllers/imageEditorController.dart';
import 'package:leadkart/controllers/leadeProvider.dart';
import 'package:leadkart/controllers/profileProvider.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/controllers/targetAreaSearchAreaController.dart';
import 'package:provider/provider.dart';

class Controllers
{
  static final useraPrefrenc = UserPreference();
  static final imageEditorController = Get.put(ImageEditorController());
  static final authController = Get.put(Authcontroller());
  static final userPreferencesController = Get.put(UserPreference());
  static CreateBusinessProvider createBusinessProvider(BuildContext context,{bool listen = true}) => Provider.of<CreateBusinessProvider>(context,listen: false);
  static BussnissCategoryProvider businessCategoryProvider(BuildContext context,{bool listen = true}) => Provider.of<BussnissCategoryProvider>(context,listen: false);
  static Allplansprovider allPlansProvider(BuildContext context,{bool listen = true}) => Provider.of<Allplansprovider>(context,listen: false);
  static Profileprovider profileProvider(BuildContext context,{bool listen = true}) => Provider.of<Profileprovider>(context,listen: false);
  static EditBusinessProvider editBusinessProvider(BuildContext context,{bool listen = true}) => Provider.of<EditBusinessProvider>(context,listen: false);
  static BusinessProvider businessProvider(BuildContext context,{bool listen = true}) => Provider.of<BusinessProvider>(context,listen: false);
  static CreateAddProvider createAddProvider(BuildContext context,{bool listen = true}) => Provider.of<CreateAddProvider>(context,listen: false);
  static CampaignProvider campaignProvider(BuildContext context,{bool listen = true}) => Provider.of<CampaignProvider>(context,listen: false);
  static AddListByBusinessProvider addListByBusinessProvider(BuildContext context,{bool listen = true}) => Provider.of<AddListByBusinessProvider>(context,listen: false);
  static LeadsProvider leadsProvider(BuildContext context,{bool listen = true}) => Provider.of<LeadsProvider>(context,listen: false);
  static LeadDetailProvider leadDetailProvider(BuildContext context,{bool listen = true}) => Provider.of<LeadDetailProvider>(context,listen: false);
  static SubUserProvider subUserProvider(BuildContext context,{bool listen = true}) => Provider.of<SubUserProvider>(context,listen: false);
  static TargateAreaProvider targateAreaProvider(BuildContext context,{bool listen = true}) => Provider.of<TargateAreaProvider>(context,listen: false);
  static RolesAndPermProvider rolesAndPermProvider(BuildContext context,{bool listen = true}) => Provider.of<RolesAndPermProvider>(context,listen: false);
}