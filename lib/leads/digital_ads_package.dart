
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/component/optioChip.dart';
import 'package:leadkart/controllers/LeadeDetaileProvider.dart';
import 'package:leadkart/function/flunction.dart';import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/controllerInstances.dart';import 'package:leadkart/them/constents.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leadkart/component/sheder%20Iocn.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class DigitalAdsPackage extends StatefulWidget {
  const DigitalAdsPackage({super.key});

  @override
  State<DigitalAdsPackage> createState() => _DigitalAdsPackageState();
}

class _DigitalAdsPackageState extends State<DigitalAdsPackage> {
  final List<String> eventNames = [
    'Recent Activities',
    'Followup via WhatsApp',
    'Followup via call but Not connected',
    'Followup via call ',
    'Status Changed: Intrested',
    'Followup via call ',
    'Followup via WhatsApp',
    'Status Changed: Not Connected',
    'Noted Added',
    'Status Changed: Intrested',
  ];
  final List<String> eventNamess = [
    '22-09-2022',
    '22-09-2022',
    '22-09-2022',
    '22-09-2022',
    '22-09-2022',
    '22-09-2022',
    '22-09-2022',
    '22-09-2022',
    '22-09-2022',
    '',
  ];

  final Map leadType = {
    'INTERESTED':"Interested",
    'NOT_INTERESTED':"Not interested",
    'CONVERTED':"Converted",
    'VISITED':"Visited",
    'NOT_ANSWERED':"Not answered",
    'IN_PROGRESS': "In progress",
    'UNQUALIFIED':"Unqualified",
    'NOT_CONNECTED':"Not connected",
  };



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return PopScope(

      onPopInvoked: (d){
        Controllers.leadDetailProvider(context,listen: false).clear();
      },

        child: Scaffold(

          //


          //
          appBar: AppBar(
            title: const  Text('Digital ads package'),
          ),

          //
          //Consumer LeadProvider
          body: Consumer<LeadDetailProvider>(

            builder: (a,p,c){

              if(p.loading)
                {
                  return const  Center(child:CircularProgressIndicator());
                }

              return ListView(
                padding: EdgeInsets.symmetric(horizontal: SC.fromWidth(18)),
                children: [

                  SizedBox(
                    height: SC.fromHeight(35),
                  ),

                  // IMAGE //
                  Container(
                    // decoration: BoxDecoration(border: Border.all()),
                    width: double.infinity,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(p.lead?.name??"Unknown",style: TextStyle(fontSize: SC.fromWidth(24),color: Colors.grey.shade700,fontWeight: FontWeight.w500),),
                              const SizedBox(height: 3,),
                              Text(p.lead?.userContactNumber??"Contact Number is not available",style: TextStyle(fontSize: SC.fromWidth(27),color: Colors.grey.shade700,fontWeight: FontWeight.w500),),
                              const SizedBox(height: 3,),
                              Text(p.lead?.leadStatus!=null?
                              p.lead!.leadStatus!.capitalizeFirst.toString().replaceAll("_", " "):
                              "No Data",
                                style: TextStyle(fontSize: SC.fromWidth(27),color: Colors.grey.shade700,fontWeight: FontWeight.w500),),
                              SizedBox(height: SC.fromHeight(40),),

                              Row(
                                children: [
                                  ShederIcon(
                                    onTap: ()async {
                                      String? number = p.lead?.userContactNumber;
                                      if(number!=null)
                                        {
                                          makePhoneCall(number);
                                        }
                                      else
                                        {
                                          MyHelper.mySnakebar(context, "Can't Call");
                                        }
                                    },
                                      iconData: Icons.call),
                                  const SizedBox(width: 8,),
                                  ShederIcon(
                                    onTap:() {
                                      String? number = p.lead?.whatsappNumber??p.lead?.userContactNumber;
                                      if(number!=null)
                                      {
                                        openWhatsAppChat(number);
                                      }
                                      else
                                      {
                                        MyHelper.mySnakebar(context, "Can't open Chat number is not available");
                                      }
                                    },
                                      iconData: FontAwesomeIcons.whatsapp),
                                  const SizedBox(width: 8,),
                                  ShederIcon(iconData: FontAwesomeIcons.message),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                            height: SC.fromHeight(5.5),
                            width: SC.fromWidth(3),
                            // height: SC.fromHeight(10),
                            child: Image.asset('assets/img_12.png',fit: BoxFit.cover,))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SC.fromHeight(35),
                  ),


                  // CHOOSE ADS DIGITAL //
                  Text(
                    'Choose Ads and Digital',
                    style: TextStyle(
                        fontSize: SC.fromWidth(20), fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: SC.fromHeight(55),
                  ),

                  Wrap(
                    children: [
                      for(String i in leadType.keys)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 3),
                          child: OptionChip(
                            onTap: (){p.updateLeadStatus(context, i);},
                            label: leadType[i],
                            active: p.lead?.leadStatus==i,
                          ),
                        )
                    ],
                  ),

                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(
                    height: SC.fromHeight(75),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Follow UP',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SC.fromWidth(25),
                            color: Colors.grey.shade700),
                      ),
                      Text(
                        'Set Follow UP',
                        style: TextStyle(
                            fontSize: SC.fromWidth(25),
                            fontWeight: FontWeight.w500,
                            color: AppConstent().primeryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SC.fromHeight(75),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    contentPadding: const  EdgeInsets.all(0),
                    title: Text(
                      'Notes',
                      style: TextStyle(
                          fontSize: SC.fromWidth(23),
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                    p.lead?.note??"Not is Empty \u{1F5D1}",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          'Add Notes',
                          style: TextStyle(
                              fontSize: SC.fromWidth(25),
                              color: AppConstent().primeryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SC.from_height(5),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(
                    height: SC.from_height(10),
                  ),
                  Text(
                    'Timeline',
                    style: TextStyle(fontSize: SC.fromWidth(20)),
                  ),
                  ListView.builder(
                    itemCount: eventNames.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),


                            child:  Text(
                              eventNames[index],
                              style: TextStyle(
                                fontSize: SC.fromWidth(26),
                                fontWeight: FontWeight.bold,
                                color: index == 0 ? AppConstent().primeryColor : Colors.grey.shade700,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: SC.fromWidth(20),bottom:5),
                            width: 1,
                            height: SC.fromHeight(15),
                            color: Colors.grey.shade400,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              eventNamess[index],
                              style: const  TextStyle(color: Colors.grey),
                            ),
                          ),

                        ],
                      );
                    },
                  )
                ],
              );
            },
          ),
        ));

  }
}
