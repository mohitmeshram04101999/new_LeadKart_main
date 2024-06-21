import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/business_pages/additional_detail.dart';
import 'package:leadkart/component/busines_reuseable_widget.dart';
import 'package:leadkart/component/custom_page_route.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/add_detail_screen.dart';
import 'package:leadkart/leads/create_add_setting.dart';
import 'package:leadkart/screens/user/create_user.dart';

class BusinessDetail extends StatefulWidget {
  const BusinessDetail({Key? key}) : super(key: key);

  @override
  State<BusinessDetail> createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {


  final List<Map<String, dynamic>> items = [
    {'name': 'Campaign Settings', 'icon': Icons.settings},
    {'name': 'Billing Details', 'icon': Icons.person},
    {'name': 'Payment & Invoices', 'icon': Icons.notifications},
    {'name': 'Manage Website', 'icon': Icons.message},
    {'name': 'Notification', 'icon': Icons.message},
    {'name': 'Logout', 'icon': Icons.message},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

     appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Business Detail',style: TextStyle(fontSize: SC.from_height(21)),),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: SC.from_height(14)),
          child: Column(
            children: [

              SizedBox(height: SC.from_height(22),),
              Container(
                padding: EdgeInsets.only(bottom: SC.fromWidth(26)),
                width: double.infinity,
                // height: SC.from_height(165),
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
                          Icon(Icons.edit,color: Color.fromRGBO(36, 238, 221, 1),size: SC.from_height(28),),
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
                      child: Image.asset('assets/img_1.png'),
                    ),
                    SizedBox(height: SC.from_height(12),),
                    Text('Pawan Kumar',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:SC.from_height(19) ),),

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
                              text: 'Amar Nagar, Shivpuri Bhopal Uttar Pradesh',
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
              ),

              SizedBox(height: SC.from_height(22),),

          //   Campaign Settings //
              ReuseableBusinesContainer(
                onTap: () {

                  Navigator.push(
                    context,
                    CustomPageRoute(page: AddCreation()),
                  );

                },
                child: Row(
                  children: [
                    SizedBox(width: SC.from_height(10)),
                    Icon(Icons.description, color: Colors.grey, size: SC.from_height(24)),
                    SizedBox(width: SC.from_height(10)),
                    Text(
                      'Campaign Settings',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: SC.from_height(16),
                      ),
                    ),
                  ],
                ),
              ),
           //    ReuseableBusinesContainer(
           //      onTap: () {
           //        Navigator.push(context, MaterialPageRoute(builder: (context) => AddCreation()));
           //      },
           //      child: Row(
           //        children: [
           //          SizedBox(width: SC.from_height(10)),
           //          Icon(Icons.description, color: Colors.grey, size: SC.from_height(24)),
           //          SizedBox(width: SC.from_height(10)),
           //          Text(
           //            'Campaign Settings',
           //            style: TextStyle(
           //              color: Colors.grey.shade700,
           //              fontWeight: FontWeight.w500,
           //              fontSize: SC.from_height(16),
           //            ),
           //          ),
           //        ],
           //      ),
           //    ),
              SizedBox(height: SC.from_height(11),),

              //Billing Details //
              ReuseableBusinesContainer(
                onTap: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(page: AddDetailScreen()),
                  );

                },
                child: Row(
                  children: [
                    SizedBox(width: SC.from_height(10)),
                    Icon(Icons.description, color: Colors.grey, size: SC.from_height(24)),
                    SizedBox(width: SC.from_height(10)),
                    Text(
                      'Billing Details ',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: SC.from_height(16),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: SC.from_height(11),),

              //Payment & Invoices //
              ReuseableBusinesContainer(

                onTap: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(page: CreateUser()),
                  );

                },

                child: Row(
                  children: [
                    SizedBox(width: SC.from_height(10)),
                    Icon(Icons.description, color: Colors.grey, size: SC.from_height(24)),
                    SizedBox(width: SC.from_height(10)),
                    Text(
                      'Payment & Invoices ',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: SC.from_height(16),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: SC.from_height(11),),

              // Manage Website //
              ReuseableBusinesContainer(

                onTap: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(page: AdditionalDetail()),
                  );

                },

                child: Row(
                  children: [
                    SizedBox(width: SC.from_height(10)),
                    Icon(Icons.blur_circular_sharp, color: Colors.grey, size: SC.from_height(24)),
                    SizedBox(width: SC.from_height(10)),
                    Text(
                      'Manage Website  ',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: SC.from_height(16),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: SC.from_height(11),),

              // Notification //
              ReuseableBusinesContainer(
                onTap: () {
                  // Navigator.push(
                  //   context, CustomPageRoute(page: AdditionalDetail()),
                  // );

                },
                child: Row(
                  children: [
                    SizedBox(width: SC.from_height(10)),
                    Icon(Icons.notifications, color: Colors.grey, size: SC.from_height(24)),
                    SizedBox(width: SC.from_height(10)),
                    Text(
                      'Notification ',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: SC.from_height(16),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: SC.from_height(11),),

              // Logout  //
              ReuseableBusinesContainer(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   CustomPageRoute(page: AdditionalDetail()),
                  // );

                },
                child: Row(
                  children: [
                    SizedBox(width: SC.from_height(10)),
                    Icon(Icons.logout, color: Colors.grey, size: SC.from_height(24)),
                    SizedBox(width: SC.from_height(10)),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: SC.from_height(16),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: SC.from_height(22),),

            ],
          ),
        ),
      ),
    );
  }
}
