import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leadkart/ApiServices/adsApi.dart';
import 'package:leadkart/Models/faq_responce_model.dart';
import 'package:leadkart/controllers/FaqProvider.dart';
import 'package:leadkart/controllers/creaetAddProvider.dart';
import 'package:leadkart/controllers/offeringTile.dart';import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/leads/create_ads_page.dart';
import 'package:leadkart/shimmers.dart';import 'package:leadkart/them/constents.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/business_pages/growBusinessFaster.dart';
import 'package:leadkart/component/PlanTileview.dart';
import 'package:leadkart/component/select_plan_widget.dart';
import 'package:leadkart/controllers/AllPlansProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

import '../../component/helpButton.dart';
import '../../helper/dimention.dart';

class GetNewLeads extends StatefulWidget {
  const GetNewLeads({super.key});

  @override
  State<GetNewLeads> createState() => _GetNewLeadsState();
}

class _GetNewLeadsState extends State<GetNewLeads> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controllers.allPlansProvider(context,listen: false).clear();
    Controllers.createAddProvider(context,listen: false).clear();
    Controllers.allPlansProvider(context, listen: false).load(context);
  }




  @override
  Widget build(BuildContext context) {


    print("Build Method is Called set State {}");
    return WillPopScope(
      onWillPop: ()async{
        Controllers.allPlansProvider(context,listen: false).clear();
        Controllers.createAddProvider(context,listen: false).clear();
        return true;
      },
      child: Scaffold(

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


        floatingActionButton:  SizedBox(
          width:double.infinity ,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed("createAdd");
              },
              child: const Text('Next'),
            ),
          ),
        ),

        appBar: AppBar(
          backgroundColor: AppConstent().primeryColor,
          foregroundColor: Colors.white,
          title: const Text('Get New Leads'),

          actions: [  Padding(
            padding: const EdgeInsets.all(8.0),
            child: HelpButton(),
          )],

        ),

        body: Consumer<CreateAddProvider>(
          builder: (a,p,c)=>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:  SingleChildScrollView(
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value:( p.plan==null&&p.faceBookBudgetController!=0), onChanged: (value) {
                        if(value!)
                          {
                           p.incFacebookBudget();
                          }
                        else
                          {
                            p.clearFaceBookBudget();
                          }
                      }),
                      BudgetSelecter(
                        onDec: ()=>p.decFacebookBudget(),
                        onInc: ()=>p.incFacebookBudget(),
                        icon: 'assets/facebook_wbg.png',
                        budget:p.faceBookBudgetController.toInt().toString(),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: SC.from_width(10),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: p.plan==null&&p.instBudgetController!=0, onChanged: (value) {
                        if(value!)
                        {
                          p.incInstBudget();
                        }
                        else
                          {
                            p.clearInstBudget();

                          }
                      }),
                      BudgetSelecter(
                        onInc: ()=>p.incInstBudget(),
                        onDec: ()=>p.decInstBudget(),
                        icon: 'assets/instagram_wbg.png',
                        budget:'${p.instBudgetController.toInt()}',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SC.fromContextWidth(context, 20),
                  ),


                  
                  
                  
                  Consumer<Allplansprovider>(
                    builder: (a,p,c){
                      if(p.allPlans.isEmpty)
                        {
                          return const SizedBox();
                        }
                      return  Column(
                        children: [
                          const Text("OR"),
                          SizedBox(
                            height: SC.fromContextWidth(context, 20),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Select a Plan",style: Theme.of(context).textTheme.displayMedium,),
                            ),
                          ),
                        ],
                      );
                    },
                    
                  ),



                  const SizedBox(
                    height: 5,
                  ),
                  // LeadSelecter(),


                  Consumer<Allplansprovider>(builder: (a,p1,c){


                    if(p1.initing)
                    {
                      return Column(
                        children: [
                          for(int i = 0;i<5;i++)
                            const Padding(
                              padding:  EdgeInsets.all(8.0),
                              child:  ContainerShimmer(
                                height: 120,
                                width: double.infinity,
                              ),
                            )
                        ],
                      );
                    }

                    if(p1.allPlans.isEmpty)
                    {
                      return const SizedBox();
                    }

                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false
                        ,itemCount: p1.allPlans.length,
                        itemBuilder: (a,i)=>Plantileview(
                            data: p1.allPlans[i]
                        )
                    );
                  }),



                  const SizedBox(
                    height: 5,
                  ),

                  if(p.plan!=null&& p.offers.isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Package includes",style: Theme.of(context).textTheme.displayMedium,),
                    ),
                  ),

                 if(p.loadingOffer)
                   ContainerShimmer(height: 150,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(8)
                 ),
                 ),


                 const  SizedBox(
                    height: 5,
                  ),



                  //
                  //List Of Offers
                  if(p.plan!=null&& p.offers.isNotEmpty&&p.loadingOffer!=true)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for(var i in p.offers)
                          OfferTile(offer: i),
                      ],
                    ),
                  ),


                   if(p.estimatedData!=null)
                   ExtimateResultCard(data: p.estimatedData!,totalBudget: p.plan!=null?(p.plan?.facebookBudget??0)+(p.plan?.instaBudget??0): (p.faceBookBudgetController+p.instBudgetController).toInt(),),

                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Package Frequently asked Questions",style: Theme.of(context).textTheme.displayMedium,),
                    ),
                  ),

                  FutureBuilder(
                      future: Controllers.faqProvider(context).getAllFaq(context,type: "ADD_PLAN"),
                      builder: (context,snap){
                        return Consumer<FaqProvider>(builder: (a,p,c){


                          if(p.loading)
                          {
                            return const Center(child: CircularProgressIndicator(),);
                          }
                          if(snap.hasError)
                          {
                            return Center(child: Text("${snap.error} \n${snap.stackTrace}"),);
                          }

                          if(snap.data==null||snap.data?.length==0)
                          {
                            return const Center(child: Text("No Data Found"),);
                          }

                          return  ListView.builder(
                            shrinkWrap: true, // Prevent excessive scrolling
                            physics: const NeverScrollableScrollPhysics(), // Disable scrolling if needed
                            itemCount: snap.data?.length,
                            itemBuilder: (context, index) {

                              Question question = snap.data![index];

                              return ExpansionTile(
                                childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
                                title: Text(question.question??"",style: TextStyle(fontWeight: FontWeight.w500),),
                                children: [
                                  Text(question.answer??"",
                                    style: TextStyle(
                                      fontSize: SC.from_width(16),
                                    ),),
                                  // ListTile(
                                  //   title: Text(question.answer??""),
                                  // ),
                                ],
                              );
                            },


                          );
                        });

    }
                  ),

                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
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
    },    {
      'isRecommendation': false,
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

class PackageCards extends StatelessWidget {
  const PackageCards({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardData =  [
      {
        'image':"assets/add_images/img_3.png",
        'title':"AI Images",
        'desc':"Our AI generative tool will create images for your business"
      },
      {
        'image':"assets/add_images/img_3.png",
        'title':"AI Content",
        'desc':"Our AI tool will generate tittle, call to action and suggested audience."
      }
      // Add more containers as needed
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: cardData.length,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,

              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 5,
                  ),
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("${cardData[index]['image']}", width: 40,),
                    Text("${cardData[index]['title']}", style:Theme.of(context).textTheme.titleMedium),
                    Flexible(child: Text("${cardData[index]['desc']}", style:Theme.of(context).textTheme.titleSmall))
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}


class BudgetSelecter extends StatelessWidget {
  String icon;
  String budget;
  void Function()? onInc;
  void Function()? onDec;
  BudgetSelecter({required this.onInc,required this.onDec,super.key, required this.icon, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: SC.fromContextWidth(context, 1.25),
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
                  icon,
                  height: SC.from_width(20),
                )),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(budget,style: Theme.of(context).textTheme.displaySmall,),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
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
                        onTap:onDec,
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
                        onTap: onInc,
                        child: Container(
                          decoration:  BoxDecoration(
                            color: Theme.of(context).colorScheme.onSecondary,
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
                ),
              ),
            )
          ],
        ),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppConstent().infoContainerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: SC.from_width(10), vertical: SC.from_width(10)),
          // margin: EdgeInsets.symmetric(vertical: SC.from_width(10)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline_rounded, color: Colors.black,),
              SizedBox(
                width: SC.from_width(10),
              ),
              Flexible(
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
      ),
    );
  }
}



