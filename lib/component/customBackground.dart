import 'package:flutter/material.dart';
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
        child: child,
      ),
    );
  }
}
