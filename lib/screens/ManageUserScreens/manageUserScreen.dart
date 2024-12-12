import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/component/customBackground.dart';
import 'package:leadkart/controllers/addSubUserProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/screens/ManageUserScreens/manageuserTab.dart';
import 'package:leadkart/them/constents.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

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
    return CustomBackground(
      child: DefaultTabController(
          length: 2,

          child: Scaffold(



            floatingActionButton:kDebugMode?FloatingActionButton(
              onPressed: (){
                var b = Controllers.businessProvider(context,listen: false).currentBusiness;
                Logger().i("${b?.id}");
              },
            ):null,

            backgroundColor: Colors.transparent,
              appBar: AppBar(
                foregroundColor: Colors.black,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: const Text("Manage Users"),

                //TAb Bar
                // bottom: PreferredSize(
                //   preferredSize: Size.fromHeight(50),
                //   child: Container(
                //     padding: EdgeInsets.all(3),
                //     clipBehavior: Clip.hardEdge,
                //     margin: EdgeInsets.symmetric(horizontal: 30),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(50)
                //     ),
                //     child: TabBar(
                //       dividerColor: Colors.transparent,
                //       indicatorColor: AppConstent().secondaryColor,
                //
                //
                //   automaticIndicatorColorAdjustment: true,
                //         indicatorSize: TabBarIndicatorSize.tab,
                //         indicator: BoxDecoration(
                //           color: AppConstent().secondaryColor,
                //           borderRadius: BorderRadius.circular(50)
                //         ),
                //
                //         labelStyle: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.w700,
                //           fontSize: SC.from_width(12)
                //         ),
                //
                //         unselectedLabelStyle: TextStyle(
                //             color: Color.fromRGBO(128, 128, 128, 1),
                //             fontWeight: FontWeight.w700,
                //             fontSize: SC.from_width(12)
                //         ),
                //
                //         indicatorPadding: EdgeInsets.all(0),
                //         tabs: [
                //       Tab(
                //         text: "Manage Users ",
                //       ),
                //       Tab(
                //         text: "Roles and Permission",
                //       ),
                //     ]),
                //   ),
                // ),
                actions: [
                  Consumer<AddSubUserProvider>(
                      builder: (a, p, c) => IconButton(
                          onPressed: () => p.addUser(context),
                          icon: Icon(Icons.person_add,color: AppConstent().secondaryColor,)))
                ],
              ),
              body:ManageSubUserTab()
          )),
    );
  }
}
