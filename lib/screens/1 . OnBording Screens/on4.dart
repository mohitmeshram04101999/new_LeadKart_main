import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/screens/1%20.%20OnBording%20Screens/OnbordinPage.dart';

class On4 extends StatelessWidget {
  PageController pageController;
  On4({required this.pageController,super.key});

  @override
  Widget build(BuildContext context) {
    return OnBordingPage(
        child: Center(
          child: Image.asset("assets/onBording2/on4.png",width: SC.from_width(300),),
        ),
        mainText: "Monitor your ad performance",
        subTitle: "We serve you the ad performance in real time.",
        pageController: pageController,
      lastPage: true,
    );
  }
}