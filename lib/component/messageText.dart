import 'package:flutter/material.dart';
import 'package:leadkart/them/constents.dart';


class Messagetext extends StatelessWidget {
  final String data;
  const Messagetext({required this.data,super.key});


  @override
  Widget build(BuildContext context) {
    return Center(child: Text(data,
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color:  AppConstent().primeryColor
    ),));
  }
}
