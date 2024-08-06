import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/Models/addListByBussnesIdModel.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';

class DemoAdWidget extends StatelessWidget {
  final AddByBuinesss add;
  const DemoAdWidget({super.key, required this.add});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SC.from_height(2),vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0.2,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: SC.from_height(10), top: SC.from_height(10)),
                child: Text(
                  "${add.startDate}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: SC.from_height(14.5)),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: SC.from_height(8)),
                decoration: BoxDecoration(
                  color:const Color.fromRGBO(233, 233, 233, 1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(SC.from_height(12)),
                    bottomLeft: Radius.circular(SC.from_height(15)),
                  ),
                ),
                height: SC.from_height(28),
                width: SC.from_height(70),
                child: Center(
                  child: Text(
                    "Demo ad",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: SC.fromWidth(33)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SC.from_height(4)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SC.fromWidth(30)),
            child: Row(
              children: [
                Text(
                  "Get new leads",
                  style: TextStyle(color: AppConstent().primeryColor, fontWeight: FontWeight.w600, fontSize: SC.from_height(17)),
                ),
                SizedBox(width: SC.fromWidth(11.5)),
                if(add.isFacebookAdEnabled??false)
                   ShaderMask(shaderCallback: (a){
                    return  const LinearGradient(
                      begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.yellow,
                          
                          Color(0xfffd1d1d),
                     Color(0xffc13584),
                          Color(0xff405de6)

                        ]).createShader(a);
                  },child: const Icon(FontAwesomeIcons.squareInstagram,color: Colors.white,),),
                const SizedBox(width: 5,),
                if(add.isFacebookAdEnabled??false)
                  const Icon(FontAwesomeIcons.facebookF,color: Color.fromRGBO(1, 101, 225, 1),),
              ],
            ),
          ),
          SizedBox(height: SC.from_height(12)),
          Padding(
            padding: EdgeInsets.only(
              left: SC.fromWidth(25),
              right: SC.fromWidth(34),
              bottom: SC.fromWidth(25),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  width: SC.from_width(124),
                  height: SC.from_height(124),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(SC.from_height(10))),
                  child: Image.network(add.image??"",fit: BoxFit.cover,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Ad Views',"${add.totalImpression??0}"),
                    _buildInfoRow('Leads', "${add.totalLeads??0}"),
                    _buildInfoRow('Spent', "${add.totalSpendBudget??0}"),
                    _buildInfoRow('Clicks', "${add.totalClicks??0}"),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: SC.from_height(12)),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    context.pushNamed("AddDetailScreen",extra: {"id":add.id.toString()});
                  },
                  child: Text(
                    'View Reports',
                    style: TextStyle(
                      color:const  Color.fromRGBO(36, 238, 221, 1),
                      // fontSize: SC.from_height(15),
                      fontSize: SC.fromWidth(27),
                    ),
                  ),
                ),
                SizedBox(
                  height: SC.from_height(1),
                  width: SC.from_height(85),
                  child: Divider(thickness: 1, color: AppConstent().primeryColor),
                ),
              ],
            ),
          ),
          SizedBox(height: SC.from_height(20)),
        ],
      ),
    );
  }




  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: SC.from_height(8)),
      child: Row(
        children: [
          SizedBox(width: SC.fromWidth(17)),
          Text(
            value,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: SC.from_height(16)),
          ),
          SizedBox(width: SC.from_height(10)),
          Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: SC.from_height(15)),
          ),
        ],
      ),
    );
  }
}
