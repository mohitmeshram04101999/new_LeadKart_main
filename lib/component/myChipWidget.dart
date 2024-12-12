import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/helper/controllerInstances.dart';

import '../helper/dimention.dart';


class Mychipwidget extends StatelessWidget {
  BCategory category;
  void Function()? onDeleted;
  Mychipwidget({this.onDeleted,required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Chip(

        label: Text(
          category.title.toString(),
          style: TextStyle(color: AppConstent().primeryColor,fontSize:SC.fromWidth(26) ),
        ),
        backgroundColor:
        Colors.white, // Customize chip background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              SC.from_height(
                  15)), // Match container border radius
          side: BorderSide(
              color:  AppConstent().primeryColor), // Optional: Match container border color
        ),

        // Optional: Add an icon to the chip
        onDeleted:onDeleted,
        deleteIcon: Icon(Icons.cancel,
            color:  AppConstent().primeryColor), // Optional: Customize delete icon
        deleteButtonTooltipMessage:
        'Remove', // Tooltip for the delete button
      ),
    );
  }
}

