import 'package:animations/animations.dart';
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:getwidget/components/button/gf_button.dart';

import 'package:flutter/material.dart';
import 'package:leadkart/component/BussneCategoryTile.dart';
import 'package:leadkart/component/HelpButtonWhite.dart';
import 'package:leadkart/component/addRequirmentTile.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/component/custom_page_route.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/screens/user/follow_up_data.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

class CreateBusinessScreen extends StatefulWidget {
  const CreateBusinessScreen({Key? key}) : super(key: key);

  @override
  State<CreateBusinessScreen> createState() => _CreateBusinessScreenState();
}

class _CreateBusinessScreenState extends State<CreateBusinessScreen> {
  TextEditingController textEditingController = TextEditingController();


  // List of category names
  final List<String> categoryNames = [
    'Art & Entertainment',
    'Business',
    'Education',
    'Health',
    'Technology',
    'Travel',
    'Food & Beverage',
    'Fashion',
    'Sports',
    'Muisc',
    'Dance',
    'Sports',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controllers.bussnissCategoryProvider(context,listen: false).lode(context);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppConstent().primeryColor,
        title: Text('Busines Category',),
        actions: [

          HelpButtonWhite(),
           SizedBox(width: SC.from_height(20)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
        child: ListView(
          children: [
            SizedBox(height: SC.from_height(15),),

            Padding(
              padding:   EdgeInsets.symmetric(horizontal:SC.from_height(0) ),
              child: Text('What’s your Business',style: TextStyle(fontSize: SC.from_height(19.5),fontWeight: FontWeight.w500,color: Colors.grey.shade700),),
            ),
            SizedBox(height: SC.from_height(7),),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal:SC.from_height(0) ),
              child: Text('Let us know which of the following describe the  business',style: TextStyle(fontSize: SC.from_height(17),color: Colors.grey.shade700),),
            ),

            SizedBox(
              height: SC.from_height(18),
            ),

            // Busines Name //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(0)),
              child:     CustomTextField(
                controller: Controllers.createBusinessProvider(context,listen: false).businessNameController,
                labelText: 'Busines Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
            ),
            SizedBox(height: SC.from_height(18),),

            // Select business category //
            Padding(
              padding:   EdgeInsets.symmetric(horizontal:SC.from_height(0) ),
              child: Text('Select business category',style: TextStyle(fontSize: SC.from_height(18),fontWeight: FontWeight.w600),),
            ),

            SizedBox(height: SC.from_height(15),),

            //  SELECT BUSINESS CATEGORY //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(0)),
              child: TextFormField(

                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: 'Select busines category',
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade700,), // Add search icon// Adjust padding
                  filled: true,
                  fillColor: Colors.white, // Optional: Set background color of the text field
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  if (value.length < 2) {
                    return 'Name must be at least 2 characters long';
                  }
                  if (value.length > 50) {
                    return 'Name must be less than 50 characters';
                  }
                  final nameExp = RegExp(r"^[a-zA-Z\s\-']+$");
                  if (!nameExp.hasMatch(value)) {
                    return 'Name contains invalid characters';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),

            SizedBox(height: SC.from_height(15),),


            // Grid of containers
            Consumer<BussnissCategoryProvider>(builder: (a,p,c){
              if(p.loding)
                {
                  return Center(child: CircularProgressIndicator());
                }
              return GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: SC.fromHeight(8),
                  crossAxisSpacing: SC.from_height(15),
                  mainAxisSpacing: SC.from_height(15),
                  // childAspectRatio: (SC.from_width(50) / SC.from_height(80)), // Adjust the aspect ratio as needed
                ),

                //Childredn
                children: [

                  for(var i in p.allCategory)
                    BussneCategoryTile(category: i,onTap: (){
                      Controllers.createBusinessProvider(context,listen: false).setCategoryId(i,context);
                      p.upDate();
                      },)

                ],

              );
            }),

            SizedBox(height: SC.from_height(25),),



            // GFBUTTON //

            CustomButton(
              text: 'Next', onPressed: () {
              // context.pushNamed("homePage");
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> FollowUpDate()));

              Navigator.push(
                context,
                CustomPageRoute(page: FollowUpDate()),
              );

            },
            ),


            SizedBox(height: SC.from_height(20),),

          ],
        ),
      ),
    );
  }
}
