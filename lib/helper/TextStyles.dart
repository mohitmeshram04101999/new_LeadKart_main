import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';


class TextStyles
{
  TextStyle onBordingMainText = TextStyle(fontSize: SC.from_width(20),fontWeight: FontWeight.w600);
  TextStyle onBordingSubTitle = TextStyle(fontSize: SC.from_width(16),fontWeight: FontWeight.w500,color: Color.fromRGBO(96, 96, 96, 1));
  TextStyle leadTileTitle = TextStyle(fontSize: SC.from_width(20),fontWeight: FontWeight.w700,color: Color.fromRGBO(2, 2, 2, 1));
  TextStyle leadTileSubTitle = TextStyle(fontSize: SC.from_width(14),fontWeight: FontWeight.w700,color: Color.fromRGBO(176, 176, 176, 1));
  TextStyle leadTileWhiteText = TextStyle(fontSize: SC.from_width(15),fontWeight: FontWeight.w400,color: Colors.white);
  TextStyle mediumText = TextStyle(fontSize: SC.from_width(15),fontWeight: FontWeight.w400,color: Colors.black);
  TextStyle smallText = TextStyle(fontSize: SC.from_width(12),fontWeight: FontWeight.w400,color: Color.fromRGBO(98, 98, 98, 1));
  TextStyle smallBoldText = TextStyle(fontSize: SC.from_width(15),fontWeight: FontWeight.bold,color: Color.fromRGBO(98, 98, 98, 1));
  TextStyle greenMediumText = TextStyle(fontSize: SC.from_width(15),fontWeight: FontWeight.bold,color: AppConstent().primeryColor);
  TextStyle blackSmallText = TextStyle(fontSize: SC.from_width(12),fontWeight: FontWeight.w400,color: Colors.grey);
  TextStyle actionButtonStyle =  TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: SC.from_width(19));
}