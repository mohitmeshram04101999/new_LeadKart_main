import 'package:flutter/material.dart';
import 'package:leadkart/component/bottom_navigation_screen.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:pinput/pinput.dart';

import '../them/constents.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';

  final defaultPinTheme = PinTheme(
    width: SC.from_height(58), // Increased width
    height: SC.from_height(58), // Increased height
    textStyle: TextStyle(
      fontSize: SC.from_height(18),
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1),
      // Changed border color
      borderRadius: BorderRadius.circular(SC.from_height(10)),
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
        MaterialPageRoute(builder: (context) => const NavigationScreen()),
      ).then((_) {
        // After navigating back, set isLoading to false
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        startCountDown();
      },
    );
  }

  bool resendOtp = false;
  int _count = 30;

  startCountDown() async {
    if (_count > 0) {
      if (resendOtp) {
        resendOtp = false;
      }
      _count--;
      if (mounted) {
        setState(() {});
      }

      await Future.delayed(const Duration(seconds: 1));

      startCountDown();
    } else {
      resendOtp = true;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(gradient: AppConstent().themeGradiant),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SC.from_height(30),
                ),

                SizedBox(
                  height: SC.from_height(30),
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: SC.from_width(18),
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: 'Verify OTP\n\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: SC.from_width(24))),
                          TextSpan(
                              text:
                                  'We have sent you a 4 digit code to verify your phone number on ',
                              style: TextStyle(color: Colors.grey.shade600)),
                          TextSpan(
                            text:
                                Controllers.authController.phonController.text,
                            style: TextStyle(
                                color: AppConstent()
                                    .primeryColor), // Change color of the phone number
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: SC.fromWidth(28),
                ),

                // PINPUT OTP TEXT FIELD  //
                SizedBox(
                  height: SC.from_height(20),
                ),

                SizedBox(
                  height: SC.from_height(40),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SC.from_height(20)),
                  child: Row(
                    children: [],
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            height: SC.from_width(240),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                SizedBox(
                  height: SC.from_width(20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Enter OTP",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(20)),
                      ),

                      // Text('Please wait 00:${_count}s',style: TextStyle(fontSize: SC.from_height(16),color: Colors.grey),),
                      Expanded(child: Container()),
                      if (resendOtp)
                        InkWell(
                            onTap: () {
                              _count = 30;
                              startCountDown();
                              Controllers.authController.resendOtp(context);
                            },
                            child: Text('Resend',
                                style: TextStyle(
                                    fontSize: SC.from_height(16),
                                    color: Colors.blue))),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Pinput(
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppConstent().primeryColor,
                              width:
                                  2), // Changed border color for focused state
                          borderRadius:
                              BorderRadius.circular(SC.from_height(10)),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors
                                  .black), // Keep the border for submitted state
                          borderRadius:
                              BorderRadius.circular(SC.from_height(10)),
                        ),
                      ),

                      separatorBuilder: (index) =>
                          SizedBox(width: SC.from_height(20)),
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

                //
                SizedBox(
                  height: SC.from_height(10),
                ),

                Center(
                  child: MyactionButton(
                    lable: "Verify Otp",
                    action: () =>
                        Controllers.authController.verifyOtp(otp, context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
