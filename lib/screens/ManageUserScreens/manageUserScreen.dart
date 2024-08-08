import 'package:flutter/material.dart';
import 'package:leadkart/component/subUser%20viewTile.dart';
import 'package:leadkart/controllers/SubUserProvider.dart';
import 'package:leadkart/controllers/addSubUserProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/animated%20dilog.dart';
import 'package:leadkart/screens/ManageUserScreens/manageRolseTab.dart';
import 'package:leadkart/screens/ManageUserScreens/manageuserTab.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';



class ManageUserScreen extends StatefulWidget {
  const ManageUserScreen({super.key});

  @override
  State<ManageUserScreen> createState() => _ManageUserScreenState();
}

class _ManageUserScreenState extends State<ManageUserScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(

        appBar: AppBar(
          title:const Text("Manage Users"),
          actions: [
            Consumer<AddSubUserProvider>(builder: (a,p,c)=>IconButton(onPressed:()=> p.addUser(context), icon: const Icon(Icons.person_add)))
          ],
          bottom:  TabBar(
            dividerColor: Colors.transparent,
            unselectedLabelColor: Colors.white,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
            labelPadding: const EdgeInsets.symmetric(vertical: 8),

            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),

            // labelStyle: TextStyle(
            //   color: Colors.
            // ),
            indicatorSize:TabBarIndicatorSize.tab,
            tabs:const  [
              Text("Mange Users"),
              Text("Roles and Permission"),
            ],
          ),
        ),


        body:const TabBarView(
          children: [
            ManageSubUserTab(),
            RolesAndPerTab(),
          ],
        )

    ));
  }
}




