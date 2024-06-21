import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/screens/1%20.%20OnBording%20Screens/on1.dart';
import 'package:leadkart/screens/1%20.%20OnBording%20Screens/on2.dart';

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

      body: Stack(

        children: [

          //Page view
          PageView(

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

              On2(pageController: pageController),

              On3(pageController: pageController),

              On4(pageController: pageController),

            ],
          ),

          //Page Index Indicator
          Positioned(
            top: SC.from_width(530),
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i =0;i<4;i++)
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.all(3),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: curruntPage ==i?MyHelper.appConstent.primeryColor:Colors.grey,
                    ),
                  )
              ],
            ),
          )


        ],
      ),

    );
  }
}
