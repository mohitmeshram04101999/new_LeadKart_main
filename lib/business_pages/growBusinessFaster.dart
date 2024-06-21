import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:leadkart/helper/helper.dart';

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
        title: Text('Grow Business Faster'),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            LeadsBanner(),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Select Plan", style: Theme.of(context).textTheme.displayMedium),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
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
SizedBox(height: 10),
            Row(
              children: [
                Text("Platform Covered", style: Theme.of(context).textTheme.displayMedium),
              ],
            ),
SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/instagram_wbg.png', width: 25),
                    SizedBox(width: 10),
                    Text("Instagram", style: MyHelper.textStyls.smallText),
                  ],
                ),
SizedBox(width: 20),
                Row(
                  children: [
                    Image.asset('assets/facebook_wbg.png', width: 25),
                    SizedBox(width: 10),
                    Text("Facebook", style: MyHelper.textStyls.smallText),
                  ],
                )

              ],
            ),
SizedBox(height: 10),
            ExtimateResultCard()
          ],
        ),
      ),
    );
  }
}
class ExtimateResultCard extends StatelessWidget {
  const ExtimateResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Estimated Result", style: MyHelper.textStyls.mediumText),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.info_outline_rounded, color: Colors.blue),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset('assets/eyes.png', width: 25, height: 25),
                      ),),
              SizedBox(
                  width: 10,
                ),
                  Text("28K", style: MyHelper.textStyls.smallBoldText),
                  SizedBox(
                    width: 10,
                  ),
                  Text("views", style: MyHelper.textStyls.smallText),
                ],
              ),
SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset('assets/eyes.png', width: 25, height: 25),
                    ),),
                  SizedBox(
                    width: 10,
                  ),
                  Text("28K", style: MyHelper.textStyls.smallBoldText),
                  SizedBox(
                    width: 10,
                  ),
                  Text("views", style: MyHelper.textStyls.smallText),
                ],
              )

            ],
          ),
        ],
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
            SizedBox(
              height: 12,
            ),
            Container(
              width: 120,
              height: 100,
              decoration:BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyHelper.appConstent.primeryColor, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.title, style: MyHelper.textStyls.smallText),
                  Text("₹${widget.price}", style: MyHelper.textStyls.smallBoldText),
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
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade800, Colors.blue.shade300],
              ),
            ),
            child: Text("1 week"),
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
        color: MyHelper.appConstent.leadsBannerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Get New Leads', style: MyHelper.textStyls.greenMediumText),
            Text('Get new customers using Leads', style: MyHelper.textStyls.blackSmallText),
          ],
        ), Image.asset('assets/img_5.png', width: 100, height: 80)],
      ),
    );
  }
}

