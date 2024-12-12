import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/Models/addListByBussnesIdModel.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:leadkart/them/constents.dart';

class DemoAdWidget extends StatelessWidget {
  final AddByBuinesss add;
  final bool isDemo;
  const DemoAdWidget({this.isDemo = false, super.key, required this.add});

  @override
  Widget build(BuildContext context) {
    // Logger().i("${add.toJson()}");


    final titleText = TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: SC.from_width(20));
    final subTitleText = TextStyle(fontWeight: FontWeight.w500,color: Color.fromRGBO(169, 169, 169, 1));

    return MyInkWell(
      splasColor: Colors.grey.shade100,
      onTap: () async {
        await Future.delayed(const Duration(milliseconds: 150));
        // if (!isDemo) {
        context.pushNamed("AddDetailScreen", extra: {"id": add.id.toString()});
        Controllers.campaignProvider(context).load(context, campaignAd: add);
        // }
      },
      margin: EdgeInsets.symmetric(horizontal: SC.from_height(2), vertical: 8),
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

          //Image Container
          Container(
            height: SC.from_width(117),
            child:Image.network("${add.image}",fit: BoxFit.cover,width: double.infinity,),
          ),
         
         SizedBox(height: SC.from_width(8),),

         //start date of add
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(237, 237, 237, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SC.from_width(10),vertical: SC.from_width(5)),
                  child: Text(
                    "${add.startDate}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, 
                        fontSize: SC.from_height(14.5)),
                  ),
                ),
              ),
              if (isDemo)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: SC.from_height(8)),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(233, 233, 233, 1),
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
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: SC.fromWidth(33)),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: SC.from_height(20)),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: SC.from_width(8)),
            child: Row(
              children: [
            
                //add View
                _buildInfoRow('Ad Views', "${add.totalImpression ?? 0}"),
                _buildInfoRow('Leads', "${add.totalLeads ?? 0}"),
                _buildInfoRow('Spent', "${add.totalSpendBudget ?? 0}"),
                _buildInfoRow('Clicks', "${add.totalClicks ?? 0}",last: true),

              ],
            ),
          ),
          SizedBox(height: SC.from_height(20)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value,{bool last = false}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border:(last)?Border(): Border(
            right: BorderSide(color: Color.fromRGBO(220, 220, 220, 1),width: 2)
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: SC.from_height(8)),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: SC.from_height(20)),
              ),
              SizedBox(width: SC.from_height(10)),
              Text(
                label,
                style: TextStyle(color: Color.fromRGBO(169, 169, 169, 1), fontSize: SC.from_height(14),fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
