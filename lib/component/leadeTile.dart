import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leadkart/Models/LeadsApiresponce.dart';
import 'package:leadkart/component/flatIconns.dart';
import 'package:leadkart/component/sheder%20Iocn.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:url_launcher/url_launcher.dart';

class LeadeTile extends StatelessWidget {
  final Lead? lead;
  double elevation;
  bool demo;
  void Function()? onTap;
  LeadeTile(
      {this.demo = false,
      this.lead,
      this.onTap,
      this.elevation = .5,
      super.key});

  @override
  Widget build(BuildContext context) {
    log('${lead?.assignUser?.name}');
    return SizedBox(
      height: SC.from_width(110),
      // width: 200,
      child: Card(
        elevation: elevation,
        surfaceTintColor: Colors.transparent,
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(horizontal: SC.from_width(6), vertical: 5),
        child: InkWell(
          splashColor: AppConstent().leadsBannerColor,
          onTap: onTap,
          child: Container(
            // height: SC.from_width(80),
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Leading
                Container(
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.all(SC.from_width(0)),
                  width: SC.from_width(69),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/onBording2/leadTileImage.png",
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: SC.from_width(17),
                          color: Colors.black.withOpacity(.5),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            "See detail",
                            style: TextStyle(
                                fontSize: SC.from_width(8.7),
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //
                SizedBox(width:5,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  color: Colors.grey.withOpacity(.4,),width: 2,height: double.infinity,),
                SizedBox(width:5,),
                //

                Expanded(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Text(lead?.name ?? "Demo Lead",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyles().leadTileTitle),
                    //subtitle
                    Text(
                        lead?.userContactNumber ??
                            lead?.whatsappNumber ??
                            "${demo ? "+91 7470765984" : "No Contact number"}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles().leadTileSubTitle),

                    // Text(
                    //     "Added - ${MyHelper.formatDateTime(lead?.createdTime ?? DateTime.now())}",
                    //     maxLines: 1,
                    //     overflow: TextOverflow.ellipsis,
                    //     style: TextStyles().leadTileSubTitle),
                    // lead?.assignUser != null
                    //     ? Text("Assigned to - ${lead?.assignUser?.mobile}",
                    //         maxLines: 1,
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyles().leadTileSubTitle)
                    //     : Text("Assigned to - No User",
                    //         maxLines: 1,
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyles().leadTileSubTitle),

                    SizedBox(height: SC.from_width(8),),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 240, 240, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8) ,
                            bottomRight: Radius.circular(8) ,
                          )
                      ),
                      child: Text("${leadTyps[lead?.leadStatus]??"Lead Status"}",
                        style: TextStyle(fontWeight: FontWeight.w700,fontSize: SC.from_width(12)),),
                    )
                  ],
                ),)
                 ,
                AspectRatio(
                    aspectRatio: 1,
                    child: Column(
                      children: [
                        Expanded(
                            child: IconButton(
                          icon: Image.asset(FlatIcons.callOutline,height: 22,),
                          onPressed: () {
                            launch("tel: ${lead?.userContactNumber ?? ""}");
                          },
                        )),
                      ],
                    ))
              ],
            ),
          ),

        ),
      ),
    );
  }
}
