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
      leading: SizedBox(),
      leadingWidth: 0,

      title: Row(
        children: [
          SizedBox(width: 10,),
          Consumer<BusinessProvider>(builder:(a,p,c)=> CircleAvatar(
            backgroundImage:  NetworkImage(p.currentBusiness?.businessImage??""),
            child: p.currentBusiness?.businessImage!="null"?null:Icon(Icons.image),
          )),
          SizedBox(width: 10,),
          FutureBuilder(
            future:
            Provider.of<BusinessProvider>(context, listen: false).lode(),
            builder: (context, snapshot) => InkWell(
              onTap: () {
                MyHelper.mybottomPanel(
                    context: context,
                    builder: (context, d) {
                      return Consumer<BusinessProvider>(
                        builder: (context, value, child) {
                          if (value.loding) {
                            return Center(child: CircularProgressIndicator());
                          }
                          MyHelper.logger.i(value.allBusiness.length);
                          return ListView.builder(
                            controller: d,
                            itemCount: value.allBusiness.length,
                            itemBuilder: (context, index) {

                              if (value.allBusiness.length == 0) {

                                return Center(
                                    child: Text("No Business Found"));
                              }
                              var business =  value.allBusiness[index];


                              return ListTile(

                                //lead
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(business.businessImage.toString()),
                                  child: business.businessImage==null?null:Icon(Icons.image),
                                ),

                                //title
                                title: Text(
                                    '${value.allBusiness[index].businessName}'),

                                //trailing
                                trailing:(business.id==value.currentBusiness?.id)? Icon(Icons.check_circle,color: AppConstent().primeryColor,):null,

                                //onTap
                                onTap: () {
                                  Provider.of<BusinessProvider>(context,
                                      listen: false)
                                      .setCurrentBusiness(
                                      value.allBusiness[index]);
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
                      return Center(child: CircularProgressIndicator());
                    }
                    if (value.allBusiness.length == 0)
                      return Text("No Business Found");
                    if (value.allBusiness.length > 0 &&
                        value.currentBusiness == null) {
                      Future.wait([
                        Provider.of<BusinessProvider>(context, listen: false)
                            .lode()
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
                        Icon(Icons.arrow_drop_down, color: Colors.white),
                      ],
                    );
                  }),
            ),
          ),
          Spacer(),
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
