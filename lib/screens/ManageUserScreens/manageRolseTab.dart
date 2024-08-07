import 'package:flutter/material.dart';
import 'package:leadkart/controllers/RolsAndPermisionProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

var fakeData =  [
  {
    "Roles&Permission": [
      "read",
      "write"
    ]
  },
  {
    "Leads": [
      "read",
      "write"
    ],
  },
  {
    "Ads": [
      "read",
      "write"
    ],
  },
  {
    "Ads": [
      "read",
      "write"
    ],
  }
];

class RolesAndPerTab extends StatelessWidget {
  const RolesAndPerTab({super.key});

  
  @override
  Widget build(BuildContext context) {

    Controllers.rolesAndPermProvider(context,listen: false).getAllPerm(context);

    return Consumer<RolesAndPermProvider>(
        builder: (a,p,c)=>RefreshIndicator(
          onRefresh:()=> p.getAllPerm(context),
          child: ListView(
            children: [
              ElevatedButton(onPressed: (){
              }, child: Text("Test")),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DataTable(
                columns: [
                  DataColumn(label: Text("Permission")),
                  DataColumn(label: Text("Read")),
                  DataColumn(label: Text("Write")),
                ],
                    rows: [
                      for(var data in p.rolesAndPer)
                        for(var key in data.keys)
                          DataRow(
                            cells: [
                              DataCell(Text(key.toString())),
                              DataCell(data[key].contains("read")?Icon(Icons.check,color: AppConstent().primeryColor,):const Icon(Icons.check,color: Colors.red,)),
                              DataCell(data[key].contains("write")?Icon(Icons.check,color: AppConstent().primeryColor,):const Icon(Icons.check,color: Colors.red,)),
                            ]
                          )
                    ]),
              )
            ],
          ),
        ),
    );
  }
}
