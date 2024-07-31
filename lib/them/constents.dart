
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leadkart/helper/dimention.dart';

class AppConstent
{
  Color primeryColor = const Color.fromRGBO(36, 238, 221, 1);
  Color normalTextColor =  const Color.fromRGBO(91, 91, 91, 1);
  Color infoContainerColor = const Color.fromRGBO(236, 253, 243, 1);
  Color leadsBannerColor = const Color.fromRGBO(199, 224, 254, 1);
  Color iconContainerColor = const Color.fromRGBO(235, 240, 253, 1);
  Color OnbordingAppBar = const Color.fromRGBO(8 , 101, 192, .1);
  Color leadTiletagColor = const Color.fromRGBO(74, 157, 238, .6);
  Color checkBoxColor = const Color.fromRGBO(87, 42, 200, 1);
  Color dottedBorderColor = const Color.fromRGBO(217, 217, 217, 1);
  Duration offset = const Duration(minutes: 165);
 Color secondaryColor = const Color.fromRGBO(235, 240, 253, 1);
  EdgeInsets horizontalPedding = EdgeInsets.symmetric(horizontal: SC.fromWidth(20),vertical: SC.from_width(10));
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
  "INTERESTED":"Status Changed: Interested",
  "NOT_INTERESTED":"Status Changed: Not Interested",
  "CONVERTED":"Status Changed: Converted",
  "LOST":"Status Changed: Lost",
  "VISITED":"Status Changed: Visited",
  "NOT_ANSWERED":"Status Changed: Not Answered",
  "IN_PROGRESS":"Status Changed: In-Progress",
  "UNQUALIFIED":"Status Changed: Unqualified",
  "NOT_CONNECTED":"Status Changed: Not Connected",
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