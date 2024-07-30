import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/screens/1%20.%20OnBording%20Screens/OnbordinPage.dart';

class On1 extends StatelessWidget {
  PageController pageController;
  On1({required this.pageController,super.key});

  @override
  Widget build(BuildContext context) {


    return OnBordingPage(
      pageController: pageController,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset("assets/add_images/12.png"),
        ),
      ),
      mainText: "Welcome to Leadkart.ai",
      subTitle: "We help you to create, manage ads and generate leads.",
    );
  }
}
