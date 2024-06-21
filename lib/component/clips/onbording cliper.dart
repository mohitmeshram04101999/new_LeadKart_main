
import 'package:flutter/cupertino.dart';

class OnbordingAppBarClip extends CustomClipper<Path>
{
  @override
  Path getClip(Size s) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(s.width, 0);
    path.lineTo(s.width, s.height-60);
    path.quadraticBezierTo((s.width/4)*3,s.height,s.width/2, s.height, );
    path.quadraticBezierTo((s.width/4),s.height,0, s.height-60, );
    // path.lineTo(s.width/2, s.height);
    path.lineTo(0, s.height-60);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}