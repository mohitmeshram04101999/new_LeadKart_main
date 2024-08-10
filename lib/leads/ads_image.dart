import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/ApiServices/adsApi.dart';
import 'package:leadkart/Models/addListByBussnesIdModel.dart';
import 'package:leadkart/controllers/addListByBussnessProvider.dart';import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/shimmers.dart';import 'package:leadkart/them/constents.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leadkart/component/custom_page_route.dart';
import 'package:leadkart/component/demo_ad_widget.dart';
import 'package:leadkart/component/helpButton.dart';
import 'package:leadkart/component/recommendation_widget.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/select_plan.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

import '../component/customAppBar.dart';


class AdsPage extends StatefulWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  int _selectedValue = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controllers.addListByBusinessProvider(context).load(context);
  }
// DEMO ADD //

  final List<Map<String, dynamic>> demoAds = [
    {
      'dateRange': '01 May to 10 May, 2023',
      'adLabel': 'Demo Ad',
      'mainText': 'Get New leads',
      'mainTextColor': AppConstent().primeryColor,
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

  final addLoading = const  AddTileLoading();



  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      //App Bar
      appBar:PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            trailingButton: HelpButton(),
          )),
      //

      //body
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal:SC.from_height(17) ),
        child: ListView(
          children: [

            const SizedBox(height: 10,),
            Text('How ads report will look',style: TextStyle(fontSize: SC.from_height(17),fontWeight: FontWeight.w600),),
            SizedBox(height: SC.from_height(7),),
            Text('You can see your ad performance in real time',style: TextStyle(fontSize: SC.from_height(15),color: Colors.grey.shade500,fontWeight: FontWeight.w500),),


            DemoAdWidget(add: AddByBuinesss(
              id: "6694c0012d938ab030433868",
              businessId: "6694c0012d938ab030433868",
              creativeId: "120210216520580477",
              externalCampiagnId: "66879f2b9cc7c8273dfd0901",
              title: "bhupendra",
              status: "FINISHED",
              addTypeId: AddTypeId(
                id: "aslkdfhlkjasdf",
                title: "Tis is Example Add"
              ),
              imageHashId: "e328b8704443814c0138d19cf4442a4d",
              isCallToActionEnabled: false,
              image:"https://satyakabirbucket.ap-south-1.linodeobjects.com/LEADKART/IMAGE/1721650468238_WhatsApp%20Image%202024-07-18%20at%2012.35.08%20PM.jpeg",
              audienceId: [],
              interest: ["6018341976753"],
              location: "",
              startDate: "Mon, 12 Aug 2024, 10:40 AM",
              endDate: "Mon, 12 Aug 2024, 10:40 AM",
              totalImpression: 19819,
              totalClicks: 310,
              totalSpendBudget: 660,
              totalLeads: 0
            ),isDemo: true,),

            SizedBox(height: SC.from_height(15),),

            Text('Your created Ads report',style: TextStyle(fontSize: SC.from_height(17),fontWeight: FontWeight.w600),),
            // SizedBox(height: SC.from_height(7),),
            // Text('You can see your ad performance in real time',style: TextStyle(fontSize: SC.from_height(15),color: Colors.grey.shade500,fontWeight: FontWeight.w500),),

            SizedBox(height: SC.from_height(20),),

            // DEMO ADD //

            Consumer<AddListByBusinessProvider>(builder: (a,p,c){

              if(p.loding)
                {
                  return addLoading;
                }
              if(p.allAdds.isEmpty)
                {
                  return const Center(child: Text("NO Data"),);
                }

              var allAds = p.allAdds;



              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allAds.length,
                itemBuilder: (context, index) {
                  final ad = allAds[index];
                  return DemoAdWidget(add: ad,);
                },
              );
            }),


            SizedBox(height: SC.from_height(20),),

            // Row(
            //   children: [
            //     Text('Select a Package',style: TextStyle(fontSize: SC.from_height(18),fontWeight: FontWeight.w500),),
            //     Spacer(),
            //     Text('See More',style: TextStyle(color: AppConstent().primeryColor,fontSize: SC.fromWidth(27),fontWeight: FontWeight.w600),),
            //   ],
            // ),

            // SizedBox(height: SC.from_height(15),),


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
                        CustomAnimation(page: SelectPlan(), transitionType: TransitionType.FadeThrough),
                      );

                    },

                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => SelectPlan()),
                    //   );
                    // },
                  ),
                );
              },
            ),

            // SizedBox(height: SC.from_height(18),),

          ],
        ),
      ),
    );
  }
}
