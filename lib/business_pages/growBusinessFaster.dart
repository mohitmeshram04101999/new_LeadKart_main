import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/Models/estimateddataModel.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/them/constents.dart';
import 'package:flutter/widgets.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';

class GrowBusinessFaster extends StatefulWidget {
  const GrowBusinessFaster({super.key});

  @override
  State<GrowBusinessFaster> createState() => _GrowBusinessFasterState();
}

class _GrowBusinessFasterState extends State<GrowBusinessFaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grow Business Faster'),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const LeadsBanner(),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Select Plan",
                    style: Theme.of(context).textTheme.displayMedium),
              ],
            ),
            const SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PlanSelecter(
                    title: "1 week",
                    price: "3000",
                  ),
                  SizedBox(width: 10),
                  PlanSelecter(
                    title: "14 days",
                    price: "5000",
                  ),
                  SizedBox(width: 10),
                  PlanSelecter(
                    title: "1 month",
                    price: "10000",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Platform Covered",
                    style: Theme.of(context).textTheme.displayMedium),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/instagram_wbg.png', width: 25),
                    const SizedBox(width: 10),
                    Text("Instagram",
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Image.asset('assets/facebook_wbg.png', width: 25),
                    const SizedBox(width: 10),
                    Text("Facebook",
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            // ExtimateResultCard()
          ],
        ),
      ),
    );
  }
}




class EstimateResultCard extends StatelessWidget {
  final EstimatedData data;
  final int totalBudget;
  EstimateResultCard(
      {required this.totalBudget, required this.data, super.key});



  String amountFormate(int? s)
  {
    if(s==null)
      {
        return '0';
      }

    //
    if(s>=1000000000)
    {
      double a = s/1000000000;
      return "${a.toStringAsFixed(2)} B";
    }

    //
    if(s>=1000000)
      {
        double a = s/1000000;
        return "${a.toStringAsFixed(2)} M";
      }

    //
    if(s>=1000)
      {
        double a = s/1000;

        return "${a.toStringAsFixed(2)} K";
      }
    return "$s";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 5,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Estimated Result", style:TextStyle(fontWeight: FontWeight.w500,fontSize: SC.from_width(16))),


              const SizedBox(
                height: 10,
              ),

              Row(
                children: [

                  //views
                  Expanded(child: Column(
                    children: [
                      //
                      Text(
                        amountFormate(data.totalReach),
                        style: AppConstent.labelStyle(context),
                        maxLines: 1,overflow: TextOverflow.ellipsis,),
                      const SizedBox(
                        width: 10,
                      ),

                      //
                      Text("Ad View",
                          style: TextStyle(
                            fontSize: SC.from_width(14),
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(189, 189, 189, 1),
                          ))

                  ],)),
                  Container(width: 2,height: SC.from_width(60),color: Colors.grey.withOpacity(.5),),

                  //leads
                  Expanded(child: Column(
                    children: [
                      //
                      Text(
                        "${data.totalLeads! < 1000 ? data.totalLeads : '${(data.totalLeads ?? 0) / 1000}K'}",
                        style: AppConstent.labelStyle(context),
                        maxLines: 1,overflow: TextOverflow.ellipsis,),

                      //
                      Text("Leads",
                          style: TextStyle(
                            fontSize: SC.from_width(14),
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(189, 189, 189, 1),
                          ))

                    ],)),
                  Container(width: 2,height: SC.from_width(60),color: Colors.grey.withOpacity(.5),),


                  //spent
                  Expanded(child: Column(
                    children: [
                      //
                      Text(
                        "₹${amountFormate(totalBudget)}",
                        style: AppConstent.labelStyle(context),
                        maxLines: 1,overflow: TextOverflow.ellipsis,),

                      //
                      Text("Spend",
                          style: TextStyle(
                            fontSize: SC.from_width(14),
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(189, 189, 189, 1),
                          ))

                    ],)),
                  Container(width: 2,height: SC.from_width(60),color: Colors.grey.withOpacity(.5),),


                  //click
                  Expanded(child: Column(
                    children: [
                      //
                      Text(
                        amountFormate(data.totalReach),
                        style: AppConstent.labelStyle(context),
                        maxLines: 1,overflow: TextOverflow.ellipsis,),
                      const SizedBox(
                        width: 10,
                      ),

                      //
                      Text("Clicks",
                          style: TextStyle(
                            fontSize: SC.from_width(14),
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(189, 189, 189, 1),
                          ))

                    ],))


                ],
              ),

              SizedBox(height: 10,),
              
              
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40,),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(227, 230, 252, 1),
                  borderRadius: BorderRadius.all(Radius.circular(SC.from_width(50)))
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: SC.from_width(12),
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                        ),
                          children: [
                    TextSpan(
                        text: "You will spend only ",),
                    TextSpan(
                        text: "₹${amountFormate(totalBudget)}",
                        style: TextStyles()
                            .mediumText
                            .copyWith(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: " in total and ad\nwill run for ",
                    ),
                    TextSpan(
                        text: "6 days",
                        style: TextStyles()
                            .mediumText
                            .copyWith(fontWeight: FontWeight.bold))
                  ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlanSelecter extends StatefulWidget {
  final String title;
  final String price;
  const PlanSelecter({super.key, required this.title, required this.price});

  @override
  State<PlanSelecter> createState() => _PlanSelecterState();
}

class _PlanSelecterState extends State<PlanSelecter> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppConstent().primeryColor, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.title,
                      style: Theme.of(context).textTheme.displaySmall),
                  Text("₹${widget.price}",
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          // right: 0,
          // left: 0,
          child: Container(
            // width: 100,
            // height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade800, Colors.blue.shade300],
              ),
            ),
            child: const Text("1 week"),
          ),
        ),
      ],
    );
  }
}

class LeadsBanner extends StatelessWidget {
  const LeadsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstent().leadsBannerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Get New Leads', style: TextStyles().greenMediumText),
              Text('Get new customers using Leads',
                  style: TextStyles().blackSmallText),
            ],
          ),
          Image.asset('assets/img_5.png', width: 100, height: 80)
        ],
      ),
    );
  }
}
