import 'package:flutter/material.dart';
import 'package:leadkart/Models/business_model.dart';import 'package:leadkart/helper/TextStyles.dart';
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
        // bool create = await  Controllers.businessProvider(context,listen: false).showWarning(context);
        // if(create)
        //   {
        //     GoRouter.of(context).pushNamed('getNewLeads');
        //   }
        Controllers.allPlansProvider(context).selectAddPlane(advertisementTypeModel);
        GoRouter.of(context).pushNamed('getNewLeads');
      },
      leading: CircleAvatar(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        radius:SC.from_height(25),
        child: Center(child: advertisementTypeModel.image==null? icon:Image.asset(advertisementTypeModel.image??"",fit: BoxFit.contain,)),
      ),

      title: Text(advertisementTypeModel.title,maxLines: 1,overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: SC.from_width(13),fontWeight: FontWeight.w500),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(advertisementTypeModel.description,maxLines: 1,overflow: TextOverflow.ellipsis
            ,style: TextStyle(fontSize: SC.from_width(13),fontWeight: FontWeight.w500,color: Colors.grey),),
          SizedBox(height: SC.from_height(5),),
          Row(
            children: [
              //
              //
              if(advertisementTypeModel.isFacebook)
                Container(
                width: SC.from_height(16),
                height: SC.from_height(16),
                child: Image.asset('assets/facebook.png'),
              ),
              SizedBox(width: SC.from_height(8),),

              //
              //
              if(advertisementTypeModel.isFacebook)
              Container(
                width: SC.from_height(20),
                height: SC.from_height(20),
                child: Image.asset('assets/google.png'),
              ),
            ],
          )
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
