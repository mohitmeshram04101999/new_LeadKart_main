import 'package:flutter/material.dart';

import '../helper/helper.dart';

class ShederIcon extends StatelessWidget {
  IconData iconData;
  ShederIcon({required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: ShaderMask(
            shaderCallback: (b){
              return LinearGradient(colors: [
                MyHelper.appConstent.OnbordingAppBar.withOpacity(1),
                Color.fromRGBO(78, 168, 255, 1)
              ]).createShader(b);
            },
            child: CircleAvatar(),
          ),
        ),
        Center(child: Icon(iconData,color: Colors.white,))
      ],
    );
  }
}
