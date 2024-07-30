import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/them/constents.dart';

import '../../helper/dimention.dart';

class ReportGridView extends StatelessWidget {
  bool facbookEnable;
  bool instEnable;
  Map?  instadata;
  Map? facebookdata;
  ReportGridView({required this.facbookEnable,required this.instEnable,this.instadata,this.facebookdata});

  @override
  Widget build(BuildContext context) {

    Set keys = {};
    if(facebookdata!=null)
      {
        var _n = facebookdata?["data"].first.keys;
        keys.addAll(_n);
      }
    if(instadata!=null)
    {
      var _n = instadata?["data"].first.keys;
      keys.addAll(_n);
    }
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      // height: SC.from_height(180),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(SC.from_height(8))),
      child: Column(
        children: [

          Row(
            children: [
              Expanded(child: SizedBox()),
              if(facbookEnable)
              Expanded(child: Center(child: Text("Facebook",style: TextStyle(
                color: AppConstent().primeryColor,
                fontSize: 18
              ),))),
              if(instEnable)
              Expanded(child: Center(child: Text("Instagram"))),
            ],
          ),
          
          for(String i in keys)
            Row(
              children: [
                Expanded(child: Text(titleFormate(i))),
                if(facbookEnable)
                Expanded(child: Center(child: Text("${facebookdata?["data"].first[i]??"-"}"))),
                if(instEnable)
                Expanded(child: Center(child: Text("${instadata?["data"].first[i]??"-"}"))),

              ],
            )



        ],
      ),
    );

  }

  String titleFormate(String s)
  {

    String d = s.replaceAll("_", " ").capitalizeFirst!;
    return d;
  }
}
