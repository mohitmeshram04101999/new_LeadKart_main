import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/Models/business_model.dart';
import 'package:leadkart/component/flatIconns.dart';import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';import 'package:leadkart/them/constents.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/Models/ad_type_model.dart';

import '../helper/dimention.dart';


class AddREquirmentTile extends StatelessWidget {
  Widget icon;
  AdvertisementTypeModel advertisementTypeModel;
  AddREquirmentTile({required this.icon, required this.advertisementTypeModel,super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: SC.from_width(8)),
      onTap: () async {
        bool create = await  Controllers.businessProvider(context,listen: false).currentBusiness?.isFacebookPageLinked==true;
        if(create)
          {
            Controllers.allPlansProvider(context).selectAddPlane(advertisementTypeModel);
            GoRouter.of(context).pushNamed('getNewLeads');
          }else
            {
              Controllers.businessProvider(context,listen: false).showWarning(context);
            }
      },
      leading: CircleAvatar(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        radius: SC.from_height(25),
        child: CachedNetworkImage(
          imageUrl: advertisementTypeModel.image ?? "",
          errorWidget: (context, url, error) =>
              const Icon(Icons.image_not_supported),
        ),
      ),
      title: Text(
        advertisementTypeModel.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style:
            TextStyle(fontSize: SC.from_width(13), fontWeight: FontWeight.w500),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            advertisementTypeModel.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: SC.from_width(13),
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          ),
          SizedBox(
            height: SC.from_height(5),
          ),
          Row(
            children: [
              //
              //
              if (advertisementTypeModel.isFacebook)
                FlatIcon(
                  icon: FlatIcons.faceBook,
                  size: 15,
                ),
              const SizedBox(
                width: 5,
              ),

              if (advertisementTypeModel.isInstagram)
                FlatIcon(
                  icon: FlatIcons.instagram,
                  size: 15,
                ),
              const SizedBox(
                width: 5,
              ),

              //
              //
              if (advertisementTypeModel.isGoogle)
                FlatIcon(
                  icon: FlatIcons.google,
                  size: 20,
                ),
            ],
          )
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
