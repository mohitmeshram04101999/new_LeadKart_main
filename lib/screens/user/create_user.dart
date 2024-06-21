import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/busines_category.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Create an user',),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
          child: Column(
        
            children: [
              SizedBox(height: SC.from_height(22),),
              Container(
                clipBehavior: Clip.hardEdge,
                  width: SC.from_height(195),
                height: SC.from_height(165),
                decoration: BoxDecoration(
                  // border: Border.all(),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(SC.from_height(10)),
        
                ),
        
                child: Image.asset('assets/img_9.png',fit: BoxFit.cover,)
              ),
              SizedBox(height: SC.from_height(0),),
        
              // Enter user name //
              Container(
                height: SC.from_height(45),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(16)), // Your label text
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0), // Set default border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0), // Set enabled border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 0.5), // Custom border color for focused state
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
        
              SizedBox(height: SC.from_height(20),),
        
              // Email-ID //
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: SC.from_height(45),
                // padding: EdgeInsets.symmetric(horizontal: SC.from_height(20)), // Optional padding to give some space around the TextField
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.grey,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  decoration: InputDecoration(
                    labelText: 'Email-ID',
                    labelStyle: TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(16)),// Your label text
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0), // Set default border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0), // Set enabled border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 0.5), // Custom border color for focused state
                    ),
                  ),
                ),
              ),
        
              SizedBox(height: SC.from_height(20),),
        
              // Select roles for user //
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
                    hintText: 'Select roles for user',

                    hintStyle:  TextStyle(fontWeight: FontWeight.w400,color: Colors.grey.shade700,fontSize: SC.from_height(16))// Add hint text
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
        
              SizedBox(height: SC.from_height(20),),
        
              // Password //
              Container(
                height: SC.from_height(45),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(16)),// Your label text
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0), // Set default border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0), // Set enabled border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 0.5), // Custom border color for focused state
                    ),
                  ),
        
                ),
              ),
        
              SizedBox(height: SC.from_height(20),),
        
              // Confirm Password //
              Container(
                height: SC.from_height(45),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(16)), // Your label text
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0), // Set default border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0), // Set enabled border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 0.5), // Custom border color for focused state
                    ),
                  ),
        
                ),
              ),
        
              SizedBox(height: SC.from_height(30),),



              SizedBox(height: SC.fromHeight(50),),
        
              // GFBUTTON //

              CustomButton(
                text: 'Create', onPressed: () {
                // context.pushNamed("homePage");
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BusinesCategory()));
              },
              ),



              SizedBox(height: SC.from_height(11),),
            ],
          ),
        ),
      ),
    );
  }
}
