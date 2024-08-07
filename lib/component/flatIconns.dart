import 'package:flutter/material.dart';


class FlatIcons
{
  static String replaceImage = "assets/flatiocns/replaceImage.png";
  static String editImage = "assets/flatiocns/edit-image.png";
  static String whatsApp = "assets/flatiocns/whatsApp.png";
  static String web = "assets/flatiocns/web.png";
  static String playStore = "assets/flatiocns/playStor.png";
  static String people = "assets/flatiocns/people.png";
  static String call = "assets/flatiocns/call.png";
}





class FlatIcon extends StatelessWidget {
  final String icon;
  final double? size;
  const FlatIcon({this.size,required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(icon,width: size,height: size,);
  }
}
