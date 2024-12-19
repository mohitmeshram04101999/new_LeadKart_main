import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/them/constents.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({required this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppConstent().themeGradiant,
        ),
        child: Stack(
          children: [
            Positioned(
              top: SC.from_width(350),
              left: SC.from_width(-105),
              child: Container(
                height: SC.from_width(210),
                width: SC.from_width(210),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius:SC.from_width(100),
                      blurRadius: SC.from_width(280),
                      color: Color.fromRGBO(253, 117, 29, 0.2)
                    )
                  ]
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
