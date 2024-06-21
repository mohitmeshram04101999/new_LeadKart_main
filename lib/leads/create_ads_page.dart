import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/add_images/campaign_setting_page.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';

class CreateAds extends StatefulWidget {
  const CreateAds({Key? key}) : super(key: key);

  @override
  State<CreateAds> createState() => _CreateAdsState();
}

class _CreateAdsState extends State<CreateAds> {
  bool lights = false;
  void _updateUserApi(String fromTime, String toTime, String isContact) {
    // Placeholder for your update user API call
    print(
        'Updating user with fromTime: $fromTime, toTime: $toTime, isContact: $isContact');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Create an Ad',style: TextStyle( fontSize: SC.from_height(21) ),)
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
        children: [
          SizedBox(
            height: SC.from_height(15),
          ),

          // SELECT CAMPAIGN   DROPDOWN//
          Container(
            width: double.infinity,
            height: SC.from_height(45),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(SC.from_height(7)),
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: InputBorder.none, // Remove the default underline
                contentPadding: EdgeInsets.symmetric(
                    horizontal: SC.from_height(10)), // Adjust padding
                hintText: 'Select Campaign',
                hintStyle: TextStyle(fontSize:SC.from_height(16),color: Colors.grey.shade700 )// Add hint text
              ),
              items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle change
              },
              icon: Transform.rotate(
                angle: 1.5708, // 90 degrees in radians (π/2 or 1.5708 radians)
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black.withOpacity(0.8),
                  size: SC.from_height(17),
                ),
              ),
            ),
          ),
          SizedBox(
            height: SC.from_height(15),
          ),

          // SELECT AN IMAGE //
          DottedBorder(
            strokeWidth: 1,
            dashPattern: [8],
            color: Colors.grey,
            child: Container(
              width: double.infinity,
              height: SC.from_height(210),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(SC.from_height(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: SC.from_height(30),
                    height: SC.from_height(30),
                    child: Image.asset('assets/create.png'),
                  ),
                  SizedBox(
                    width: SC.from_height(15),
                  ),
                  Text(
                    'Select an Image',
                    style: TextStyle(
                        color: Colors.grey, fontSize: SC.from_height(17),fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: SC.from_height(15),
          ),

          // TITILE //
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
                labelText: 'Title', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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
          SizedBox(
            height: SC.from_height(15),
          ),

          // CAPTION //
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SC.from_height(0)), // Adjust padding if needed
            child: TextFormField(
              cursorColor: Colors.grey,
              maxLines: null, // Allow multiline input
              keyboardType: TextInputType.multiline, // Allow multiline keyboard
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey), // Set border color
                ),
                labelText: 'Caption', // Add label text
                labelStyle:
                TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)),
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

          // AI SUGGESTED   //
          SizedBox(
            height: SC.from_height(15),
          ),
          Container(
            width: double.infinity,
            // height: SC.from_height(100),
            decoration: BoxDecoration(
                color: Color.fromRGBO(236, 253, 243, 0.5),
                borderRadius: BorderRadius.circular(
                  SC.from_height(5),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: SC.from_height(10), left: SC.from_height(15)),
                  child: Text('AI Suggested Caption',
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: SC.from_height(16),
                          fontWeight: FontWeight.w500)),
                ),
                ListTile(
                    title: Text(
                      'Order tastiest momos in Bhopal.',
                      style: TextStyle(
                          color: Colors.grey, fontSize: SC.from_height(15),fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Click on Link now',
                      style: TextStyle(
                          color: Colors.grey, fontSize: SC.from_height(15),fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      'Add',
                      style: TextStyle(
                          color: Color.fromRGBO(36, 238, 221, 1),
                          fontSize: SC.from_height(16),fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          ),

          SizedBox(
            height: SC.from_height(15),
          ),


          // ANDROID SWITCH //
          Row(
            children: [
              Text(
                'Call to Action',
                style: TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(19),fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: SC.from_height(10),
              ),
              Center(
                child: SwitchTheme(
                  data: SwitchThemeData(
                    thumbColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.white; // Active thumb color
                      }
                      return Colors.blue; // Inactive thumb color
                    }),
                    trackColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.blue; // Active track color
                      }
                      return Colors.white; // Inactive track color
                    }),
                  ),
                  child: Switch(
                    value: lights,
                    onChanged: (bool value) {
                      setState(() {
                        lights = value;
                      });

                      _updateUserApi('08:00', '17:00', value ? "1" : "0"); // Replace '08:00' and '17:00' with your actual times
                    },
                  ),
                ),
              ),

            ],
          ),

          //  CALL TO ACTION  DROPDOWN//
          SizedBox(
            height: SC.from_height(15),
          ),
          Container(
            width: double.infinity,
            height: SC.from_height(45),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(SC.from_height(7)),
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: InputBorder.none, // Remove the default underline
                contentPadding: EdgeInsets.symmetric(
                    horizontal: SC.from_height(10)), // Adjust padding
                hintText: 'Select a Call to Action',
                hintStyle: TextStyle(fontSize:SC.from_height(15) ,color: Colors.grey.shade700)// Add hint text
              ),
              items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle change
              },
              icon: Transform.rotate(
                angle: 1.5708, // 90 degrees in radians (π/2 or 1.5708 radians)
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black.withOpacity(0.8),
                  size: SC.from_height(17),
                ),
              ),
            ),
          ),

          // DESTINATION URL   DROPDOWN//
          SizedBox(
            height: SC.from_height(15),
          ),
          Container(
            width: double.infinity,
            height: SC.from_height(45),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(SC.from_height(7)),
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: InputBorder.none, // Remove the default underline
                contentPadding: EdgeInsets.symmetric(
                    horizontal: SC.from_height(10)), // Adjust padding
                hintText: 'Destination URL', // Add hint text
                hintStyle: TextStyle(fontSize:SC.from_height(15),color: Colors.grey.shade700 )
              ),
              items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle change
              },
              icon: Transform.rotate(
                angle: 1.5708, // 90 degrees in radians (π/2 or 1.5708 radians)
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black.withOpacity(0.8),
                  size: SC.from_height(17),
                ),
              ),
            ),
          ),

          SizedBox(
            height: SC.from_height(15),
          ),

          // ADD AUDIENCEE //
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(SC.from_height(7)),
            ),
            width: double.infinity,
            // height: SC.from_height(100),
            height: SC.fromHeight(8.2),
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(SC.from_height(7)),
                      ),
                      width: double.infinity,
                      height: SC.from_height(55),
                      child: Row(
                        children: [
                          SizedBox(
                              width: SC.from_height(
                                  10)), // Optional: Add some space before the chip
                          Chip(
                            label: Text(
                              'Food Shopper',
                              style: TextStyle(color: Colors.grey.shade700,fontSize:SC.from_height(15) ),
                            ),
                            backgroundColor:
                            Colors.white, // Customize chip background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SC.from_height(
                                      15)), // Match container border radius
                              side: BorderSide(
                                  color: Colors
                                      .grey), // Optional: Match container border color
                            ),

                            // Optional: Add an icon to the chip
                            onDeleted: () {
                              // Handle chip deletion or button click action
                              print('Chip button pressed');
                            },
                            deleteIcon: Icon(Icons.cancel,
                                color: Colors
                                    .grey), // Optional: Customize delete icon
                            deleteButtonTooltipMessage:
                            'Remove', // Tooltip for the delete button
                          ),
                          SizedBox(width: SC.from_height(10)),
                          Chip(
                            label: Text(
                              'Retailer',
                              style: TextStyle(color: Colors.grey.shade700,fontSize:SC.from_height(15) ),
                            ),
                            backgroundColor:
                            Colors.white, // Customize chip background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SC.from_height(
                                      15)), // Match container border radius
                              side: BorderSide(
                                  color: Colors
                                      .grey), // Optional: Match container border color
                            ),

                            // Optional: Add an icon to the chip
                            onDeleted: () {
                              // Handle chip deletion or button click action
                              print('Chip button pressed');
                            },
                            deleteIcon: Icon(Icons.cancel,
                                color: Colors
                                    .grey), // Optional: Customize delete icon
                            deleteButtonTooltipMessage:
                            'Remove', // Tooltip for the delete button
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: SC.from_height(8),
                  left: SC.from_height(20),
                  child: Container(
                    decoration: BoxDecoration(
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(SC.from_height(7)),
                      color: Colors.white,
                    ),
                    child: Text(
                      ' Audience ',
                      style: TextStyle(
                          color: Colors.grey.shade700, fontSize: SC.from_height(16)),
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: SC.from_height(15),
          ),

           // AI SUGESTED CAPTION  //
          Container(
            width: double.infinity,
            height: SC.from_height(95),
            decoration: BoxDecoration(
                color: Color.fromRGBO(236, 253, 243, 0.5),
                borderRadius: BorderRadius.circular(
                  SC.from_height(5),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: SC.from_height(10), left: SC.from_height(15)),
                  child: Text('AI Suggested Caption',
                      style:  TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: SC.from_height(16),
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: SC.from_height(10),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SC.from_height(12),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
                      // height: SC.from_height(32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey,),
                        borderRadius: BorderRadius.circular(SC.fromWidth(15)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Food Shopper',
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize:SC.fromWidth(27)),
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SC.from_height(20),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(SC.from_height(15)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Retailer',
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize:SC.fromWidth(27)),
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // ADD LOCATION //
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(SC.from_height(7)),
            ),
            width: double.infinity,
            height: SC.from_height(80),
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: SC.from_height(15), left: SC.from_height(15)),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(SC.from_height(7)),
                      ),
                      width: double.infinity,
                      height: SC.from_height(50),
                      child: Text(
                        'Add a location',
                        style: TextStyle(fontSize: SC.from_height(16),color:Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: SC.from_height(5),
                  left: SC.from_height(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SC.from_height(7)),
                      color: Colors.white,
                    ),
                    child: Text(
                      ' Target Area ',
                      style: TextStyle(
                          color: Colors.grey.shade700, fontSize: SC.from_height(15)),
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: SC.from_height(15),
          ),

          // GFBUTTON //
          CustomButton(
            text: 'Next', onPressed: () {
            // context.pushNamed("homePage");
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CampaignSetting()));
          },
          ),


          SizedBox(
            height: SC.from_height(15),
          ),
        ],
      ),
    );
  }
}
