import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:leadkart/component/custom_button.dart';

import 'package:leadkart/login_pages/otp_screen.dart';

import '../helper/dimention.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LogInPageState();
}

class _LogInPageState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(
        child: Column(

          children:[

            Container(

              // margin: EdgeInsets.only(top: 35,bottom: 35),
              // decoration: BoxDecoration(border: Border.all()),

              width: double.infinity,
              height: SC.from_height(360),

              child: Image.asset('assets/2.png',fit: BoxFit.cover,),
            ),

            Container(
              width: double.infinity,
              height:SC.from_height(450) ,
              decoration: BoxDecoration(
                // border: Border.all(),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular( SC.from_height(30)), // Adjust the radius as needed
                  topRight: Radius.circular( SC.from_height(30)), // Adjust the radius as needed
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 3), // Offset to create shadow towards bottom
                  ),
                ],
              ),
              child: Column(

                children: [

                  SizedBox(height: SC.from_height(30),),
                  Text('Let’s sign in ', style: TextStyle(fontSize:SC.from_height(26),fontWeight: FontWeight.w600 ),),
                  SizedBox(height: SC.from_height(10),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SC.fromWidth(30)),
                    child: Container(
                        width: SC.fromWidth(1.1), child: Center(child: Text('Sign in your account using mobile no. or, Google',
                      style: TextStyle( fontSize:SC.fromWidth(28),color: Color.fromRGBO(96, 96, 96, 1),fontWeight: FontWeight.w500),textAlign: TextAlign.center,))),
                  ),Padding(
                    padding: EdgeInsets.symmetric(horizontal: SC.fromWidth(30)),
                    child: Container(
                        width: SC.fromWidth(1.1), child: Center(child: Text('Facebook and Mail',
                      style: TextStyle( fontSize:SC.fromWidth(28),color: Color.fromRGBO(96, 96, 96, 1),fontWeight: FontWeight.w500),textAlign: TextAlign.center,))),
                  ),

                  SizedBox(height: SC.from_height(20),),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SC.from_height(10)),
                    ),
                    height: SC.from_height(47),
                    padding: EdgeInsets.symmetric(horizontal: SC.from_height(20)), // Optional padding to give some space around the TextField
                    child: TextFormField(

                      keyboardType: TextInputType.number,
                      cursorColor: Colors.grey,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      style: TextStyle(fontSize: SC.from_height(16)),
                      decoration: InputDecoration(

                        labelText: 'Enter mobile no',
                        labelStyle: TextStyle(color: Colors.black,fontSize: SC.from_height(16)), // Your label text
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

                  //    COUNTINUE //

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25),
                    child: CustomButton(
                      text: 'Continue', onPressed: () {
                      // context.pushNamed("homePage");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                    },
                    ),
                  ),



                 // ROW //
                  SizedBox(height: SC.from_height(40),),

                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: SC.from_height(17)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(width: SC.fromWidth(4),child: Divider(thickness: 1.5,color: Colors.grey.shade300,)),

                        Text('  or Log with  ',style: TextStyle(color: Colors.grey,fontSize: SC.fromWidth(26),fontWeight: FontWeight.w500)),
                        Container(width: SC.fromWidth(4),child: Divider(thickness: 1.5,color: Colors.grey.shade300)),
                      ],
                    ),
                  ),

                  SizedBox(height: SC.from_height(30),),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            // width:  SC.fromWidth(3),
                            height:  SC.from_height(54),
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Container(
                                width:  SC.from_height(41),
                                height:  SC.from_height(41),
                                child: Image.asset('assets/google.png',fit: BoxFit.cover,))),

                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            // width:  SC.from_height(150),
                            height:  SC.from_height(54),
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Container(
                                width:  SC.from_height(32),
                                height:  SC.from_height(32),
                                child: Image.asset('assets/facebook.png',fit: BoxFit.cover,))),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
