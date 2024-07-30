import 'package:flutter/material.dart';

import '../../helper/dimention.dart';


class TableView extends StatelessWidget {
  Map data;
  TableView({required this.data,super.key});

  @override
  Widget build(BuildContext context) {

    List _d = data["data"];

    return Table(
      children: [
        TableRow(

          children: [
            Container(alignment: Alignment.center,color: Colors.blue,child: Text("City",style: TextStyle(color: Colors.white,fontSize:SC.from_height(16) ),)),
            Container(alignment: Alignment.center,color: Colors.blue,child: Text("Views",style: TextStyle(color: Colors.white,fontSize:SC.from_height(16) ),)),
            Container(alignment: Alignment.center,color: Colors.blue,child: Text("Click",style: TextStyle(color: Colors.white,fontSize:SC.from_height(16) ),)),
            Container(alignment: Alignment.center,color: Colors.blue,child: Text("CTR",style: TextStyle(color: Colors.white,fontSize:SC.from_height(16) ),)),

          ],
        ),
        for(var i in _d)
          TableRow(
            children: [
              Container(
                alignment: Alignment.center,
                  color: Colors.blue.shade200,
                  child: Text("${i["region"]??"-"}", style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black,fontSize: SC.from_height(16)))),

              Container(
                  alignment: Alignment.center,
                  color: Colors.blue.shade50,
                  child: Text("${i["impressions"]??"-"}", style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black,fontSize: SC.from_height(16)))
              ),
              Container(
                  alignment: Alignment.center,
                  color: Colors.blue.shade50,
                  child: Text("${i["clicks"]??"-"}", style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black,fontSize: SC.from_height(16)))),
              Container(
                  alignment: Alignment.center,
                  color: Colors.blue.shade50,
                  child: Text("${i["ctr"]??"-"}", style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black,fontSize: SC.from_height(16)))),
            ]
          )
      ],
    );
  }
}
