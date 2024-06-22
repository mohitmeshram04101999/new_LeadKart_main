
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/component/custom_page_route.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/busines_category.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  String? selectedOption;

  TextEditingController textEditingController = TextEditingController();

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
              CustomTextField(
                controller: textEditingController,
                labelText: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),

        
              SizedBox(height: SC.from_height(20),),
        
              // Email-ID //
              CustomTextField(
                controller: textEditingController,
                labelText: 'Email-ID',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
        
              SizedBox(height: SC.from_height(20),),
        
              // Select roles for user //

              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => BottomSheet(
                      clipBehavior: Clip.hardEdge,
                      onClosing: () {},
                      builder: (context) => ListView(
                        children: [
                          for (int i = 0; i < 5; i++)
                            ListTile(
                              title: Text(
                                "Option $i",
                                style:TextStyle(fontSize:SC.from_height(16),color: Colors.grey.shade700 ,fontWeight: FontWeight.w500),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedOption = "Option $i";
                                });
                                Navigator.pop(context); // Close the bottom sheet
                              },
                            )
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: SC.from_height(45),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          selectedOption ?? 'Select roles for user',
                          style:  TextStyle(fontWeight: FontWeight.w400,color: Colors.grey.shade700,fontSize: SC.from_height(16))
                      ),
                      Transform.rotate(
                        angle: 1.5708,  // Rotate 90 degrees clockwise (π/2 radians)
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black.withOpacity(0.8),
                          size: SC.from_height(17),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

        
              SizedBox(height: SC.from_height(20),),
        
              // Password //
              CustomTextField(
                controller: textEditingController,
                labelText: 'Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
        
              SizedBox(height: SC.from_height(20),),
        
              // Confirm Password //
              CustomTextField(
                controller: textEditingController,
                labelText: 'Confirm Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),



              SizedBox(height: SC.fromHeight(20),),
        
              // GFBUTTON //

              CustomButton(
                text: 'Create', onPressed: () {
                // context.pushNamed("homePage");
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> BusinesCategory()));
                Navigator.push(
                  context,
                  CustomPageRoute(page: BusinesCategory()),
                );
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
