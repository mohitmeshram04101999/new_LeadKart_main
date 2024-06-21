import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';

class AddCreation extends StatefulWidget {
  const AddCreation({Key? key}) : super(key: key);

  @override
  State<AddCreation> createState() => _AddCreationState();
}

class _AddCreationState extends State<AddCreation> {

  // Sample data
  final List<Map<String, String>> data = [
    {
      'image': 'assets/entertainment.png',
      'text': 'Art & Entertainments',
    },
    {
      'image': 'assets/entertainment.png',
      'text': 'Astrology',
    },
    {
      'image': 'assets/car.png',
      'text': 'Automobile',
    },
    {
      'image': 'assets/cake.png',
      'text': 'Bakery and Cake',
    },
    {
      'image': 'assets/bank.png',
      'text': 'Banking & Finance',
    },
    {
      'image': 'assets/clean.png',
      'text': 'Cleaning & Pest Control',
    },


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Create an Add',),

      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
        children: [

          SizedBox(height: SC.from_height(15),),

          Padding(
            padding:   EdgeInsets.symmetric(horizontal:SC.from_height(0) ),
            child: Text('What’s your Business',style: TextStyle(fontSize: SC.from_height(19),fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: SC.from_height(7),),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal:SC.from_height(0) ),
            child: Text('Let us know which of the following describe the  business',style: TextStyle(fontWeight: FontWeight.w500,fontSize: SC.from_height(16),color: Colors.grey.shade700),),
          ),

          SizedBox(
            height: SC.from_height(15),
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
                TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(15)), // Customize label text style
                contentPadding: EdgeInsets.symmetric(
                    vertical: SC.from_height(12),
                    horizontal: SC.from_height(10)), // Adjust padding
                filled: true,
                fillColor: Colors
                    .white, // Optional: Set background color of the text field
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
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

          // Mobile NO //
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
                labelText: 'Mobile No', // Add label text
                labelStyle:
                TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(15)), // Customize label text style
                contentPadding: EdgeInsets.symmetric(
                    vertical: SC.from_height(12),
                    horizontal: SC.from_height(10)), // Adjust padding
                filled: true,
                fillColor: Colors
                    .white, // Optional: Set background color of the text field
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
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

          SizedBox(height: SC.from_height(15),),

          // Select business category //
          Padding(
            padding:   EdgeInsets.symmetric(horizontal:SC.from_height(0) ),
            child: Text('Select business category',style: TextStyle(fontSize: SC.from_height(18),fontWeight: FontWeight.w500),),
          ),

          SizedBox(height: SC.from_height(15),),

          //  SELECT BUSINESS CATEGORY //
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SC.from_height(0)),
            child: TextFormField(

              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: 'Select busines category',
                hintStyle: TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(15)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide: BorderSide(color: Colors.grey), // Set border color
                ),
                suffixIcon: Icon(Icons.search, color: Colors.grey.shade700), // Add search icon
                contentPadding: EdgeInsets.symmetric(
                    vertical: SC.from_height(12),
                    horizontal: SC.from_height(10)), // Adjust padding
                filled: true,
                fillColor: Colors.white, // Optional: Set background color of the text field
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide: BorderSide(color: Colors.grey.shade400), // Set border color
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

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                data.length,
                    (index) => Padding(
                  padding: EdgeInsets.only(bottom: SC.from_height(10)), // Space between rows
                  child: Padding(
                    padding:   EdgeInsets.only(top: SC.from_height(8)),
                    child: Row(
                      children: [
                        Image.asset(
                          data[index]['image']!,
                          width: SC.from_height(24), // Adjust image size as needed
                          height: SC.from_height(24),
                        ),
                        SizedBox(width: SC.from_height(12)),
                        Text(
                          data[index]['text']!,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: SC.from_height(17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: SC.from_height(15),),

          // GFBUTTON //
          Container(
            height: SC.from_height(45), // Adjust as needed
            width: SC.from_height(340), // Adjust as needed
            child: GFButton(
              onPressed: () {

                // context.pushNamed("homePage");
                // Your onPressed logic here
              },
              color: MyHelper.appConstent.primeryColor, // The button's background color
              borderShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white,fontSize: SC.from_height(18)), // Text color
                ),
              ),
            ),
          ),

          SizedBox(height: SC.from_height(12),),

        ],
      ),
    );
  }
}
