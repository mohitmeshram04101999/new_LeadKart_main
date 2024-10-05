
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leadkart/them/constents.dart';
import 'package:shimmer/shimmer.dart';

import 'helper/dimention.dart';

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
  return ListView(
    shrinkWrap: true,
    primary: false,
    physics: const NeverScrollableScrollPhysics(),
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
  final Widget? child;
  const ContainerShimmer({this.child,this.decoration,this.height,this.width,super.key});

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
        child:  child,
      ), );
  }
}


//
//
class AddTypeTileShimmer extends StatelessWidget {
  const AddTypeTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const  ListTile(
      leading: ContainerShimmer(
        width: 50,
        decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red),
      ),

      title: ContainerShimmer(height: 10,),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          ContainerShimmer(height: 10,),
          SizedBox(height: 5,),
          ContainerShimmer(height: 10,width: 50,),
        ],
      ),

      trailing:ContainerShimmer(height: 30,width: 30,),


    );
  }
}

Widget addTypeLoading()
{
  return Column(children: [
    for(int i =0;i<5;i++)
      const AddTypeTileShimmer(),

  ],);
}

class PlanTileShimmer extends StatelessWidget {
  const PlanTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  const  ContainerShimmer(
      height: 130,
      width: double.infinity,
    );
  }
}




class AddTileLoading extends StatelessWidget {
  const AddTileLoading({super.key});

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.symmetric(horizontal: SC.from_height(2),vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0.2,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Shimmer.fromColors(baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade500, child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: SC.from_height(10), top: SC.from_height(10)),
                child: Text(
                  "date",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: SC.from_height(14.5)),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: SC.from_height(8)),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(233, 233, 233, 1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(SC.from_height(12)),
                    bottomLeft: Radius.circular(SC.from_height(15)),
                  ),
                ),
                height: SC.from_height(28),
                width: SC.from_height(70),
                child: Center(
                  child: Text(
                    "Demo ad",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: SC.fromWidth(33)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SC.from_height(4)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SC.fromWidth(30)),
            child: Row(
              children: [
                Text(
                  "Get new leads",
                  style: TextStyle(color: AppConstent().primeryColor, fontWeight: FontWeight.w600, fontSize: SC.from_height(17)),
                ),
                SizedBox(width: SC.fromWidth(11.5)),
                ShaderMask(shaderCallback: (a){
                  return  const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.yellow,

                        Color(0xfffd1d1d),
                        Color(0xffc13584),
                        Color(0xff405de6)

                      ]).createShader(a);
                },child: const Icon(FontAwesomeIcons.squareInstagram,color: Colors.white,),),
                const SizedBox(width: 5,),
                const Icon(FontAwesomeIcons.facebookF,color: Color.fromRGBO(1, 101, 225, 1),),
              ],
            ),
          ),
          SizedBox(height: SC.from_height(12)),
          Padding(
            padding: EdgeInsets.only(
              left: SC.fromWidth(25),
              right: SC.fromWidth(34),
              bottom: SC.fromWidth(25),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  width: SC.from_width(124),
                  height: SC.from_height(124),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(SC.from_height(10))),
                  child: ContainerShimmer(),
                ),
                const SizedBox(width: 10,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ad Views', ),
                    Text('Leads'),
                    Text('Spent'),
                    Text('Clicks'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: SC.from_height(12)),
            child: Column(
              children: [
                InkWell(
                  onTap: (){},
                  child: Text(
                    'View Reports',
                    style: TextStyle(
                      color:  AppConstent().primeryColor,
                      // fontSize: SC.from_height(15),
                      fontSize: SC.fromWidth(27),
                    ),
                  ),
                ),
                Container(
                  height: SC.from_height(1),
                  width: SC.from_height(85),
                  child: Divider(thickness: 1, color: AppConstent().primeryColor),
                ),
              ],
            ),
          ),
          SizedBox(height: SC.from_height(20)),
        ],
      )),
    );



    return Card(
      child: Column(
        children: [
          ContainerShimmer(height: 10,),
          SizedBox(height: 5,),
          ContainerShimmer(height: 20,child: SizedBox(width: 130,),),
          Row(
            children: [
              ContainerShimmer(height: 100,width: 100,),
              Column(
                children: [
                  ContainerShimmer(height: 10,),
                  SizedBox(height: 3,),
                  ContainerShimmer(height: 10,child: SizedBox(width: 130,),),
                  SizedBox(height: 3,),
                  ContainerShimmer(height: 10,child: SizedBox(width: 130,),),
                  SizedBox(height: 3,),
                  ContainerShimmer(height: 10,child: SizedBox(width: 130,),),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}



