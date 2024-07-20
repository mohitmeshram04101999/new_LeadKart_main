import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/dimention.dart';import 'package:leadkart/them/constents.dart';
import 'package:leadkart/them/constents.dart';

import '../helper/helper.dart';

class ShederIcon extends StatelessWidget {
  IconData iconData;
  ShederIcon({required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SC.fromWidth(10),
      width: SC.fromWidth(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: ShaderMask(
              shaderCallback: (b){
                return LinearGradient(colors: [
                  AppConstent().OnbordingAppBar.withOpacity(1),
                  Color.fromRGBO(78, 168, 255, 1)
                ]).createShader(b);
              },
              child: CircleAvatar(),
            ),
          ),
          Center(child: Icon(iconData,color: Colors.white,))
        ],
      ),
    );
  }
}
