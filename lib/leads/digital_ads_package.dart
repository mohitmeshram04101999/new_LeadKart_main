import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:leadkart/component/customBackground.dart';
import 'package:leadkart/component/optioChip.dart';
import 'package:leadkart/component/sheder%20Iocn.dart';
import 'package:leadkart/controllers/LeadeDetaileProvider.dart';
import 'package:leadkart/controllers/leadeProvider.dart';
import 'package:leadkart/function/flunction.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/shimmers.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

import '../controllers/SubUserProvider.dart';

class LeadDetailsScreen extends StatefulWidget {
  const LeadDetailsScreen({super.key});

  @override
  State<LeadDetailsScreen> createState() => _LeadDetailsScreenState();
}

class _LeadDetailsScreenState extends State<LeadDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var myAlphaLoading = true;

  final divider = Divider(
    thickness: 1,
    color: Colors.grey.shade400,
  );

  String selectedLeadId = '';
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: PopScope(

          //
          onPopInvoked: (d) {
            Controllers.leadDetailProvider(context, listen: false).clear();
          },
          child: Scaffold(
            floatingActionButton: kDebugMode
                ? FloatingActionButton(
                    onPressed: () {
                      Controllers.leadDetailProvider(context)
                          .getHistory(context);
                    },
                  )
                : null,

            backgroundColor: Colors.transparent,

            //
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              title: const Text('Lead Details'),
            ),

            //
            //Consumer LeadProvider
            body: Consumer<LeadDetailProvider>(
              builder: (a, p, c) {
                // if(p.loading)
                //   {
                //     return const  Center(child:CircularProgressIndicator());
                //   }

                return ListView(
                  padding: EdgeInsets.symmetric(horizontal: SC.fromWidth(18)),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                // false = user must tap button, true = tap outside dialog
                                builder: (BuildContext dialogContext) {
                                  return AlertDialog(
                                    title: Text('Assign Leads'),
                                    content: SizedBox(
                                        // height: 300,
                                        // width: 300,
                                        child: Consumer<SubUserProvider>(
                                            builder: (a, p, c) {
                                      log('ggfgf${p.subUsers}');
                                      return DropdownMenu(
                                        dropdownMenuEntries: [
                                          for (var i in p.subUsers)
                                            DropdownMenuEntry(
                                                value: i['userId']['_id'],
                                                label: i['userId']['mobile']
                                                    .toString())
                                        ],
                                        onSelected: (value) {
                                          setState(() {
                                            selectedLeadId = value;
                                          });
                                        },
                                      );
                                    })),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Assign'),
                                        onPressed: () {
                                          Provider.of<LeadDetailProvider>(
                                                  context,
                                                  listen: false)
                                              .assignLeads(
                                                  context: context,
                                                  leadId: selectedLeadId,
                                                  leadIds: [p.lead!.id!]);
                                        },
                                      ),
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
                            child: Text("Assign Lead"))
                      ],
                    ),
                    SizedBox(
                      height: SC.fromHeight(35),
                    ),

                    // IMAGE //
                    SizedBox(
                      // decoration: BoxDecoration(border: Border.all()),
                      width: double.infinity,

                      child: Card(
                        margin: EdgeInsets.zero,
                        clipBehavior: Clip.hardEdge,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 8, top: 16, bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  // padding: EdgeInsets.all(value),
                                  clipBehavior: Clip.hardEdge,
                                  width: SC.from_width(120),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  // height: SC.fromHeight(10),
                                  child: (p.loading)
                                      ? const ContainerShimmer()
                                      : Image.asset(
                                          'assets/img_12.png',
                                          fit: BoxFit.cover,
                                        )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (p.loading)
                                      ? const ContainerShimmer(
                                          height: 15,
                                          width: 120,
                                        )
                                      : Text(
                                          p.lead?.name ?? "Unknown",
                                          style: TextStyle(
                                              fontSize: SC.from_width(16),
                                              fontWeight: FontWeight.w700),
                                        ),

                                  //

                                  (p.loading)
                                      ? const ContainerShimmer(
                                          height: 15,
                                          width: 120,
                                        )
                                      : Text(
                                          p.lead?.userContactNumber ??
                                              "Contact Number is not available",
                                          style: TextStyle(
                                              fontSize: SC.from_width(16),
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w500),
                                        ),
                                  const SizedBox(
                                    height: 8,
                                  ),

                                  //
                                  (p.loading)
                                      ? const ContainerShimmer(
                                          height: 15,
                                          width: 120,
                                        )
                                      : Row(
                                          children: [
                                            Text(
                                              "Status : ",
                                              style: TextStyle(
                                                  fontSize: SC.from_width(16),
                                                  color: Color.fromRGBO(
                                                      119, 119, 119, 119),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 3),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color.fromRGBO(
                                                      141, 141, 141, 1)),
                                              child: Text(
                                                p.lead?.leadStatus != null
                                                    ? p.lead!.leadStatus!
                                                        .capitalizeFirst
                                                        .toString()
                                                        .replaceAll("_", " ")
                                                    : "No Data",
                                                style: TextStyle(
                                                    fontSize: SC.from_width(12),
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),

                                  //

                                  // (p.loading)
                                  //     ? const ContainerShimmer(
                                  //         height: 50, width: 120)
                                  //     : Row(
                                  //         children: [
                                  //           ShederIcon(
                                  //               onTap: () async {
                                  //                 String? number =
                                  //                     p.lead?.userContactNumber;
                                  //                 if (number != null) {
                                  //                   makePhoneCall(number);
                                  //                 } else {
                                  //                   MyHelper.mySnakebar(
                                  //                       context, "Can't Call");
                                  //                 }
                                  //               },
                                  //               iconData: Icons.call),
                                  //           const SizedBox(
                                  //             width: 8,
                                  //           ),
                                  //           ShederIcon(
                                  //               onTap: () {
                                  //                 String? number =
                                  //                     p.lead?.whatsappNumber ??
                                  //                         p.lead?.userContactNumber;
                                  //                 if (number != null) {
                                  //                   openWhatsAppChat(number);
                                  //                 } else {
                                  //                   MyHelper.mySnakebar(context,
                                  //                       "Can't open Chat number is not available");
                                  //                 }
                                  //               },
                                  //               iconData:
                                  //                   FontAwesomeIcons.whatsapp),
                                  //           const SizedBox(
                                  //             width: 8,
                                  //           ),
                                  //           ShederIcon(
                                  //               iconData: FontAwesomeIcons.message),
                                  //         ],
                                  //       )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SC.fromHeight(35),
                    ),

                    //Lead Status Card
                    Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            //
                            Text(
                              'Choose Ads and Digital',
                              style: TextStyle(
                                  fontSize: SC.fromWidth(20),
                                  fontWeight: FontWeight.w500),
                            ),

                            SizedBox(height: SC.from_width(15),),

                            //


                            //
                            p.loading
                                ? const ContainerShimmer(
                                    height: 30,
                                  )
                                : DropdownButtonFormField(
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: SC.from_width(16)),
                                  value: p.lead?.leadStatus,
                                  decoration: InputDecoration(

                                    //
                                      fillColor: Color.fromRGBO(232, 232, 232, .5),

                                      //
                                      filled: true,

                                      //
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(10))),
                                  onChanged: (d) {
                                    if (d != null) {
                                      p.updateLeadStatus(context, d);
                                    }
                                  },
                                  items: [
                                    for (String i in leadTyps.keys)
                                      DropdownMenuItem(value: i, child: Text(i)),
                                  ],
                                ),


                            // p.loading
                            //     ? const ContainerShimmer(
                            //         height: 30,
                            //       )
                            //     : Wrap(
                            //         children: [
                            //           for (String i in leadTyps.keys)
                            //             Padding(
                            //               padding: const EdgeInsets.symmetric(
                            //                   horizontal: 4, vertical: 3),
                            //               child: OptionChip(
                            //                 onTap: () {
                            //                   p.updateLeadStatus(context, i);
                            //                 },
                            //                 label: leadTyps[i],
                            //                 active: p.lead?.leadStatus == i,
                            //               ),
                            //             )
                            //         ],
                            //       ),
                          ],
                        ),
                      ),
                    ),
                    // CHOOSE ADS DIGITAL //
                    
                    SizedBox(
                      height: SC.fromHeight(75),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //
                            Text(
                              'Next Follow Up?',
                              style: AppConstent.heading(context)),

                            //
                            InkWell(
                              onTap: () {
                                p.updateFollowUp(context);
                              },
                              child: Ink(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppConstent().secondaryColor,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text(
                                  'Set Follow UP',
                                  style: AppConstent.heading(context,color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //
                    SizedBox(
                      height: SC.fromHeight(75),
                    ),


                    Text("${p.noteController.text}"),

                    //
                    Card(
                      margin: EdgeInsets.zero,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        title: Row(
                          children: [
                            Text(
                              'Notes ',
                              style: AppConstent.heading(context),
                            ),
                            Text( "(Write down the Imp things)",style:TextStyle(
                              fontSize: SC.from_width(14),
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(126, 126, 126, 1),
                            ),)
                          ],
                        ),
                        
                        //
                        subtitle: (p.loading)
                            ? const ContainerShimmer(height: 50)
                            : Text(
                          // p.lead?.note??"Not is Empty \u{1F5D1}",
                          p.lead?.note ?? "Note is Empty",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),

                        trailing: IconButton(
                          onPressed: (){
                            p.updateNote(context);
                          },
                            icon: Icon(Icons.edit)),

                      ),
                    ),

                    //
                    FutureBuilder<dynamic>(
                      future: Provider.of<LeadsProvider>(context)
                          .listOfLeadAssignUser(context, p.lead?.id ?? ""),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("Loading...");
                        }
                        if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        dynamic data = snapshot.data!['data'];
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Provider.of<LeadDetailProvider>(context,
                                        listen: false)
                                    .getAssignHistory(context, p.lead!.id!,
                                        data[index]['userId']['_id']);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "Assign to: ${data[index]['userId']['mobile']}"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          (p.loading)
                                              ? const ContainerShimmer(
                                                  height: 20, width: 120)
                                              : Consumer<LeadDetailProvider>(
                                                  builder: (a, p, c) =>
                                                      SizedBox(
                                                        height: 300,
                                                        width: 300,
                                                        child: ListView.builder(
                                                          reverse: false,
                                                          itemCount: p
                                                              .leadAssignHistory
                                                              .length,
                                                          shrinkWrap: true,
                                                          // physics:
                                                          //     const NeverScrollableScrollPhysics(),
                                                          itemBuilder:
                                                              (context, index) {
                                                            var history =
                                                                p.leadAssignHistory[
                                                                    index];

                                                            return Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: SC
                                                                          .fromWidth(
                                                                              20),
                                                                      bottom:
                                                                          5),
                                                                  width: 1,
                                                                  height: SC
                                                                      .fromHeight(
                                                                          15),
                                                                  color: Colors
                                                                      .grey
                                                                      .shade400,
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8),
                                                                  child: Text(
                                                                    "${MyHelper.formatDateTime(history.updatedAt!)}",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          3,
                                                                      horizontal:
                                                                          8),
                                                                  child: Text(
                                                                    translate[
                                                                        history
                                                                            .statusChange],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          SC.fromWidth(
                                                                              26),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade700,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ))
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Close"))
                                      ],
                                    );
                                  },
                                );
                              },
                              title: Text(
                                "Assigned to: ${data[index]['userId']['mobile']} on ",
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: SC.from_height(5),
                    ),

                    //
                    SizedBox(
                      height: SC.from_height(10),
                    ),


                    Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Timeline',
                              style: AppConstent.heading(context),
                            ),
                            if (p.loading) const ContainerShimmer(height: 20, width: 120) else Consumer<LeadDetailProvider>(
                                builder: (a, p, c) => ListView.builder(
                                  reverse: true,
                                  itemCount: p.leadHistory.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var history = p.leadHistory[index];

                                    return Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [

                                            //
                                            Container(
                                              margin: EdgeInsets.only(left: 20),
                                              width: 2,
                                              height: SC.from_width(110),
                                              color: Colors.grey.withOpacity(.5),
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Positioned(
                                                    left: -40,
                                                    right: -40,
                                                    bottom: SC.from_width(40),
                                                    child: Container(
                                                      height: SC.from_width(13),

                                                      decoration: BoxDecoration(
                                                        border:Border.all(width: 1,color: Colors.grey),
                                                        shape: BoxShape.circle,
                                                        color: Color.fromRGBO(223, 223, 223, 1),)
                                                    
                                                      ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 5,),

                                            //
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                //
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  child: Text(
                                                    "${MyHelper.formatDateTime(history.updatedAt!)}",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: SC.from_width(16),

                                                    ),
                                                  ),
                                                ),

                                                //
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 3, horizontal: 8),
                                                  child: Row(
                                                    children: [
                                                      Text("Status : ",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: SC.from_width(16),
                                                        color: Colors.grey
                                                      ),),
                                                      Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: Color.fromRGBO(141, 141, 141, 1)
                                                        ),
                                                        child: Text(
                                                          translate[history.statusChange],
                                                          style: TextStyle(
                                                            fontSize: SC.fromWidth(26),
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ))
                          ],
                        ),
                      ),
                    ),

                    
                    SizedBox(height: SC.from_width(20),)
                    //History

                  ],
                );
              },
            ),
          )),
    );
  }
}
