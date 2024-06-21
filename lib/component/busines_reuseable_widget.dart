import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';

class ReuseableBusinesContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  ReuseableBusinesContainer({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: SC.from_height(50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SC.from_height(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300, // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, 1), // Offset in x and y direction
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
