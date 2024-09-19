import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/helpButton.dart';
import 'package:leadkart/controllers/businessProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

import '../helper/dimention.dart';


class CustomAppBar extends StatelessWidget {
  Widget? trailingButton ;
  CustomAppBar({this.trailingButton,super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading:const SizedBox(),
      leadingWidth: 0,

      title: Row(
        children: [
          const SizedBox(width: 10,),
          Consumer<BusinessProvider>(builder:(a,p,c)=> CircleAvatar(
            backgroundImage:  NetworkImage(p.currentBusiness?.businessImage??""),
            child: p.currentBusiness?.businessImage!="null"?null:const Icon(Icons.image),
          )),
          const SizedBox(width: 10,),
          FutureBuilder(
            future:
            Provider.of<BusinessProvider>(context, listen: false).lode(context),
            builder: (context, snapshot) => InkWell(
              onTap: () {
                MyHelper.mybottomPanel(
                    context: context,
                    builder: (context3, d) {
                      return Consumer<BusinessProvider>(
                        builder: (context2, value, child) {
                          if (value.loding) {
                            return const Center(child: CircularProgressIndicator());
                          }

                          if (value.allBusiness.length == 0) {

                            return const  Center(
                                child: Text("No Business Found"));
                          }


                          return ListView(
                            controller: d,
                            children: [

                              Align(
                               alignment: Alignment.centerRight ,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ElevatedButton(onPressed: (){
                                      Navigator.pop(context);
                                      context.pushNamed("createBusinessScreen");
                                    }, child: const Text("Add a Business")),
                                  )),

                              for(var business in value.allBusiness)
                                ListTile(

                                  //Color
                                  tileColor: (business.id==value.currentBusiness?.id)?AppConstent().primeryColor.withOpacity(.15):null,

                                  //Subtitle of TIle
                                  subtitle: SelectableText(business.id.toString(),style: TextStyle(color: Colors.grey.shade500),),

                                  //lead
                                  leading: AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                      margin: const EdgeInsets.all(6),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        color: AppConstent().primeryColor,
                                        shape: BoxShape.circle
                                      ),
                                      child:CachedNetworkImage(
                                        fit:BoxFit.cover,
                                          imageUrl:business.businessImage??"",
                                        errorWidget: (a,b,e)=> const Icon(Icons.image,color: Colors.white,),
                                      ),
                                    ),
                                  ),

                                  //title
                                  title: Text(
                                      '${business.businessName}'),

                                  //trailing
                                  trailing:(business.id==value.currentBusiness?.id)? Icon(Icons.check_circle,color: AppConstent().primeryColor,):null,

                                  //onTap
                                  onTap: () {
                                    var p = Provider.of<BusinessProvider>(context,
                                        listen: false);

                                        p.setCurrentBusiness(context,
                                        business);

                                        Navigator.pop(context2);
                                    if(business.isFacebookPageLinked!=true)
                                      {
                                        p.showWarning(context);
                                      }


                                  },
                                )

                            ],
                          );

                        },
                      );
                    });
              },
              child: Consumer<BusinessProvider>(
                  builder: (context, value, child) {
                    if (value.currentBusiness==null && value.loding) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (value.allBusiness.length == 0)
                      return const Text("No Business Found");
                    if (value.allBusiness.length > 0 &&
                        value.currentBusiness == null) {
                      Future.wait([
                        Provider.of<BusinessProvider>(context, listen: false)
                            .lode(context)
                      ]).then(
                            (e) {
                          value.setCurrentBusiness(context,value.allBusiness[0]);
                        },
                      );
                    }
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${value.currentBusiness == null ? "No Business Selected" : value.currentBusiness!.businessName}",
                          style: TextStyle(
                              color: Colors.white, fontSize: SC.from_height(18)),
                        ),
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                      ],
                    );
                  }),
            ),
          ),
          const Spacer(),
          // SizedBox(width: SC.from_width(50)),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: trailingButton,
          ),
        ],
      ),
    );
  }
}
