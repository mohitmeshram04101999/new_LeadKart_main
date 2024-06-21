import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/select_plan_widget.dart';
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
        title: const Text('Get New Leads'),
        actions: [const HelpButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const InfoCard(
                    title: 'Get new customers using Leads :',
                    subTitle:
                    ' Generate daily new leads by showing your ads to potential customers in target area.',
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Total Budget",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SC.from_width(10),
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      BudgetSelecter(
                        icon: 'assets/facebook_wbg.png',
                        budget:'2000',
                      ),

                    ],
                  ),
                  SizedBox(
                    height: SC.from_width(10),
                  ),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      BudgetSelecter(
                        icon: 'assets/instagram_wbg.png',
                        budget:'2000',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SC.from_width(10),
                  ),
                  Text("OR"),
                  SizedBox(
                    height: SC.from_width(10),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Select a Package",style: Theme.of(context).textTheme.displayMedium,),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SC.from_width(10),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: LeadSelecter(),
                    ),)
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: SC.Screen_width,
                // height: SC.from_width(50),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0),
                      Colors.white.withOpacity(0.5),
                      Colors.grey.withOpacity(0.5),
                      Colors.grey,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed('imageEditor');
                    },
                    child: Text('Next'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class LeadSelecter extends StatefulWidget {

  const LeadSelecter({super.key});

  @override
  State<LeadSelecter> createState() => _LeadSelecterState();
}

class _LeadSelecterState extends State<LeadSelecter> {
  final List<Map<String, dynamic>> containerData =  [
    {
      'isRecommendation': true,
      'duration': '30 days',
      'price': 2000.0, // Ensure this is a double
      'leads': 200,
      'reach': 50000,
      'platforms': [
        'assets/facebook.png',
        'assets/add_images/insta.png',
      ],
      'aiImages': 5,
    },
    {
      'isRecommendation': false,
      'duration': '15 days',
      'price': 1000.0, // Ensure this is a double
      'leads': 100,
      'reach': 25000,
      'platforms': [
        'assets/facebook.png',
        'assets/add_images/insta.png',
      ],
      'aiImages': 3,
    },
    {
      'isRecommendation': false,
      'duration': '15 days',
      'price': 1000.0, // Ensure this is a double
      'leads': 100,
      'reach': 25000,
      'platforms': [
        'assets/facebook.png',
        'assets/add_images/insta.png',
      ],
      'aiImages': 3,
    },
    {
      'isRecommendation': false,
      'duration': '15 days',
      'price': 1000.0, // Ensure this is a double
      'leads': 100,
      'reach': 25000,
      'platforms': [
        'assets/facebook.png',
        'assets/add_images/insta.png',
      ],
      'aiImages': 3,
    },
    {
      'isRecommendation': false,
      'duration': '15 days',
      'price': 1000.0, // Ensure this is a double
      'leads': 100,
      'reach': 25000,
      'platforms': [
        'assets/facebook.png',
        'assets/add_images/insta.png',
      ],
      'aiImages': 3,
    },
    // Add more containers as needed
  ];
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return                       Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: containerData.length,
        itemBuilder: (context, index) {
          final data = containerData[index];
          return CustomContainerWidget(
            isRecommendation: data['isRecommendation'],
            duration: data['duration'],
            price: data['price'], // Ensure this is a double
            index: index,
            selectedValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
            leads: data['leads'],
            reach: data['reach'],
            platforms: data['platforms'],
            aiImages: data['aiImages'],
          );
        },
      ),
    )
    ;
  }
}

class BudgetSelecter extends StatefulWidget {
  String icon;
  String budget;
  BudgetSelecter({super.key, required this.icon, required this.budget});

  @override
  State<BudgetSelecter> createState() => _BudgetSelecterState();
}

class _BudgetSelecterState extends State<BudgetSelecter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 0, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration:  BoxDecoration(
                  border: Border(
                      right: BorderSide(color: Colors.grey))),
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              child: Image.asset(
                widget.icon,
                height: SC.from_width(20),
              )),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.budget,style: Theme.of(context).textTheme.displaySmall,),
          )),
          Container(
            height: SC.from_width(27),
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            padding: const EdgeInsets.symmetric(
                horizontal: 0, vertical: 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      widget.budget= (int.parse(widget.budget)-1).toString();
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                      child: Image.asset(
                        'assets/minus.png',
                        width: SC.from_width(15),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.budget= (int.parse(widget.budget)+1).toString();
                    });
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      // color: Theme.of(context).iconTheme.color,
                        border: Border(
                            left: BorderSide(color: Colors.grey))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Center(
                          child: Image.asset(
                            'assets/add.png',
                            width: SC.from_width(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
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
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: MyHelper.appConstent.infoContainerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: SC.from_width(10), vertical: SC.from_width(10)),
        margin: EdgeInsets.symmetric(vertical: SC.from_width(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.info_outline_rounded, color: Colors.black,),
            SizedBox(
              width: SC.from_width(10),
            ),
            SizedBox(
              width: SC.Screen_width * 0.82,
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: title,
                        style: Theme.of(context).textTheme.displayMedium),
                    TextSpan(
                        text: subTitle,
                        style: Theme.of(context).textTheme.displaySmall),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SC.from_width(30),
      width: SC.from_width(90),
      child: OutlinedButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.call),
            SizedBox(
              width: SC.from_width(5),
            ),
            Text(
              'Help?',
              style: MyHelper.textStyls.leadTileWhiteText,
            ),
          ],
        ),
        onPressed: () {},
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
          backgroundColor:
          MaterialStatePropertyAll(MyHelper.appConstent.primeryColor),
          foregroundColor:
          MaterialStateProperty.resolveWith((states) => Colors.white),
          fixedSize: const MaterialStatePropertyAll(Size(120, 25)),
          side: const MaterialStatePropertyAll(BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}