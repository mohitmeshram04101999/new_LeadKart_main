import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:leadkart/component/HelpButtonWhite.dart';
import 'package:leadkart/component/addRequirmentTile.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/screens/user/follow_up_data.dart';

class BusinesCategory extends StatefulWidget {
  const BusinesCategory({Key? key}) : super(key: key);

  @override
  State<BusinesCategory> createState() => _BusinesCategoryState();
}

class _BusinesCategoryState extends State<BusinesCategory> {


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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Busines Category',),
        actions: [

          HelpButton(),
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
              child: TextFormField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide:
                    BorderSide(color: Colors.grey), // Set border color
                  ),
                  labelText: 'Busines Name', // Add label text
                  labelStyle:
                  TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(16)), // Customize label text style
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SC.from_height(12),
                      horizontal: SC.from_height(10)), // Adjust padding
                  filled: true,
                  fillColor: Colors
                      .white, // Optional: Set background color of the text field
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide:
                    BorderSide(color: Colors.grey), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(
                        color: Colors.grey), // Set border color when focused
                  ),
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
                  hintStyle: TextStyle(fontSize: SC.from_height(16.5),color: Colors.grey.shade700),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(color: Colors.grey), // Set border color
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade700,), // Add search icon
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SC.from_height(12),
                      horizontal: SC.from_height(10)), // Adjust padding
                  filled: true,
                  fillColor: Colors.white, // Optional: Set background color of the text field
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(color: Colors.grey), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(color: Colors.grey), // Set border color when focused
                  ),
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
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: SC.fromHeight(8),
                crossAxisSpacing: SC.from_height(15),
                mainAxisSpacing: SC.from_height(15),
                // childAspectRatio: (SC.from_width(50) / SC.from_height(80)), // Adjust the aspect ratio as needed
              ),
              itemCount: categoryNames.length, // Number of containers you want to display
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: SC.from_height(50),
                        height: SC.from_height(40),
                        child: Image.asset('assets/edit.png'),
                      ),
                      SizedBox(height: SC.from_height(10)),
                      Text(
                        categoryNames[index], // Use the name from the list
                        style: TextStyle(color: Colors.grey.shade700, fontSize: SC.fromWidth(30)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: SC.from_height(25),),



            // GFBUTTON //

            CustomButton(
              text: 'Next', onPressed: () {
              // context.pushNamed("homePage");
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FollowUpDate()));
            },
            ),


            SizedBox(height: SC.from_height(20),),

          ],
        ),
      ),
    );
  }
}
