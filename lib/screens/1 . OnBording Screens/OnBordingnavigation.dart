import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/screens/1%20.%20OnBording%20Screens/on1.dart';
import 'package:leadkart/screens/1%20.%20OnBording%20Screens/on2.dart';
import 'package:leadkart/them/constents.dart';

import 'on3.dart';
import 'on4.dart';


class OnBordingMain extends StatefulWidget {
  OnBordingMain({super.key});

  @override
  State<OnBordingMain> createState() => _OnBordingMainState();
}

class _OnBordingMainState extends State<OnBordingMain> {
  //vars
  PageController pageController = PageController();

  int curruntPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(

        physics: NeverScrollableScrollPhysics(),

        onPageChanged: (pageIndex){
          curruntPage= pageIndex;
          setState(() {

          });
        },
        controller: pageController,
        children: [

          //1
          On1(pageController:  pageController,),

          // On2(pageController: pageController),

          // On3(pageController: pageController),
          //
          // On4(pageController: pageController),

        ],
      ),

    );
  }
}
