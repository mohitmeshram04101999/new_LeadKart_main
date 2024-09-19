import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/component/optioChip.dart';
import 'package:leadkart/controllers/LeadeDetaileProvider.dart';
import 'package:leadkart/function/flunction.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/shimmers.dart';
import 'package:leadkart/them/constents.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leadkart/component/sheder%20Iocn.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (d) {
          Controllers.leadDetailProvider(context, listen: false).clear();
        },
        child: Scaffold(
          //
          // floatingActionButton: FloatingActionButton(
          //   onPressed: (){
          //     Controllers.leadDetailProvider(context).getHistory(context);
          //   },
          // ),

          //
          appBar: AppBar(
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
                  SizedBox(
                    height: SC.fromHeight(35),
                  ),

                  // IMAGE //
                  SizedBox(
                    // decoration: BoxDecoration(border: Border.all()),
                    width: double.infinity,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
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
                                          fontSize: SC.fromWidth(24),
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w500),
                                    ),

                              //
                              const SizedBox(
                                height: 3,
                              ),
                              (p.loading)
                                  ? const ContainerShimmer(
                                      height: 15,
                                      width: 120,
                                    )
                                  : Text(
                                      p.lead?.userContactNumber ??
                                          "Contact Number is not available",
                                      style: TextStyle(
                                          fontSize: SC.fromWidth(27),
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w500),
                                    ),
                              const SizedBox(
                                height: 3,
                              ),

                              //
                              (p.loading)
                                  ? const ContainerShimmer(
                                      height: 15,
                                      width: 120,
                                    )
                                  : Text(
                                      p.lead?.leadStatus != null
                                          ? p.lead!.leadStatus!.capitalizeFirst
                                              .toString()
                                              .replaceAll("_", " ")
                                          : "No Data",
                                      style: TextStyle(
                                          fontSize: SC.fromWidth(27),
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w500),
                                    ),
                              SizedBox(
                                height: SC.fromHeight(40),
                              ),

                              //

                              (p.loading)
                                  ? const ContainerShimmer(
                                      height: 50, width: 120)
                                  : Row(
                                      children: [
                                        ShederIcon(
                                            onTap: () async {
                                              String? number =
                                                  p.lead?.userContactNumber;
                                              if (number != null) {
                                                makePhoneCall(number);
                                              } else {
                                                MyHelper.mySnakebar(
                                                    context, "Can't Call");
                                              }
                                            },
                                            iconData: Icons.call),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        ShederIcon(
                                            onTap: () {
                                              String? number =
                                                  p.lead?.whatsappNumber ??
                                                      p.lead?.userContactNumber;
                                              if (number != null) {
                                                openWhatsAppChat(number);
                                              } else {
                                                MyHelper.mySnakebar(context,
                                                    "Can't open Chat number is not available");
                                              }
                                            },
                                            iconData:
                                                FontAwesomeIcons.whatsapp),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        ShederIcon(
                                            iconData: FontAwesomeIcons.message),
                                      ],
                                    )
                            ],
                          ),
                        ),
                        Container(
                            height: SC.fromHeight(5.5),
                            width: SC.fromWidth(3),
                            // height: SC.fromHeight(10),
                            child: (p.loading)
                                ? const ContainerShimmer()
                                : Image.asset(
                                    'assets/img_12.png',
                                    fit: BoxFit.cover,
                                  ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SC.fromHeight(35),
                  ),

                  // CHOOSE ADS DIGITAL //
                  Text(
                    'Choose Ads and Digital',
                    style: TextStyle(
                        fontSize: SC.fromWidth(20),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: SC.fromHeight(55),
                  ),

                  p.loading
                      ? const ContainerShimmer(
                          height: 30,
                        )
                      : Wrap(
                          children: [
                            for (String i in leadTyps.keys)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 3),
                                child: OptionChip(
                                  onTap: () {
                                    p.updateLeadStatus(context, i);
                                  },
                                  label: leadTyps[i],
                                  active: p.lead?.leadStatus == i,
                                ),
                              )
                          ],
                        ),

                  divider,
                  SizedBox(
                    height: SC.fromHeight(75),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                      Text(
                        'Follow UP',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SC.fromWidth(25),
                            color: Colors.grey.shade700),
                      ),

                      //
                      InkWell(
                        onTap: () {
                          p.updateFollowUp(context);
                        },
                        child: Text(
                          'Set Follow UP',
                          style: TextStyle(
                              fontSize: SC.fromWidth(25),
                              fontWeight: FontWeight.w500,
                              color: AppConstent().primeryColor),
                        ),
                      ),
                    ],
                  ),

                  //
                  SizedBox(
                    height: SC.fromHeight(75),
                  ),

                  //
                  divider,

                  //
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      'Notes',
                      style: TextStyle(
                          fontSize: SC.fromWidth(23),
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: (p.loading)
                        ? const ContainerShimmer(height: 50)
                        : Text(
                            // p.lead?.note??"Not is Empty \u{1F5D1}",
                            p.lead?.note ?? "Note is Empty",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                    trailing: Column(
                      children: [
                        InkWell(
                            onTap: () => p.updateNote(context),
                            child: Text(
                              'Add Notes',
                              style: TextStyle(
                                  fontSize: SC.fromWidth(25),
                                  color: AppConstent().primeryColor,
                                  fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SC.from_height(5),
                  ),

                  //
                  divider,
                  SizedBox(
                    height: SC.from_height(10),
                  ),
                  Text(
                    'Timeline',
                    style: TextStyle(fontSize: SC.fromWidth(20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8),
                    child: p.loading
                        ? const ContainerShimmer(
                            height: 30,
                          )
                        : Text(
                            p.leadHistory.length == 0
                                ? "No History Found for this Lead"
                                : "Recent Activity",
                            style: TextStyle(
                              fontSize: SC.fromWidth(26),
                              fontWeight: FontWeight.bold,
                              color: AppConstent().primeryColor,
                            ),
                          ),
                  ),

                  //History
                  (p.loading)
                      ? const ContainerShimmer(height: 20, width: 120)
                      : Consumer<LeadDetailProvider>(
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
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: SC.fromWidth(20), bottom: 5),
                                        width: 1,
                                        height: SC.fromHeight(15),
                                        color: Colors.grey.shade400,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text(
                                          "${MyHelper.formatDateTime(history.createdAt!)}",
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 8),
                                        child: Text(
                                          translate[history.statusChange],
                                          style: TextStyle(
                                            fontSize: SC.fromWidth(26),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ))
                ],
              );
            },
          ),
        ));
  }
}
