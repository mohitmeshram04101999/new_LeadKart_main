import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/bottom_navigation_screen.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
String otp = '';

  final defaultPinTheme = PinTheme(
    width:  SC.from_height(58),  // Increased width
    height:  SC.from_height(58), // Increased height
    textStyle: TextStyle(
      fontSize:  SC.from_height(18),
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade200), // Changed border color
      borderRadius: BorderRadius.circular( SC.from_height(10)),
    ),
  );

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();


  bool _isLoading = false;

  void _handleButtonTap() {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Simulate a delay before navigating
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
      ).then((_) {
        // After navigating back, set isLoading to false
        setState(() {
          _isLoading = false;
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Container(
          // decoration: BoxDecoration(border: Border.all()),
            width: SC.from_height(270),child: Center(child: Text('Verify OTP',style: TextStyle(fontWeight: FontWeight.w500,fontSize: SC.from_height(21)),))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: SC.from_height(30),),
            Container(
              width: double.infinity,
              height: SC.from_height(160),

              child: Image.asset('assets/otp.png',fit: BoxFit.contain,),
            ),

            SizedBox(height: SC.from_height(30),),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: SC.fromWidth(28), color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'We have sent you a 4 digit code to verify your\n            phone number on ',
                        style: TextStyle(color: Colors.grey.shade600)
                      ),
                      TextSpan(
                        text: '9988090679',
                        style: TextStyle(color: Color.fromRGBO(36, 238, 221, 1)), // Change color of the phone number
                      ),
                    ],
                  ),
                ),
              ),
            ),


            SizedBox(height:  SC.fromWidth(28),),



      // PINPUT OTP TEXT FIELD  //
      SizedBox(height: SC.from_height(20),),
      Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Pinput(

                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromRGBO(36, 238, 221, 1)), // Changed border color for focused state
                      borderRadius: BorderRadius.circular( SC.from_height(10)),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200), // Keep the border for submitted state
                      borderRadius: BorderRadius.circular( SC.from_height(10)),
                    ),
                  ),

                  separatorBuilder: (index) => SizedBox(width:  SC.from_height(20)),
                  // Space between the PIN fields
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                  onCompleted: (pin) {
                    print('PIN completed: $pin');
                  },
                ),
              ),
            ),


            SizedBox(height: SC.from_height(40),),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: SC.from_height(20)),
              child: Row(
                children: [
                  Text('Please wait 00:30s',style: TextStyle(fontSize: SC.from_height(16),color: Colors.grey),),
                  Expanded(child: Container()),
                  Text('Resend OTP',style: TextStyle(fontSize: SC.from_height(16),color: Colors.grey.shade700)),
                ],
              ),
            ),

            SizedBox(height: SC.from_height(40),),


            Center(
              child: MyactionButton(
                action:()=> Controllers.authController.verifyOtp(otp, context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
