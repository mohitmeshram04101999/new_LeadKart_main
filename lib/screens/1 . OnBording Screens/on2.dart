import 'package:flutter/material.dart';
import 'package:leadkart/component/leadeTile.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/screens/1%20.%20OnBording%20Screens/OnbordinPage.dart';

class On2 extends StatelessWidget {
  PageController pageController;
  On2({required this.pageController,super.key});

  @override
  Widget build(BuildContext context) {
    return OnBordingPage(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: SC.from_width(330),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),child: Image.asset("assets/onBording2/on2.png")),
              ),
            ),

            Center(child: LeadeTile(),)
          ],
        ),
        mainText: "Get a new customer using leads",
        subTitle: "Generate daily new leads by showing your ads to potential customers in target area.",
        pageController: pageController
    );
  }
}
