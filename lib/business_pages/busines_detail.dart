
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:leadkart/business_pages/additional_detail.dart';
import 'package:leadkart/component/busines_reuseable_widget.dart';

import 'package:leadkart/component/custom_page_route.dart';
import 'package:leadkart/controllers/businessProvider.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/adddetail/add_detail_screen.dart';
import 'package:leadkart/leads/create_add_setting.dart';
import 'package:leadkart/leads/digital_ads_package.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:leadkart/screens/BssnesseditScreen/EditBussnesScreen.dart';
import 'package:leadkart/screens/user/create_user.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

class BusinessDetail extends StatefulWidget {
  const BusinessDetail({Key? key}) : super(key: key);

  @override
  State<BusinessDetail> createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {




  final List<Map<String, dynamic>> items = [
    {'name': 'Campaign Settings', 'icon': Icons.settings,"page":const AddCreation()},
    {'name': 'Billing Details', 'icon': Icons.person,"page": const  AddDetailScreen()},
    {'name': 'Payment & Invoices', 'icon': Icons.notifications,"page": const CreateUser()},
    {'name': 'Manage Website', 'icon': Icons.web,"page": const AdditionalDetail()},
    {'name': 'Notification', 'icon': Icons.notifications,"page": const DigitalAdsPackage()},
    {'name': 'Logout', 'icon': Icons.logout},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

     appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppConstent().primeryColor,
        title: Text('Business Detail',style: TextStyle(fontSize: SC.from_height(21)),),
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(SC.from_height(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300, // Shadow color
                  spreadRadius: 1, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 1), // Offset in x and y direction
                ),
              ],
            ),

            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:   EdgeInsets.only(top: SC.from_height(10),right:SC.from_height(10) ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (){
                          RouteTo(context, child:(a,b)=> EditBusinessScreen());
                        },
                         icon:  Icon(Icons.edit,color: Color.fromRGBO(36, 238, 221, 1),size: SC.from_height(28),)

                      ),
                    ],
                  ),
                ),


                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SC.from_height(55))
                  ),
                  clipBehavior: Clip.hardEdge,
                  width: SC.from_height(58),
                  height: SC.from_height(58),
                  child: p.currentBusiness?.businessImage==null?
                  CircleAvatar(child: Icon(CupertinoIcons.person_alt,size: 25,),):Image.network(p.currentBusiness?.businessImage??"",fit: BoxFit.cover,),
                ),

                SizedBox(height: SC.from_height(12),),
                Text('${p.currentBusiness?.businessName??"Guest"}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:SC.from_height(19) ),),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SC.from_height(28)),
                  child: RichText(overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Address : ',
                          style: TextStyle(
                            color: Color.fromRGBO(36, 238, 221, 1), // Different color for the label
                            fontSize: SC.from_height(17),
                          ),
                        ),
                        TextSpan(
                          text: p.currentBusiness?.address??"",
                          style: TextStyle(
                            color: Colors.black, // Color for the rest of the text
                            fontSize: SC.from_height(15),

                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )),



              //List Of Option
              for(var i  in items)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ReuseableBusinesContainer(
                      onTap: (){
                        if(i["page"]!=null)
                        {
                          Navigator.push(context,CustomPageRoute(page: i["page"]));
                        }
                        if(i["name"]=="Logout")
                          {

                          }
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          Icon(i["icon"],color: Colors.grey, size: SC.from_height(24)),
                          const SizedBox(width: 10,),
                          Text(i["name"],style:TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                            fontSize: SC.from_height(16),
                          )),
                        ],
                      )
                  ),
                ),


            ],
          ),
        ),
      ),
    );
  }
}
