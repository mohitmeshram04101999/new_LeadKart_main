import 'package:flutter/material.dart';


class FlatIcons
{
  static String replaceImage = "assets/flatiocns/replaceImage.png";
  static String editImage = "assets/flatiocns/edit-image.png";
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
