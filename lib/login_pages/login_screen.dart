import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:leadkart/them/constents.dart';
import 'package:logger/logger.dart';

import '../helper/dimention.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LogInPageState();
}

//login with facebook
class _LogInPageState extends State<LoginScreen> {
  loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.i.login(
      loginBehavior: LoginBehavior.nativeWithFallback,
      // permissions: ['email', 'public_profile'],
      permissions: [
        'pages_show_list',
        'ads_management',
        'ads_read',
        'business_management',
        'leads_retrieval',
        'page_events',
        'pages_manage_ads',
        'pages_manage_posts',
        'read_insights',
        'pages_read_engagement'
      ],
      // loginBehavior: LoginBehavior.webOnly,
      // permissions: [
      //  'email',
      //   'public_profile'
      // ],
    ); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;
      Logger().w('Access Token: ${result.status}\n ${accessToken.tokenString}');
    } else {
      log('Error');
      log(result.status.toString());
      log(result.message.toString());
    }
  }

  int _count = 30;

  final borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
        color: Colors.grey, width: 1.0), // Set enabled border color
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppConstent().themeGradiant
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomSheet: Container(
            width: double.maxFinite,
            height: SC.from_width(240),
            decoration: BoxDecoration(
              // border: Border.all(),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    SC.from_height(30)), // Adjust the radius as needed
                topRight: Radius.circular(
                    SC.from_height(30)), // Adjust the radius as needed
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 10, // Blur radius
                  offset:
                      const Offset(0, 3), // Offset to create shadow towards bottom
                ),
              ],
            ),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
        // mainAxisSize: MainAxisSize.min,
        //     mainAxisAlignment: MainAxisAlignment.start,
              children: [

                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: SC.fromWidth(30)),
                //   child: Container(
                //       width: SC.fromWidth(1.1), child: Center(child: Text('Facebook and Mail',
                //     style: TextStyle( fontSize:SC.fromWidth(28),color: Color.fromRGBO(96, 96, 96, 1),fontWeight: FontWeight.w500),textAlign: TextAlign.center,))),
                // ),

                SizedBox(
                  height: SC.from_height(40),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTextField(
                    icon: Text("+91",style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SC.from_width(18)
                    ),),
                      textInputType: TextInputType.number,
                      format: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: Controllers.authController.phonController,
                      hintText: "",
                      labelText: "",),
                ),

                SizedBox(
                  height: SC.from_height(40),
                ),

                MyactionButton(
                    action: () => Controllers.authController.login(context),
                    duretion: const Duration(milliseconds: 300),
                    lable: "Let's LogIn",
                    // child: const Text(
                    //     "Let's LogIn",
                    //   style: TextStyle(color: Colors.white),
                    // )
                ),

                // ROW //
                SizedBox(
                  height: SC.from_height(40),
                ),

                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: SC.from_height(17)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //           width: SC.fromWidth(4),
                //           child: Divider(
                //             thickness: 1.5,
                //             color: Colors.grey.shade300,
                //           )),
                //       Text('  or Log with  ',
                //           style: TextStyle(
                //               color: Colors.grey,
                //               fontSize: SC.fromWidth(26),
                //               fontWeight: FontWeight.w500)),
                //       Container(
                //           width: SC.fromWidth(4),
                //           child:
                //               Divider(thickness: 1.5, color: Colors.grey.shade300)),
                //     ],
                //   ),
                // ),

                // SizedBox(
                //   height: SC.from_height(30),
                // ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Expanded(
                //         child: MyInkWell(
                //           // width:  SC.fromWidth(3),
                //           height: SC.from_height(54),
                //           decoration: BoxDecoration(
                //               border: Border.all(color: Colors.grey, width: .5),
                //               borderRadius: BorderRadius.circular(10)),
                //           child: Center(
                //               child: Container(
                //                   width: SC.from_height(41),
                //                   height: SC.from_height(41),
                //                   child: Image.asset(
                //                     'assets/google.png',
                //                     fit: BoxFit.cover,
                //                   ))),
                //         ),
                //       ),
                //       const SizedBox(
                //         width: 10,
                //       ),
                //       Expanded(
                //         child: InkWell(
                //           child: MyInkWell(
                //             onTap: () => loginWithFacebook(),
                //
                //             // width:  SC.from_height(150),
                //             height: SC.from_height(54),
                //             decoration: BoxDecoration(
                //                 border: Border.all(
                //                     color: Colors.grey,
                //                     width: .5), // Set enabled border color
                //                 borderRadius: BorderRadius.circular(10)),
                //             child: Center(
                //                 child: Container(
                //                     width: SC.from_height(32),
                //                     height: SC.from_height(32),
                //                     child: Image.asset(
                //                       'assets/facebook.png',
                //                       fit: BoxFit.cover,
                //                     ))),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: SC.from_height(30),
                ),
              ],
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: SC.from_height(60),
                ),
                Text(
                  'Let’s Log in',
                  style: TextStyle(
                      fontSize: SC.from_height(26), fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: SC.from_height(11),
                ),
                Container(
                    width: SC.fromWidth(1.1),
                    child: Center(
                        child: Text(
                          'Sign in now to launch your advertising campaigns and grow your business.',
                          style: TextStyle(
                              fontSize: SC.fromWidth(23),
                              color: Color.fromRGBO(96, 96, 96, 1),
                              fontWeight: FontWeight.w500),
                        ))),
              ],
            ),
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
