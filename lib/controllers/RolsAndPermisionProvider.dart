import 'dart:core';

import 'package:flutter/material.dart';
import 'package:leadkart/ApiServices/RoleApi.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/animated%20dilog.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class RolesAndPermProvider with ChangeNotifier {
  final _log = Logger();
  final RoleApi _roleApi = RoleApi();

  List _rolesAndPer = [];
  bool _loading = false;
  TextEditingController _roleNameController = TextEditingController();
  Map<String, List<String>> _selectedPermissionData = {};

  List get rolesAndPer => _rolesAndPer;
  bool get loading => _loading;
  TextEditingController get roleNameController => _roleNameController;

  Future<void> getAllPerm(BuildContext context) async {
    var resp = await _roleApi.getAllRoleAndPerm(
        businessId:
            Controllers.businessProvider(context).currentBusiness?.id ?? "");

    if (resp.statusCode == 200) {
      // _log.e(resp.data["data"].runtimeType);
      _rolesAndPer = resp.data["data"];
    } else {
      _log.i(
          "Response From get Roles And Permission\n${resp.statusCode} \n ${resp.data}");
    }

    notifyListeners();
  }

  void selectPermission(String key, String value) {
    if (_selectedPermissionData[key] == null) {
      _selectedPermissionData[key] = [];
    }
    if (_selectedPermissionData[key]?.contains(value) ?? false) {
      _selectedPermissionData[key]?.removeWhere((e) => e == value);
    } else {
      _selectedPermissionData[key]?.add(value);
    }
    notifyListeners();
  }

  Future<void> createNewPermission(BuildContext context) async {
    await OpenDailovgWithAnimation(context,
        dailog: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 8),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          title: const Text("Create Role"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //
              CustomTextField(
                  controller: _roleNameController, labelText: "Role Name"),

              //
              //
              FutureBuilder(
                  future: _roleApi.getPermissionsList(),
                  builder: (context, s) {
                    if (s.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (s.hasError) {
                      return Text("${s.error} ${s.stackTrace}");
                    }
                    if (s.data?.statusCode == 200) {
                      return Consumer<RolesAndPermProvider>(builder: (a, p, c) {
                        return DataTable(columns: const [
                          DataColumn(label: Text("Permissions")),
                          DataColumn(label: Text("Read")),
                          DataColumn(label: Text("Write")),
                        ], rows: [
                          for (var i in s.data?.data["data"])
                            for (String key in i.keys)
                              DataRow(cells: [
                                //
                                DataCell(Text(key)),

                                //
                                //
                                DataCell(Checkbox(
                                  value: _selectedPermissionData[key]
                                          ?.contains('read') ??
                                      false,
                                  onChanged: (c) {
                                    p.selectPermission(key, "read");
                                  },
                                )),

                                //
                                //
                                DataCell(Checkbox(
                                  value: _selectedPermissionData[key]
                                          ?.contains('write') ??
                                      false,
                                  onChanged: (c) {
                                    p.selectPermission(key, "write");
                                  },
                                )),
                              ])
                        ]);
                      });
                    }

                    return const Center(
                      child: Text("Something is Wrong"),
                    );
                  }),

              ElevatedButton(
                  onPressed: () async {
                    if (_roleNameController.text.isEmpty) {
                      MyHelper.mySnakebar(context, "Enter Role Name");
                      return;
                    }
                    if (_selectedPermissionData.isEmpty) {
                      MyHelper.mySnakebar(context, "Select permission");
                      return;
                    }

                    List<Map<String, List<String>>> _d = [];
                    for (var item in _selectedPermissionData.keys) {
                      if (_selectedPermissionData[item] != null) {
                        _d.add({item: _selectedPermissionData[item] ?? []});
                      }
                    }

                    var res = await _roleApi.createRolePerm(
                        roleName: _roleNameController.text.trim(),
                        data: _d,
                        businessId: Controllers.businessProvider(context)
                                .currentBusiness
                                ?.id ??
                            "");

                    if (res.statusCode == 201) {
                      getAllPerm(context);
                      MyHelper.mySnakebar(context, "${res.data["message"]}",
                          color: Colors.green);
                      Navigator.pop(context);
                    } else {
                      MyHelper.mySnakebar(
                          context, "${res.statusCode}\n${res.data}");
                    }
                  },
                  child: const Text("Create"))
            ],
          ),
        ));

    _selectedPermissionData = {};
    _roleNameController.clear();
  }

  void clear() {
    _roleNameController.clear();
    _rolesAndPer = [];
    _loading = false;
    _selectedPermissionData = {};
  }
}
