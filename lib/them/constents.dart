
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leadkart/helper/dimention.dart';



//AppConstent().primeryColor

class AppConstent
{

  //New Primer Color
  final Color primeryColor = const Color.fromRGBO(123, 110, 228, 1);

  final themeGradiant =  LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(123, 110, 228, .1),
        Colors.white
      ]
  );

  //Old PrimerColor
  // final Color primeryColor = const Color.fromRGBO(36, 238, 221, 1);

  final Color normalTextColor =  const Color.fromRGBO(91, 91, 91, 1);
  final Color infoContainerColor = const Color.fromRGBO(236, 253, 243, 1);
  final Color leadsBannerColor = const Color.fromRGBO(199, 224, 254, 1);
  final Color iconContainerColor = const Color.fromRGBO(235, 240, 253, 1);
  final Color OnbordingAppBar = const Color.fromRGBO(8 , 101, 192, .1);
  final Color leadTiletagColor = const Color.fromRGBO(74, 157, 238, .6);
  final Color checkBoxColor = const Color.fromRGBO(87, 42, 200, 1);
  final Color dottedBorderColor = const Color.fromRGBO(217, 217, 217, 1);
  final Duration offset = const Duration(minutes: 165);
 final Color secondaryColor = const Color.fromRGBO(254, 76, 28, 1);
  final EdgeInsets horizontalPedding = EdgeInsets.symmetric(horizontal: SC.fromWidth(20),vertical: SC.from_width(10));
  
  static TextStyle labelStyle(BuildContext context) =>TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: SC.from_width(20)
  );

  static TextStyle labelStyle2(BuildContext context) => TextStyle(
      fontSize: SC.from_height(18),
      fontWeight: FontWeight.w500);

  static TextStyle labelStyleBig(BuildContext context) => TextStyle(
      fontSize: SC.from_height(24),
      fontWeight: FontWeight.w700);

  static TextStyle heading(BuildContext context,{Color? color}) => TextStyle(
    color: color,
      fontSize: SC.from_height(16),
      fontWeight: FontWeight.w700
  );


}


final Map leadTyps = {
  'INTERESTED':"Interested",
  'NOT_INTERESTED':"Not interested",
  'CONVERTED':"Converted",
  'VISITED':"Visited",
  'NOT_ANSWERED':"Not answered",
  'IN_PROGRESS': "In progress",
  'UNQUALIFIED':"Unqualified",
  'NOT_CONNECTED':"Not connected",
};

final Map translate = {
  "INTERESTED":"Interested",
  "NOT_INTERESTED":"Not Interested",
  "CONVERTED":"Converted",
  "LOST":"Lost",
  "VISITED":"Visited",
  "NOT_ANSWERED":"Not Answered",
  "IN_PROGRESS":"In-Progress",
  "UNQUALIFIED":"Unqualified",
  "NOT_CONNECTED":"Not Connected",
  "NEW":"Lead is Added",
  "NOTE_ADDED":"Note Added",
  "OFFER_SENT":"Offer Sent",
  "WHATSAAP_FOLLOWUP":"Followup via Whatsapp",
  "CALL_FOLLOWUP":"Followup via Call",
  "FOLLOW_UP_DATE_SET":"Date Set for Followup",
  "LEAD_CONTACT_CHANGES":"Lead Contact Details Changed",
  "SMS_SENT":"Followup via SMS",
};

final Map historyType = {
  "ACTIONTYPE":{

  },
  "STATUSCHANGE":{

  }
};