import 'package:flutter/material.dart';
import 'package:leadkart/component/customelevated%20Button.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/them/constents.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/clips/onbording%20cliper.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/them/constents.dart';

import '../../helper/helper.dart';
import '../../login_pages/login_screen.dart';

class OnBordingPage extends StatefulWidget {
  PageController pageController;
  String mainText;
  String subTitle;
  Widget child;
  bool lastPage;
  OnBordingPage(
      {this.lastPage = false,
      required this.child,
      required this.mainText,
      required this.subTitle,
      required this.pageController,
      super.key});

  @override
  State<OnBordingPage> createState() => _OnBordingPageState();
}

class _OnBordingPageState extends State<OnBordingPage> {
  @override
  Widget build(BuildContext context) {
    //Scaffold
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(123, 110, 228, .1),
            Colors.white
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // //Min App bar
              // ClipPath(
              //   clipper: OnbordingAppBarClip(),
              //   child: Container(
              //     width: double.infinity,
              //     height: MediaQuery.of(context).size.height/2,
              //     color: AppConstent().OnbordingAppBar,
              //     child: widget.child,
              //   ),
              // ),
              // SizedBox(height: SC.from_width(76),),

              //main text
              Text(
                widget.mainText,
                style: TextStyles().onBordingMainText,
              ),
              SizedBox(
                height: SC.from_width(16),
              ),

              //subtitle
              Text(
                widget.subTitle,
                style: TextStyles().onBordingSubTitle,
              ),
              Spacer(),

             CustomElevetdButton(title: "Lets Get Started", onPressed: (){
               context.goNamed("logInScreen");
             }),

              SizedBox(height: 20,)
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: SC.from_width(10)),
              //   child: Row(
              //     children: [
              //       InkWell(
              //           onTap: () {
              //             context.pushNamed("logInScreen");
              //           },
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               "Skip",
              //               style: TextStyle(
              //                   fontSize: SC.from_width(14),
              //                   fontWeight: FontWeight.w500),
              //             ),
              //           )),
              //       Spacer(),
              //       widget.lastPage
              //           ? ElevatedButton(
              //               onPressed: () {
              //                 context.pushNamed("logInScreen");
              //
              //                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              //               },
              //               child: Text("Start"),
              //             )
              //           : ElevatedButton(
              //               onPressed: () {
              //                 widget.pageController.nextPage(
              //                   duration: Duration(milliseconds: 150),
              //                   curve: Curves.linear,
              //                 );
              //               },
              //               child: Text("Continue"),
              //             ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
