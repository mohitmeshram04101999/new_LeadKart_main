import 'package:flutter/material.dart';
import 'package:leadkart/component/leadeTile.dart';
import 'package:leadkart/component/messageText.dart';
import 'package:leadkart/component/optioChip.dart';
import 'package:leadkart/controllers/leadeProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/shimmers.dart';
import 'package:leadkart/them/constents.dart';
import 'package:leadkart/them/typs.dart';
import 'package:provider/provider.dart';

import '../../leads/digital_ads_package.dart';

class LeadScreen extends StatefulWidget {
  const LeadScreen({super.key});

  @override
  State<LeadScreen> createState() => _LeadScreenState();
}

class _LeadScreenState extends State<LeadScreen> {
  List<String> filters = [
    "All",
    "Pending",
    "In-progress",
    "follow on interested"
  ];
  List<String> selectedLeads = [];
  bool isCheckboxVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // //floting Action Button for Testing
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   Controllers.leadsProvider(context,listen: false).getLeads(context);
      //
      // },),

      //AppBar
      appBar: AppBar(
        titleSpacing: 20,

        //titel
        title: const Text("Leads"),
      ),
      floatingActionButton: selectedLeads.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  // false = user must tap button, true = tap outside dialog
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: Text('title'),
                      content: Text('dialogBody'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop(); // Dismiss alert dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              label: Text("Assign Leads"))
          : null,
      //Body OF Screen
      body: RefreshIndicator(
        onRefresh: () async {
          await Controllers.leadsProvider(context).getLeads(context);
        },
        child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 10),
          children: [
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   child: Customsearchfeald(
            //
            //   ),
            // ),

            //titelButtons
            Consumer<LeadsProvider>(builder: (a, p, c) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: AppConstent().horizontalPedding,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: OptionChip(
                          onTap: () {
                            p.filter(context, "ALL");
                          },
                          active: p.filterType == "ALL",
                          label: 'All',
                        ),
                      ),
                      for (MapEntry i in translater.entries)
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: OptionChip(
                            onTap: () {
                              p.filter(context, i.key);
                            },
                            active: p.filterType == i.key,
                            label: '${i.value}',
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),

            SizedBox(
              height: SC.fromHeight(70),
            ),

            FutureBuilder(
                future: Controllers.leadsProvider(context, listen: false)
                    .getLeads(context),
                builder: (context, snapshot) {
                  return Consumer<LeadsProvider>(
                    builder: (a, p, c) {
                      if (!p.isLoad || p.filterIsOn) {
                        return leadeTileLodingView();
                      }
                      if (p.allLeads.isEmpty) {
                        return const Messagetext(data: "No List For Business");
                      }

                      // return Text("sdf");
                      return ListView.builder(
                        itemCount: p.allLeads.length,
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (a, b) {
                          var lead = p.allLeads[b];
                          return Row(
                            children: [
                              isCheckboxVisible
                                  ? Checkbox(
                                      value:
                                          selectedLeads.contains(lead.id ?? ""),
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            selectedLeads.add(lead.id ?? "");
                                          } else {
                                            selectedLeads.remove(lead.id ?? "");
                                          }
                                        });
                                      },
                                    )
                                  : const SizedBox(),
                              InkWell(
                                onLongPress: () {
                                  setState(() {
                                    isCheckboxVisible = true;
                                  });
                                },
                                child: SizedBox(
                                  width: isCheckboxVisible
                                      ? SC.fromWidth(1.2)
                                      : SC.fromWidth(1),
                                  child: LeadeTile(
                                    onTap: () {
                                      Controllers.leadDetailProvider(context,
                                              listen: false)
                                          .loadLeadDetail(
                                              context: context,
                                              leadId: lead.id ?? "");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LeadDetailsScreen()));
                                    },
                                    lead: lead,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
