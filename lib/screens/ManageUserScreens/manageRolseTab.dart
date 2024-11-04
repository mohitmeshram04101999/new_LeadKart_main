import 'package:flutter/material.dart';
import 'package:leadkart/controllers/RolsAndPermisionProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

var fakeData = [
  {
    "Roles&Permission": ["read", "write"]
  },
  {
    "Leads": ["read", "write"],
  },
  {
    "Ads": ["read", "write"],
  },
  {
    "Ads": ["read", "write"],
  }
];

class RolesAndPerTab extends StatelessWidget {
  const RolesAndPerTab({super.key});

  @override
  Widget build(BuildContext context) {
    Controllers.rolesAndPermProvider(context, listen: false)
        .getAllPerm(context);

    return Consumer<RolesAndPermProvider>(
      builder: (a, p, c) => WillPopScope(
        onWillPop: () async {
          p.clear();
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () => p.getAllPerm(context),
          child: ListView(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () => p.createNewPermission(context),
                      child: const Text("Create Role"))),
              for (var data in p.rolesAndPer)
                Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  elevation: 3,
                  child: ListTile(
                    titleTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    title: Text("${data["roleName"]}"),
                    subtitle: DataTable(
                      dividerThickness: 0,
                      // dataRowColor: WidgetStateProperty.resolveWith((s)=>Colors.green.withOpacity(.1)),
                      columns: const [
                        DataColumn(label: Text("Permission")),
                        DataColumn(label: Text("Read")),
                        DataColumn(label: Text("Write")),
                      ],
                      rows: [
                        for (var per in data["permissions"])
                          for (String p in per.keys)
                            DataRow(cells: [
                              DataCell(Text(p)),
                              DataCell(per[p].contains("read")
                                  ? Icon(
                                      Icons.check,
                                      color: AppConstent().primeryColor,
                                    )
                                  : const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    )),
                              DataCell(per[p].contains("write")
                                  ? Icon(
                                      Icons.check,
                                      color: AppConstent().primeryColor,
                                    )
                                  : const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    )),
                            ])
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
