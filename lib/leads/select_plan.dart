import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/component/select_plan_widget.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/payment_details.dart';
import 'package:leadkart/screens/leads/getNewLeads.dart';

class SelectPlan extends StatefulWidget {
  const SelectPlan({Key? key}) : super(key: key);

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {

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
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Select a Plan',style: TextStyle(fontSize: SC.from_height(21)),),
        actions: [
          HelpButton(),
          SizedBox(width: SC.from_height(21),)
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: SC.from_height(18)),
        children: [
          SizedBox(height: SC.from_height(15),),

          // RECOMMENDATION //

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 5),
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
          ),



          SizedBox(height: SC.from_height(20),),
          // GFBUTTON //

          CustomButton(
            text: 'Proceed to Payment', onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetails()));
          },
          ),

          SizedBox(height: SC.from_height(20),),

        ],
      ),
    );
  }
}
