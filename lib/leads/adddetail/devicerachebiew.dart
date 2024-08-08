import 'package:flutter/material.dart';
import 'package:leadkart/helper/helper.dart';

import '../../helper/dimention.dart';

class DeviceReachView extends StatelessWidget {
  Map data;
   DeviceReachView({required this.data,super.key});

  @override
  Widget build(BuildContext context) {
    
    List? _d = data["data"];
    if(_d==null||_d.length==0)
      {
        return const Center(child: Text("Reach Report is Empty"),);
      }


    
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(var i in _d)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration:const  BoxDecoration(),
                        width: SC.from_height(55),
                        height: SC.from_height(55),
                        child: Image.asset('assets/phone.png'),
                      ),

                      const SizedBox(height: 8,),
                      Text(MyHelper.titleFormate(i["device_platform"]??"Its Null"),style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey.shade700, fontSize: SC.from_height(16)),),
                      const SizedBox(height: 8,),

                      Text("${i["impressions"]??"Its Null"}",style: TextStyle(
                          color: Colors.black,
                          fontSize: SC.from_height(18),
                          fontWeight: FontWeight.w600),)
                    ],
                  )
            ],),
          ),
        )
      ],
    );
  }
}
