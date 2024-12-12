import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leadkart/ApiServices/adsApi.dart';
import 'package:leadkart/Models/ad_type_model.dart';
import 'package:leadkart/component/addRequirmentTile.dart';
import 'package:leadkart/component/customAppBar.dart';
import 'package:leadkart/component/customBackground.dart';
import 'package:leadkart/component/flatIconns.dart';
import 'package:leadkart/component/helpButton.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/shimmers.dart';
import 'package:leadkart/them/constents.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> items = [
    {'image': 'assets/home_images/img_1.png', 'text': 'AI Meta content'},
    {'image': 'assets/img.png', 'text': 'AI created Ads'},
    {'image': 'assets/home_images/img_2.png', 'text': 'Leads'},
    {'image': 'assets/home_images/img_5.png', 'text': 'Ad Reports'},
  ];

  List<IconData> iconList = [
    Icons.groups,
    Icons.home,
    Icons.call_outlined,
    Icons.facebook,
    Icons.account_circle,
    Icons.mail_outline,
    // Add more icons as needed
  ];

  Map<String, Widget> iconsfor = {
    "667a7c6df68bde8bec7ad3a8": FlatIcon(
      icon: FlatIcons.whatsApp,
      size: 20,
    ),
    "667a7c6df68bde8bec7ad3aa": FlatIcon(icon: FlatIcons.web, size: 20),
    "667a7c6df68bde8bec7ad3a7": FlatIcon(icon: FlatIcons.people, size: 20),
    "667a7c6df68bde8bec7ad3ab": FlatIcon(icon: FlatIcons.playStore, size: 20),
    "667a7c6df68bde8bec7ad3a9": FlatIcon(icon: FlatIcons.call, size: 20)
  };

  List<Map<String, String>> newAdd = [
    {"scImage":"assets/add_images/lead2.png","addMAinImage":"assets/add_images/add0.png", "title": "Ai Meta content"},
    {"scImage":"assets/add_images/aiGen.gif","addMAinImage":"assets/add_images/add01.png", "title": "Ai Ad Generation "},
    {"scImage":"assets/add_images/lead.gif","addMAinImage":"assets/add_images/add1.png", "title": "Leads "},
    {"scImage":"assets/add_images/AD.gif","addMAinImage":"assets/add_images/add4.png", "title": "Ad Report"},
  ];

  String? dropdownValue;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _addTypeLoading = addTypeLoading();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Logger().t("THis is Will Pop ");

        bool satet = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Are you sure?"),
              content: const Text("Do you want to exit an App"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text("Yes")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text("No")),
              ],
            );
          },
        );
        return satet;
      },
      child: CustomBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
        
          floatingActionButton: (kDebugMode)
              ? FloatingActionButton(
                  onPressed: () {
                    var b =
                        Controllers.businessProvider(context).currentBusiness;
                    Logger().i(b?.toMap());
                  },
                )
              : null,
        
          //AppbBar
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomAppBar(
                trailingButton: HelpButton(
                  onTap: () {
                    launch("tel: +917007892427");
                  },
                ),
                // trailingButton: HelpButton(
                //   onTap: (){
                //     // context.pushNamed("helpScreen");
                //     RouteTo(context, child: (a,b)=>const HelpScreen());
                //   },
                // ),
              )),
        
          //Body
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: SC.from_height(18)),
            children: [
              // SelectPlanTile(),
        
              SizedBox(
                height: SC.from_height(15),
              ),
        
              // Text(
              //   'Introducing AI-powered ads with Leadkart',
              //   style: TextStyle(
              //     fontSize: SC.fromWidth(22),
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
        
              SizedBox(
                height: SC.from_height(8),
              ),
        
              // GRIDVIEW BUILDER //
              GridView.builder(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: SC.from_width(7),
                  crossAxisSpacing:SC.from_width(13),
                  mainAxisExtent: SC.from_width(150),
                ),
                itemCount: newAdd.length,
                itemBuilder: (context, index) {
                  final _item = newAdd[index];
        
                  return Expanded(
                      child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 6,top: 8),
                            // alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            width: double.infinity,
                            height: SC.from_width(111),
                            child: Stack(
                              children: [
                                Expanded(child: Align(
                                  alignment: Alignment.bottomLeft,
                                    child: Image.asset(_item["addMAinImage"]??""))),
                                Align(
                                  alignment: Alignment.topRight ,
                                    child: Container(height: 60,width: 60,
                                    child: Image.asset(_item["scImage"]??""),))
                              ],
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text("${_item["title"]}",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(16)
                          ),)
                        ],
                      )
                    ],
                  ));
                },
              ),
              SizedBox(
                height: SC.from_height(15),
              ),
        
              // Container(
              //   clipBehavior: Clip.hardEdge,
              //   // width: SC.fromWidth(50),
              //   // height: SC.from_height(200),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(SC.from_height(8)),
              //   ),
              //   child: Image.asset(
              //     'assets/home_images/img_3.png',
              //     fit: BoxFit.cover,
              //   ),
              // ),
        
              SizedBox(
                height: SC.from_height(15),
              ),
        
              InkWell(
                onTap: () {
                  launch("tel: +917007892427");
                },
                child: Image.asset(
                  'assets/home_images/4.png',
                  fit: BoxFit.cover,
                ),
              ),
        
        
              // Assesmeng Container
              Container(
                height: 132,
                padding: EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromRGBO(199, 224 , 254, 1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Need assistance with lead generation?",style: TextStyle(fontWeight: FontWeight.w700,fontSize: SC.from_width(16)),),
                    Text("Need assistance with lead generation?",style: TextStyle(fontWeight: FontWeight.w700,fontSize: SC.from_width(14),color: Color.fromRGBO(129, 129, 129, .7)),),
                    SizedBox(height: SC.from_width(24),),
                    ElevatedButton(onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor:WidgetStateProperty.resolveWith((states) => Colors.white,),
                          foregroundColor:WidgetStateProperty.resolveWith((states) => Colors.black,),
                          padding: WidgetStateProperty.resolveWith((states) => EdgeInsets.symmetric(horizontal: 8),),
                          shape: WidgetStateProperty.resolveWith((states) =>RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),)
                        ),
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.call_outlined),
                        Text("Call Now"),
                      ],
                    ))
                  ],
                ),
              ),
        
              SizedBox(
                height: SC.from_height(19),
              ),
        
              Text(
                'Choose your Ad requirement',
                style: TextStyle(
                    fontSize: SC.from_height(18),
                    fontWeight: FontWeight.w500),
              ),
        
              SizedBox(
                height: SC.from_height(15),
              ),
        
              // CHOOSE ADD REQUIREMENT //
              FutureBuilder<dynamic>(
                  future: AdsApi().getAllAdvertisementTypes(),
        
                  //
                  builder: (context, snapshot) {
                    //
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return _addTypeLoading;
                    }
        
                    //
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }
        
                    //
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text("Not Data Found"),
                      );
                    }
        
                    //
                    final data =
                        snapshot.data! as List<AdvertisementTypeModel>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      // itemCount: 5,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = data[index];
                        // final item = AdvertisementTypeModel(id: "0", title: "Get leads from social platforms", description: "Leverage social media platforms to effectively generate and capture high-quality leads for your business.", isInstagram:false, isFacebook: false, isGoogle: false, advertisementType: "advertisementType", minimumBudget: 0, disable: false, version: 1, createdAt: "createdAt", updatedAt: "updatedAt");
                        return Container(
                          margin: EdgeInsets.only(
                              top: SC.from_height(15),
                              left: SC.from_height(2),
                              right: SC.from_height(2)),
                          width: double.infinity,
                          // height: SC.from_height(85),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 243, 243, 1),
                            // border: Border.all(),
                            borderRadius:
                                BorderRadius.circular(SC.from_height(16)),
                          ),
                          child: AddREquirmentTile(
                            advertisementTypeModel: item,
                            icon: iconsfor[item.id] ?? const SizedBox(),
                          ),
                        );
                      },
                    );
                  }),
        
              SizedBox(
                height: SC.from_height(20),
              ),
        
              // Container(
              //     // height: SC.from_height(134),
              //     clipBehavior: Clip.hardEdge,
              //     decoration:
              //         BoxDecoration(borderRadius: BorderRadius.circular(10)),
              //     child: Image.asset(
              //       'assets/home_images/img_4.png',
              //       fit: BoxFit.cover,
              //     )),
        
              SizedBox(
                height: SC.from_height(20),
              ),
        
              SizedBox(
                height: SC.from_height(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
