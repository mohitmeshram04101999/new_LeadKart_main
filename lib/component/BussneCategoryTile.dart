import 'package:flutter/material.dart';
import 'package:leadkart/Models/BusnissCateforyModel.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';

import '../helper/dimention.dart';

class BussneCategoryTile extends StatelessWidget {
  BCategory category;
  Function? onTap;

  BussneCategoryTile({this.onTap,required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    return MyInkWell(
      overLayColor: MyHelper.appConstent.primeryColor.withOpacity(.2),
      onTap: onTap,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Controllers.createBusinessProvider(context,listen:false).businessCategoryId?.id==category.id?MyHelper.appConstent.primeryColor.withOpacity(.2):null,
        border: Border.all(color: Controllers.createBusinessProvider(context,listen:false).businessCategoryId!.id==category.id?MyHelper.appConstent.primeryColor:Colors.grey.shade400,width: .5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SC.from_height(50),
            height: SC.from_height(40),
            child: Image.network(category.icon.toString()),
          ),
          SizedBox(height: SC.from_height(10)),
          Text(
            category.title.toString(),
            maxLines: 2,// Use the name from the list
            style: TextStyle(color: Colors.grey.shade700, fontSize: SC.fromWidth(30)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
