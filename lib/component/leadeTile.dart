import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:leadkart/Models/LeadsApiresponce.dart';
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
      height: 120,
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
            padding: EdgeInsets.only(left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Leading
                // Container(
                //   clipBehavior: Clip.hardEdge,
                //   margin: EdgeInsets.all(SC.from_width(8)),
                //   width: SC.from_width(69),
                //   decoration: BoxDecoration(
                //       border: Border.all(color: Colors.grey.shade300, width: 2),
                //       borderRadius: BorderRadius.circular(5)),
                //   child: Stack(
                //     children: [
                //       Image.asset(
                //         "assets/onBording2/leadTileImage.png",
                //         fit: BoxFit.cover,
                //       ),
                //       Align(
                //         alignment: Alignment.bottomCenter,
                //         child: Container(
                //           height: SC.from_width(17),
                //           color: Colors.black.withOpacity(.5),
                //           width: double.infinity,
                //           alignment: Alignment.center,
                //           child: Text(
                //             "See detail",
                //             style: TextStyle(
                //                 fontSize: SC.from_width(8.7),
                //                 color: Colors.white),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                Column(
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

                    Text(
                        "Added - ${MyHelper.formatDateTime(lead?.createdTime ?? DateTime.now())}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles().leadTileSubTitle),
                    lead?.assignUser != null
                        ? Text(
                            "Assigned to - ${lead?.assignUser?.name ?? "No User"}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles().leadTileSubTitle)
                        : Text("Assigned to - No User",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles().leadTileSubTitle),
                  ],
                ),
                Spacer(),
                AspectRatio(
                    aspectRatio: 1.3,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppConstent().leadTiletagColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(32))),
                          child: Text(
                            "${leadTyps[lead?.leadStatus]}",
                            style: TextStyle(
                                fontSize: SC.from_width(12),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                            child: ShederIcon(
                          iconData: Icons.call_outlined,
                          onTap: () {
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
