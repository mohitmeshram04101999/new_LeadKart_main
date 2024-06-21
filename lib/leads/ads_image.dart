import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leadkart/component/demo_ad_widget.dart';
import 'package:leadkart/component/recommendation_widget.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/select_plan.dart';


class AdsPage extends StatefulWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  int _selectedValue = 1;
// DEMO ADD //

  final List<Map<String, dynamic>> demoAds = [
    {
      'dateRange': '01 May to 10 May, 2023',
      'adLabel': 'Demo Ad',
      'mainText': 'Get New leads',
      'mainTextColor': MyHelper.appConstent.primeryColor,
      'platformIcons': [
        'assets/facebook.png',
        'assets/add_images/insta.png',
      ],
      'imagePath': 'assets/add_images/9.png',
      'reach': 50000,
      'leads': 180,
      'spent': 456,
      'clicks': 456,
      'onViewReportsTap': () {
        // Define the function here or pass a custom function
      },
    },
    // Add more demo ads as needed
  ];

  final List<Map<String, dynamic>> recommendations = [
    {
      'title': 'Recommendation',
      'description': 'Get New Leads',
      'duration': '30 days',
      'leads': 2000,
      'reach': 5000,
      'platforms': [
        'assets/facebook.png',
        'assets/add_images/insta.png',
      ],
    },
    {
      'title': 'Recommendation',
      'description': 'Increase Your Reach',
      'duration': '60 days',
      'leads': 5000,
      'reach': 10000,
      'platforms': [
        'assets/facebook.png',
        'assets/add_images/insta.png',
      ],
    },
    // Add more recommendations as needed
  ];

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        leading: SizedBox(),
        leadingWidth: 0,

        title: Container(
          clipBehavior: Clip.hardEdge,
          width: SC.from_height(30),
          height: SC.from_height(30),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            'assets/home_images/img.png',
          ),
        ),
        actions: [
          DropdownButton<String>(
            dropdownColor: Color.fromRGBO(36, 238, 221, 0.6),
            hint: Text(
              " SK e solution  ",
              style: TextStyle(color: Colors.white, fontSize: SC.from_height(18)),
            ),
            value: dropdownValue,
            icon: Transform.rotate(
              angle: 1.5708, // 90 degrees in radians (π/2 or 1.5708 radians)
              child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,size: SC.from_height(17)),
            ),
            iconSize: SC.from_height(22),
            elevation: 16,
            style: TextStyle(color: Colors.black),
            underline: Container(), // Remove the underline
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue;
                // Handle the selected option here
                print('Selected: $dropdownValue');
              });
            },

            items: <String>['SK e solution 1 ', 'SK e solution 2 ', 'SK e solution 3 ']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(

                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.white, fontSize: SC.from_height(19.5)),
                ),
              );
            }).toList(),
          ),

          SizedBox(width: SC.from_width(50)),

    Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call_outlined,size:  SC.from_height(17),color: Colors.white,),
              SizedBox(width: SC.from_height(4),),
              Center(child: Text('Help ?',style: TextStyle(fontSize: SC.from_height(16),color: Colors.white),),),
            ],
          ),
          width: SC.from_height(85),
          height: SC.from_height(30),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(SC.from_height(15)),border: Border.all(
              color: Colors.white
          )),
        ),
          SizedBox(width: SC.from_height(20)),
        ],
      ),
      // backgroundColor: Colors.white,
      // appBar:  AppBar(
      //   leading: SizedBox(),
      //   leadingWidth: 0,
      //
      //   title: Container(
      //     clipBehavior: Clip.hardEdge,
      //     width: SC.from_height(30),
      //     height: SC.from_height(30),
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     child: Image.asset(
      //       'assets/home_images/img.png',
      //     ),
      //   ),
      //   actions: [
      //     DropdownButton<String>(
      //       hint: Text(
      //         " SK e solution  ",
      //         style: TextStyle(color: Colors.white, fontSize: SC.from_height(18)),
      //       ),
      //       value: dropdownValue,
      //       icon: Transform.rotate(
      //         angle: 1.5708, // 90 degrees in radians (π/2 or 1.5708 radians)
      //         child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,size: SC.from_height(17)),
      //       ),
      //       iconSize: SC.from_height(22),
      //       elevation: 16,
      //       style: TextStyle(color: Colors.black),
      //       underline: Container(), // Remove the underline
      //       onChanged: (String? newValue) {
      //         setState(() {
      //           dropdownValue = newValue;
      //           // Handle the selected option here
      //           print('Selected: $dropdownValue');
      //         });
      //       },
      //       items: <String>['SK e solution 1 ', 'SK e solution 2 ', 'SK e solution 3 ']
      //           .map<DropdownMenuItem<String>>((String value) {
      //         return DropdownMenuItem<String>(
      //           value: value,
      //           child: Text(
      //             value,
      //             style: TextStyle(color: Colors.white, fontSize: SC.from_height(18)),
      //           ),
      //         );
      //       }).toList(),
      //     ),
      //
      //     SizedBox(width: SC.from_height(60)),
      //
      //     Container(
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Icon(Icons.call_outlined,size:  SC.from_height(17),),
      //           SizedBox(width: SC.from_height(4),),
      //           Center(child: Text('Help ?',style: TextStyle(fontSize: SC.from_height(16),color: Colors.white),),),
      //         ],
      //       ),
      //       width: SC.from_height(85),
      //       height: SC.from_height(30),
      //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(SC.from_height(15)),border: Border.all(
      //           color: Colors.white
      //       )),
      //     ),
      //     SizedBox(width: SC.from_height(20)),
      //   ],
      // ),
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal:SC.from_height(17) ),
        child: ListView(
          children: [

            SizedBox(height: SC.from_height(15),),

            Text('How ads report will look',style: TextStyle(fontSize: SC.from_height(17),fontWeight: FontWeight.w600),),
            SizedBox(height: SC.from_height(7),),
            Text('You can see your ad performance in real time',style: TextStyle(fontSize: SC.from_height(15),color: Colors.grey.shade500,fontWeight: FontWeight.w500),),

            SizedBox(height: SC.from_height(20),),

            // DEMO ADD //

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: demoAds.length,
              itemBuilder: (context, index) {
                final ad = demoAds[index];
                return DemoAdWidget(
                  dateRange: ad['dateRange'],
                  adLabel: ad['adLabel'],
                  mainText: ad['mainText'],
                  mainTextColor: ad['mainTextColor'],
                  platformIcons: ad['platformIcons'],
                  imagePath: ad['imagePath'],
                  reach: ad['reach'],
                  leads: ad['leads'],
                  spent: ad['spent'],
                  clicks: ad['clicks'],
                  onViewReportsTap: ad['onViewReportsTap'],
                );
              },
            ),


            SizedBox(height: SC.from_height(20),),

            Row(
              children: [
                Text('Select a Package',style: TextStyle(fontSize: SC.from_height(18),fontWeight: FontWeight.w500),),
                Spacer(),
                Text('See More',style: TextStyle(color: MyHelper.appConstent.primeryColor,fontSize: SC.fromWidth(27),fontWeight: FontWeight.w600),),
              ],
            ),

            SizedBox(height: SC.from_height(15),),


            //  RECOMENDATION //
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                final recommendation = recommendations[index];
                return Padding(
                  padding:   EdgeInsets.symmetric(vertical: 10.0),
                  child: RecommendationWidget(
                    title: recommendation['title'],
                    description: recommendation['description'],
                    duration: recommendation['duration'],
                    leads: recommendation['leads'],
                    reach: recommendation['reach'],
                    platforms: recommendation['platforms'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SelectPlan()),
                      );
                    },
                  ),
                );
              },
            ),

            SizedBox(height: SC.from_height(18),),

          ],
        ),
      ),
    );
  }
}
