
import 'package:flutter/material.dart';
import 'package:leadkart/Models/PlanBYTypIdModel.dart';
import 'package:leadkart/Models/plansModel.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';

import '../helper/dimention.dart';

class Plantileview extends StatelessWidget {
  PlanDetail2 data;
  Plantileview({required this.data,super.key});

  @override
  Widget build(BuildContext context) {

    var p = Controllers.createAddProvider(context,listen: false);

    return MyInkWell(
      onTap: (){
        p.getOffering(context, data.id??"");
        p.setPlan(p.plan?.id==data.id?null:data);
      },
      margin: EdgeInsets.symmetric(horizontal: SC.from_height(2), vertical: SC.from_height(5)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0.8,
            blurRadius: 7,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // if (isRecommendation)
          //   Container(
          //     padding: EdgeInsets.symmetric(horizontal: 8),
          //     decoration: BoxDecoration(
          //       color: Color.fromRGBO(199, 255, 222, 0.8),
          //       borderRadius: BorderRadius.only(
          //         bottomRight: Radius.circular(SC.from_height(18)),
          //         topLeft: Radius.circular(SC.from_height(8)),
          //       ),
          //     ),
          //     height: SC.from_height(28),
          //     width: SC.fromContextWidth(context, 2.5),
          //     child: Center(
          //       child: Text(
          //         'Recommendation',
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.w600,
          //           fontSize: SC.fromWidth(30),
          //         ),
          //       ),
          //     ),
          //   ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SC.from_height(10)),
            child: Row(
              children: [
                Text(
                  'Duration : ${data.duretion} days',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: SC.from_height(13),
                  ),
                ),
                SizedBox(width: SC.from_height(10)),
                Text(
                  '₹ ${data.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontSize: SC.fromWidth(21),
                  ),
                ),
                Expanded(child: Container()),
                Radio(
                  value:data.id,
                  groupValue:Controllers.createAddProvider(context,listen: false).plan?.id,
                  onChanged: (d){
                    p.setPlan(p.plan?.id==data.id?null:data);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: SC.from_height(8)),
          Padding(
            padding: EdgeInsets.only(
              left: SC.from_height(14),
              right: SC.from_height(14),
              bottom: SC.from_height(10),
            ),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //     height: SC.fromContextWidth(context, 6.5),
                //     child: _buildInfoColumn('Lead', leads.toString(), context)),
                // SizedBox(
                //     height: SC.fromContextWidth(context, 6.5),
                //     child: _buildInfoColumn('Reach', reach.toString(), context)),
                // SizedBox(
                //     height: SC.fromContextWidth(context, 6.5),
                //     child: _buildPlatformIconsColumn('Platform', platforms,context)),
                _buildInfoColumn('Lead', "${data.leads??"0"}", context),
                _buildInfoColumn('Reach', "${data.reach??"0"}", context),
                _buildPlatformIconsColumn("Platform",["assets/facebook.png","assets/instagram_wbg.png"], context),
                _buildInfoColumn('AI Images', data.aiImageCount.toString(), context),

              ],
            ),
          ),
          SizedBox(height: SC.from_height(5)),

        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value,BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            fontSize: SC.fromContextWidth(context, 26),
          ),
        ),
        SizedBox(height: SC.from_height(5)),
        label=='Reach' ? Text(
          '> $value',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: SC.fromContextWidth(context, 26),
          ),
        ):Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: SC.fromContextWidth(context, 26),
          ),
        )
      ],
    );
  }

  Widget _buildPlatformIconsColumn(String label, List<String> icons, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //Const
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontSize: SC.fromContextWidth(context, 26)
          ),
        ),
        SizedBox(height: SC.from_height(5)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: icons.map((icon) {
            return SizedBox(
                width: SC.fromContextWidth(context, 20),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(icon),
                ));
          }).toList(),
        ),
      ],
    );
  }

}
