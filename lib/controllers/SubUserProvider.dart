import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/ApiServices/RoleApi.dart';
import 'package:leadkart/controllers/shredprefrence.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:logger/logger.dart';

import 'businessProvider.dart';

class SubUserProvider with ChangeNotifier {
  late BusinessProvider _businessProvider;
  final RoleApi _roleApi = RoleApi();
  final _log = Logger();

  List<dynamic> _subUsers = [];
  bool _loading = true;

  List<dynamic> get subUsers => _subUsers;
  bool get loading => _loading;

  Future<void> lode(BuildContext context) async {
    var user = await UserPreference().getUser();
    _businessProvider = Controllers.businessProvider(context);
    var resp = await _roleApi.getAllSubUserByBusinessId(
        userId: user?.id ?? "",
        businessId: _businessProvider.currentBusiness?.id ?? "");

    Logger().e(resp);

    // if (resp.statusCode == 200) {
    // _log.i(resp.body);
    // var decode = jsonDecode(resp.body);
    // var d = GetAllSubUsersApiResponce.fromJson(decode);
    _subUsers = resp ?? [];
    // _log.i("Done ${_subUsers.length}");
    // } else if (resp.statusCode == 404) {
    //   var decode = jsonDecode(resp.body);
    //   MyHelper.mySnakebar(context, "${decode["message"]}");
    // } else {
    //   _log.i("${resp.statusCode}\n${resp.body}");
    //   MyHelper.mySnakebar(context, resp.statusCode.toString());
    // }
    notifyListeners();
  }

  void clear() {
    _subUsers = [];
    _loading = true;
    notifyListeners();
  }
}
