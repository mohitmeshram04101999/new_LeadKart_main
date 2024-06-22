import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leadkart/component/sheder%20Iocn.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';

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

  final List<String> outlinebutton = [
    'Intrested',
    'Not connection',
    'Done',
    'In progress',
    'Visited',
    'Not Answer',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital ads package'),
      ),
      body: ListView(
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
                      Text('Demo Lead 2',style: TextStyle(fontSize: SC.fromWidth(24),color: Colors.grey.shade700,fontWeight: FontWeight.w500),),
                      SizedBox(height: 3,),
                      Text('+9110101010',style: TextStyle(fontSize: SC.fromWidth(27),color: Colors.grey.shade700,fontWeight: FontWeight.w500),),
                      SizedBox(height: 3,),
                      Text('Intrested',style: TextStyle(fontSize: SC.fromWidth(27),color: Colors.grey.shade700,fontWeight: FontWeight.w500),),
                      SizedBox(height: SC.fromHeight(40),),

                      Row(
                        children: [
                          ShederIcon(iconData: Icons.call),
                          SizedBox(width: 8,),
                          ShederIcon(iconData: FontAwesomeIcons.whatsapp),
                          SizedBox(width: 8,),
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
              for( var i in outlinebutton)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(onPressed: (){}, child: Text(i,style: TextStyle(fontSize: SC.fromWidth(28)),)),
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
                    color: MyHelper.appConstent.primeryColor),
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
            contentPadding: EdgeInsets.all(0),
            title: Text(
              'Notes',
              style: TextStyle(
                  fontSize: SC.fromWidth(23),
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              'Talk to him and he is instrested in our services',
              style: TextStyle(color: Colors.grey.shade700),
            ),
            trailing: Column(
              children: [
                Text(
                  'Add Notes',
                  style: TextStyle(
                      fontSize: SC.fromWidth(25),
                      color: MyHelper.appConstent.primeryColor,
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
            physics: NeverScrollableScrollPhysics(),
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
                        color: index == 0 ? MyHelper.appConstent.primeryColor : Colors.grey.shade700,
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
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                ],
              );
            },
          )
        ],
      ),
    );
  }
}
