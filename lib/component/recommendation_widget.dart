import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';

class RecommendationWidget extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final int leads;
  final int reach;
  final List<String> platforms;
  final Function onTap;

  RecommendationWidget({
    required this.title,
    required this.description,
    required this.duration,
    required this.leads,
    required this.reach,
    required this.platforms,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Color.fromRGBO(199, 255, 222, 0.8),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(18), // Adjust the radius value as needed
                topLeft: Radius.circular(8), // Adjust the radius value as needed
              ),
            ),
            height: SC.from_height(28),
            width: SC.from_height(120),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:SC.fromWidth(32)),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SC.fromWidth(28)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: SC.fromWidth(22)),
                  ),
                ),
                Text(
                  'Duration : $duration',
                  style: TextStyle(fontWeight: FontWeight.w500,color: Color.fromARGB(96, 96, 96, 1),fontSize: SC.fromWidth(30)),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
    padding: EdgeInsets.only(
              left: SC.from_height(14),
              right: SC.from_height(14),
              bottom: SC.from_height(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Lead', style: TextStyle(color: Colors.black45,fontSize:SC.from_height(17))),
                    SizedBox(height: 5),
                    Text(leads.toString(), style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:SC.from_height(17) )),
                  ],
                ),
                Column(
                  children: [
                    Text('Reach', style: TextStyle(color: Colors.black45,fontSize:SC.from_height(17))),
                    SizedBox(height: 5),
                    Text(reach.toString(), style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:SC.from_height(17) )),
                  ],
                ),
                Column(
                  children: [
                    Text('Platform', style: TextStyle(color: Colors.black45,fontSize:SC.from_height(17) )),
                    SizedBox(height: SC.from_height(5)),
                    Row(
                      children: platforms.map((platform) {
                        return Row(
                          children: [
                            Container(
                              width: SC.from_height(18),
                              height: SC.from_height(18),
                              child: Image.asset(platform),
                            ),

                            SizedBox(width: SC.from_height(13)),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: SC.from_height(15)),
          InkWell(
            onTap: () => onTap(),
            child: Container(
    decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyHelper.appConstent.primeryColor),

              ),
              margin: EdgeInsets.symmetric(horizontal: SC.from_height(12)),
              height: SC.from_height(42), // Adjust as needed
              width: SC.from_height(340),
              child: Center(
                child: Text(
                  'Choose Package',
                  style: TextStyle(
                    color:  MyHelper.appConstent.primeryColor, // Replace with your primary color
                    fontSize: SC.from_height(14),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SC.from_height(20)),
        ],
      ),
    );
  }
}
