import 'package:flutter/material.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';

import '../../helper/dimention.dart';

class GetNewLeads extends StatelessWidget {
  const GetNewLeads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyHelper.appConstent.primeryColor,
        foregroundColor: Colors.white,
        title: Text('Get New Leads'),
        actions: [
          HelpButton()
        ],
      ),
      body: Column(
        children: [InfoCard(
          title: 'Get new customers using Leads :',
          subTitle: ' Generate daily new leads by showing your ads to potential customers in target area.',
        )],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const InfoCard({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Icon(Icons.info_outline_rounded),SizedBox(
          width: SC.from_width(10),
        ), SizedBox(
          width: SC.Screen_width * 0.8,
          child: RichText(text: TextSpan(
            children: [
              TextSpan(text: title, style: Theme.of(context).textTheme.displayMedium),
              TextSpan(text: subTitle, style: Theme.of(context).textTheme.displaySmall),
            ]
          )),
        ),
      ],
      ),
    );
  }
}


class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SC.from_height(30),
      width: SC.from_width(90),
      child: OutlinedButton(child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.call),
          SizedBox(width: SC.from_width(5),),
          Text('Help?', style: MyHelper.textStyls.leadTileWhiteText,),
        ],
      ), onPressed: () {},   style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
        backgroundColor: MaterialStatePropertyAll( MyHelper.appConstent.primeryColor),
        foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
        fixedSize: MaterialStatePropertyAll(Size(120, 25)),
        side: MaterialStatePropertyAll( BorderSide(color: Colors.white)),
      ), ),
    );
  }
}
