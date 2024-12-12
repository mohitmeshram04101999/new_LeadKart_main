
import 'dart:ffi';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leadkart/component/customBackground.dart';import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/screens/ManageUserScreens/manageUserScreen.dart';import 'package:leadkart/them/constents.dart';
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/controllerInstances.dart';import 'package:leadkart/them/constents.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:leadkart/business_pages/additional_detail.dart';
import 'package:leadkart/component/busines_reuseable_widget.dart';

import 'package:leadkart/component/custom_page_route.dart';
import 'package:leadkart/controllers/businessProvider.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/leads/adddetail/add_detail_screen.dart';
import 'package:leadkart/leads/create_add_setting.dart';
import 'package:leadkart/leads/digital_ads_package.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:leadkart/screens/BssnesseditScreen/EditBussnesScreen.dart';
import 'package:leadkart/screens/user/create_user.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BusinessDetail extends StatefulWidget {
  const BusinessDetail({Key? key}) : super(key: key);

  @override
  State<BusinessDetail> createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {




  final List<Map<String, dynamic>> items = [
    // {'name': 'Campaign Settings', 'icon': Icons.settings,"page":const AddCreation()},
    // {'name': 'Billing Details', 'icon': Icons.person,"page": const  AddDetailScreen(adId: "",)},
    // {'name': 'Payment & Invoices', 'icon': Icons.notifications,"page": const CreateUser()},
    // {'name': 'Manage Website', 'icon': Icons.web,"page": const AdditionalDetail()},
    // {'name': 'Notification', 'icon': Icons.notifications,"page": const DigitalAdsPackage()},
    {'name': 'User, Roles & Permissions', 'icon': Icons.personal_injury,"page":const ManageUserScreen()},
    {'name': 'Terms & Conditions', 'icon': FontAwesomeIcons.compassDrafting,"page":null},
    {'name': 'Privacy Policy', 'icon': Icons.privacy_tip,"page":null},
    {'name': 'Refund Policy', 'icon': Icons.privacy_tip,"page":null},
    // {'name': 'Support', 'icon': Icons.support_agent_outlined,"page":null},
    {'name': 'Contact us', 'icon': Icons.call,"page":null},
    // {'name': 'Share App', 'icon': Icons.share,"page":null},
    // {'name': 'Designs', 'icon': Icons.view_carousel_outlined,"page":null},
    {'name': 'Logout', 'icon': Icons.logout},

  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
      
       appBar:  AppBar(
          foregroundColor: Colors.black,
          backgroundColor:Colors.transparent,
          centerTitle: true,
          title: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Text('Business Detail',style: TextStyle(fontSize: SC.from_height(21),fontWeight: FontWeight.w700),)),
        ),
      
        body: SingleChildScrollView(
          child: Padding(
            padding:   EdgeInsets.symmetric(horizontal: SC.from_height(14)),
            child: Column(
              children: [
      
      
                // Text("{${Controllers.editBusinessProvider(context,listen: false).businessNameController.text}}"),
                //ProFileBox
                SizedBox(height: SC.from_height(22),),
      
            Consumer<BusinessProvider>(builder: (a,p,c)=>Container(
              padding: EdgeInsets.only(bottom: SC.fromWidth(26)),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                // borderRadius: BorderRadius.circular(SC.from_height(10)),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.shade300, // Shadow color
                //     spreadRadius: 1, // Spread radius
                //     blurRadius: 5, // Blur radius
                //     offset: Offset(0, 1), // Offset in x and y direction
                //   ),
                // ],
              ),
      
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  SizedBox(height: SC.from_width(40),),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    width: SC.from_height(100),
                    height: SC.from_height(100),
                    child:
                    Stack(
                      children: [
                        p.currentBusiness?.businessImage==null?
                       Positioned(
                         top: 0,bottom: 0,left: 0,right: 0,
                           child:  Container(

                           height: double.infinity,
                           decoration:BoxDecoration(
                               shape: BoxShape.circle,
                               border: Border.all(
                                   color: Colors.white,
                                   width: 2
                               )
                           ),
                           child: CircleAvatar(backgroundColor: Colors.blue,child: Icon(CupertinoIcons.person_alt,size: 25,),))):Positioned(
                          top: 0,left: 0,right: 0,bottom: 0,
                             child: Container(
                               // padding: EdgeInsets.all(8),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 0
                                  )
                              ),
                              child: Image.network(p.currentBusiness?.businessImage??"",fit: BoxFit.cover,)),
                           ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: (){
                              RouteTo(context, child:(a,b)=> EditBusinessScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              child: Icon(FontAwesomeIcons.edit,color: Colors.white,),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border.all(
                                    width: 1,
                                    color: Colors.white
                                ),
                                borderRadius: BorderRadius.circular(5),

                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
      
                  SizedBox(height: SC.from_height(12),),
                  Text('${p.currentBusiness?.businessName??"Guest"}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize:SC.from_height(20) ),),
                  SizedBox(height: SC.from_width(30),)
      
                ],
              ),
            )),
      
      
      
                //List Of Option
                for(var i  in items)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ReuseableBusinesContainer(
                        onTap: (){
      
      
                          if(i["name"]=="Contact us")
                          {
                            String url = "tel: +917007892427";
                            launch(url);
                          }
      
      
                          if(i["name"]=="Privacy Policy")
                          {
                            print("in");
                            String url = "https://www.freeprivacypolicy.com/live/58f3de93-84fc-4b26-95ae-ff312f7bf298?fbclid=IwY2xjawE-bpNleHRuA2FlbQIxMAABHdHuyLGJbFqHU4ZdJeF6Hq-3qB-zxdJxLJ0SB7UVXVQA4gD_at3WtQPqjg_aem_7U9Djgx6priZoO8CsQjJ7Q ";
                            launchUrl(Uri.parse(url));
                          }
      
                          if(i["page"]!=null)
                          {
                            Navigator.push(context,CustomPageRoute(page: i["page"]));
                          }
                          if(i["name"]=="Logout")
                          {
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                title: Text("Are you sure you want to logout?"),
                                actions: [
                                  TextButton(onPressed: (){
                                    Controllers.authController.logOut(context);
                                    context.pop();
                                  }, child: Text("Yes", style: TextStyle(color: Colors.redAccent, fontSize: SC.fromContextWidth(context, 20)))),
                                  TextButton(onPressed: (){
                                    context.pop();
                                  }, child: Text("No", style: TextStyle(
                                      fontSize: SC.fromContextWidth(context, 20)
                                  ),)),
                                ],
                              );
                            },);
                          }
      
      
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 10,),
                            Icon(i["icon"],color: AppConstent().secondaryColor, size: SC.from_height(24)),
                            const SizedBox(width: 10,),
                            Text(i["name"],style:TextStyle(

                              fontWeight: FontWeight.w700,
                              fontSize: SC.from_height(20),
                            )),
                          ],
                        )
                    ),
                  ),
      
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
