

import 'package:get/get.dart';
import 'package:leadkart/controllers/authController.dart';
import 'package:leadkart/controllers/imageEditorController.dart';
import 'package:leadkart/controllers/shredprefrence.dart';

class Controllers
{
  static final imageEditorController = Get.put(ImageEditorController());
  static final authController = Get.put(Authcontroller());
  static final userPreferenceController = Get.put(UserPreference());
}