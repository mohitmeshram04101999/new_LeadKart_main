import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leadkart/ApiServices/RoleApi.dart';
import 'package:leadkart/Models/rolsforSubUsersapiResponce.dart';
import 'package:leadkart/Models/verifsubuserOtpModel.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/animated%20dilog.dart';
import 'package:logger/logger.dart';
import 'package:pinput/pinput.dart';

class AddSubUserProvider with ChangeNotifier {
  final RoleApi _roleApi = RoleApi();
  final _log = Logger();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String? _otp;
  List<Role> _role = [];

  TextEditingController get phoneController => _phoneController;
  TextEditingController get passController => _passController;
  TextEditingController get nameController => _nameController;
  List<Role> get roles => _role;

  Future<void> addUser(BuildContext context) async {
    final cancelButton = Align(
      alignment: Alignment.centerRight,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
            clear();
          },
          child: Icon(Icons.close)),
    );

    bool proside;
    MessageData? subUserData;
    var currentBusiness = Controllers.businessProvider(context).currentBusiness;
    //getting Email
    proside = await OpenDailovgWithAnimation(context,
        barriarDissmesible: false,
        curve: Curves.easeOut,
        dailog: AlertDialog(
          icon: cancelButton,
          title: const Text("Enter Phone Number"),
          content: CustomTextField(
            labelText: "Phone",
            format: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.digitsOnly
            ],
            textInputType: TextInputType.numberWithOptions(),
            validator: (v) {
              if (phoneController.text.isEmpty) {
                return null;
              }
              if (phoneController.text.trim().isNotEmpty) {
                return null;
              } else {
                return "Enter proper number";
              }
            },
            controller: phoneController,
          ),
          actions: [
            MyactionButton(
              action: () async {
                if (phoneController.text.trim().isNotEmpty) {
                  var resp = await _roleApi
                      .sendOtpToEmail(phoneController.text.trim());
                  if (resp.statusCode == 200) {
                    Navigator.pop(context, true);
                  } else {
                    MyHelper.mySnakebar(
                        context, "${resp.statusCode} ${resp.body}");
                  }
                } else {
                  MyHelper.mySnakebar(context, "Invalid Phone NUmber");
                }
              },
              lable: "Next",
            )
          ],
        ));

    //get Otp
    if (proside) {
      proside = await OpenDailovgWithAnimation(context,
          barriarDissmesible: true,
          animation: dailogAnimation.slidUp,
          dailog: AlertDialog(
            icon: cancelButton,
            title: const Text("Verify Otp"),
            content: SizedBox(
              height: SC.from_width(60),
              child: Pinput(
                length: 4,
                onChanged: (b) {
                  _otp = b;
                },
                onCompleted: (b) {
                  _otp = b;
                },
              ),
            ),
            actions: [
              MyactionButton(
                action: () async {
                  if (_otp?.length == 4) {
                    String bId = Controllers.businessProvider(context)
                            .currentBusiness
                            ?.id ??
                        "";
                    var resp = await _roleApi.verifyOtp(
                        phone: _phoneController.text.trim(),
                        otp: _otp ?? "",
                        businessId: bId);

                    // _log.i(resp.body);
                    print(resp.body);
                    if (resp.statusCode == 200) {
                      var decode = jsonDecode(resp.body);
                      var d = VerifySubUsersOtpApiResponse.fromJson(decode);
                      subUserData = d.message;

                      Navigator.pop(context, true);
                    } else {
                      var decode = jsonDecode(resp.body);
                      // _log.i("${resp.statusCode} \n ${resp.body}");
                      MyHelper.mySnakebar(context, "${decode["message"]}");
                    }
                  } else {
                    MyHelper.mySnakebar(context, "Enter Velid Otp");
                  }
                },
                lable: "Verify",
              )
            ],
          ));
    }

    if (proside) {
      String? selectedRoleId;
      await OpenDailovgWithAnimation(context,
          barriarDissmesible: false,
          dailog: AlertDialog(
            icon: cancelButton,
            title: const Text("Add a Member"),
            content: FutureBuilder<List<dynamic>?>(
              future: _roleApi.getUserRoleAndPermissons(
                  businessId: currentBusiness?.id ?? ""),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(child: CircularProgressIndicator()));
                }
                if (snap.hasError) {
                  return Center(
                    child: Text(
                      snap.error.toString(),
                    ),
                  );
                }

                if (snap.data?.isEmpty ?? true) {
                  return const Center(
                    child: Text("No Role Found"),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _phoneController.text,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 400,
                        child:
                            BusinessPermissionsUI(permissionsData: snap.data!)),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            if (rolePermissions.isEmpty) {
                              MyHelper.mySnakebar(context, "Select Role");
                              return;
                            }
                            log(rolePermissions.toString());
                            var resp = await _roleApi.assignPermssionsToUser(
                                businessId: currentBusiness?.id ?? "",
                                memberId: subUserData?.memberId ?? "",
                                permissions: rolePermissions ?? "");

                            if (resp.statusCode == 200) {
                              MyHelper.mySnakebar(
                                  context, "${resp.data["message"]}");
                              // Navigator.pop(context);
                              clear();
                              Controllers.subUserProvider(context)
                                  .lode(context);
                            } else {
                              MyHelper.mySnakebar(
                                  context, "${resp.statusCode}\n${resp.data}");
                            }
                          },
                          child: const Text("Add Member")),
                    ),
                  ],
                );
              },
            ),
          ));
    }

    clear();
  }

  clear() {
    _phoneController.clear();
    _nameController.clear();
    _passController.clear();
    _otp = null;
    _role = [];
  }
}

// Global variable to store permissions
List<Map<String, dynamic>> rolePermissions = [];

class BusinessPermissionsUI extends StatefulWidget {
  final List<dynamic> permissionsData;
  const BusinessPermissionsUI({Key? key, required this.permissionsData})
      : super(key: key);

  @override
  State<BusinessPermissionsUI> createState() => _BusinessPermissionsUIState();
}

class _BusinessPermissionsUIState extends State<BusinessPermissionsUI> {
  // Map to store available permissions per section
  Map<String, List<String>> availablePermissions = {};

  @override
  void initState() {
    super.initState();
    // Initialize rolePermissions with the same structure as input data
    // rolePermissions = List.from(widget.permissionsData);
    // Process the permissions data to build availablePermissions map
    _processPermissionsData();
  }

  void _processPermissionsData() {
    // Clear existing permissions
    availablePermissions.clear();

    // Process each permission entry
    for (var permissionMap in widget.permissionsData) {
      permissionMap.forEach((section, permissions) {
        if (permissions is List) {
          // Convert each permission to string and store in the map
          availablePermissions[section] =
              permissions.map((p) => p.toString()).toList();
        }
      });
    }
  }

  // Helper function to check if a permission is selected for a section
  bool isPermissionSelected(String section, String permission) {
    final sectionMap = rolePermissions.firstWhere(
      (element) => element.containsKey(section),
      orElse: () => {section: []},
    );
    return sectionMap[section]?.contains(permission) ?? false;
  }

  // Helper function to get selected permission for a section
  String? getSelectedPermissionForSection(String section) {
    final sectionMap = rolePermissions.firstWhere(
      (element) => element.containsKey(section),
      orElse: () => {section: []},
    );
    final permissions = sectionMap[section] ?? [];
    return permissions.isNotEmpty ? permissions.first : null;
  }

  // Function to update permissions with toggle functionality
  void updatePermission(String section, String permission) {
    setState(() {
      var sectionIndex =
          rolePermissions.indexWhere((element) => element.containsKey(section));

      if (sectionIndex == -1) {
        // If section doesn't exist, create it
        rolePermissions.add({section: []});
        sectionIndex = rolePermissions.length - 1;
      }

      // Check if the permission is already selected
      bool isCurrentlySelected = isPermissionSelected(section, permission);

      if (isCurrentlySelected) {
        // If selected, remove it (deselect)
        rolePermissions[sectionIndex][section] = [];
      } else {
        // If not selected, set it as the only permission
        rolePermissions[sectionIndex][section] = [permission];
      }
    });
  }

  String formatPermissionText(String text) {
    return text
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  Color _getBackgroundColor(int index) {
    return index.isEven ? Colors.grey.withOpacity(0.1) : Colors.white;
  }

  Widget _buildCustomRadio(String section, String permission) {
    bool isSelected = isPermissionSelected(section, permission);
    return InkWell(
      onTap: () => updatePermission(section, permission),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  // width: 12,
                  // height: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              )
            : null,
      ),
    );
  }

  List<DataRow> _buildDataRows() {
    List<DataRow> rows = [];
    int index = 0;

    for (var section in availablePermissions.keys) {
      // Add section header
      rows.add(
        DataRow(
          color: MaterialStateProperty.resolveWith(
            (states) => Colors.blue.withOpacity(0.1),
          ),
          cells: [
            DataCell(
              Text(
                section.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const DataCell(SizedBox()), // Empty cell for header
          ],
        ),
      );
      index++;

      // Add permission rows
      for (var permission in availablePermissions[section]!) {
        rows.add(
          DataRow(
            color: MaterialStateProperty.resolveWith(
              (states) => _getBackgroundColor(index),
            ),
            cells: [
              DataCell(
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    formatPermissionText(permission),
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
              DataCell(
                Center(
                  child: _buildCustomRadio(section, permission),
                ),
              ),
            ],
          ),
        );
        index++;
      }
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: SizedBox(
        child: SingleChildScrollView(
          child: DataTable(
            headingRowHeight: 50,
            dataRowHeight: 45,
            columnSpacing: 20,
            horizontalMargin: 12,
            columns: const [
              DataColumn(
                label: Text(
                  'SECTION/PERMISSION',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'SELECT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
            rows: _buildDataRows(),
          ),
        ),
      ),
    );
  }
}

// Example usage
// class ExampleScreen extends StatelessWidget {
//   const ExampleScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: BusinessPermissionsUI(),
//     );
//   }
// }
