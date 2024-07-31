
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LeadTileShimmer extends StatelessWidget {
  LeadTileShimmer({super.key});

  final grad = LinearGradient(colors: [
    Colors.grey.shade300,
    Colors.grey.shade700,
  ]);
  @override
  Widget build(BuildContext context) {
    return   ListTile(
      dense: true,
      leading: Shimmer(gradient:grad ,child:  AspectRatio(aspectRatio: 1.1,child: Container(
        color: Colors.red,
      ),),),

      title: Shimmer(gradient: grad,child: Container(color: Colors.red,height: 10),),

      subtitle: Column(
        children: [
          const SizedBox(height: 5,),
          Shimmer(gradient: grad,child: Container(color: Colors.red,height: 6),),
          const SizedBox(height: 5,),
          Shimmer(gradient: grad,child: Container(color: Colors.red,height: 6),),
        ],
      ),

      trailing: Shimmer(gradient: grad,child: const  CircleAvatar(),),

    );
  }
}


Widget leadeTileLodingView()
{
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      for(int i = 0;i<10;i++)
        LeadTileShimmer()
    ],
  );
}



class ContainerShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  const ContainerShimmer({this.decoration,this.height,this.width,super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(colors: [
      Colors.grey.shade300,
      Colors.grey.shade500,
    ]),
      child: Container(
        height: height,
        width: width,
        decoration: decoration??const BoxDecoration(color: Colors.red),
      ), );
  }
}

