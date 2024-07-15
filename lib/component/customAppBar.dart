import 'package:flutter/material.dart';
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
                    builder: (context, d) {
                      return Consumer<BusinessProvider>(
                        builder: (context, value, child) {
                          if (value.loding) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                            controller: d,
                            itemCount: value.allBusiness.length,
                            itemBuilder: (context, index) {

                              if (value.allBusiness.length == 0) {

                                return const  Center(
                                    child: Text("No Business Found"));
                              }
                              var business =  value.allBusiness[index];

                              return ListTile(

                                //Color
                                tileColor: (business.id==value.currentBusiness?.id)?AppConstent().primeryColor.withOpacity(.15):null,

                                //Subtitle of TIle
                                subtitle: Text(business.isFacebookPageLinked.toString(),style: TextStyle(color: Colors.grey.shade500),),

                                //lead
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(business.businessImage??""),
                                  child: business.businessImage==null?null:const Icon(Icons.image),
                                ),

                                //title
                                title: Text(
                                    '${business.businessName}'),

                                //trailing
                                trailing:(business.id==value.currentBusiness?.id)? Icon(Icons.check_circle,color: AppConstent().primeryColor,):null,

                                //onTap
                                onTap: () {
                                  Provider.of<BusinessProvider>(context,
                                      listen: false)
                                      .setCurrentBusiness(
                                      business);
                                },
                              );
                            },
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
                          value.setCurrentBusiness(value.allBusiness[0]);
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
