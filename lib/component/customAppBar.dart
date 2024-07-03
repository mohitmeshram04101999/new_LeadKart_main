import 'package:flutter/material.dart';
import 'package:leadkart/component/helpButton.dart';
import 'package:leadkart/controllers/businessProvider.dart';
import 'package:leadkart/helper/helper.dart';
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
          Container(
            clipBehavior: Clip.hardEdge,
            width: SC.from_width(40),
            height: SC.from_height(30),
            decoration: BoxDecoration(
              // border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/home_images/img.png',
            ),
          ),
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

                              return ListTile(
                                title: Text(
                                    '${value.allBusiness[index].businessName}'),
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
