import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/controllers/GetCampaignProvider.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/adddetail/barChartviewOFAge.dart';
import 'package:leadkart/leads/adddetail/detailview.dart';
import 'package:leadkart/leads/adddetail/devicerachebiew.dart';
import 'package:leadkart/leads/adddetail/genderandCtr%20view.dart';
import 'package:leadkart/leads/adddetail/tableview.dart';
import 'package:leadkart/leads/adddetail/topPlacement%20view.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:leadkart/screens/seeAllLeads/seeAllLeads.dart';
import 'package:leadkart/shimmers.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

class AddDetailScreen extends StatefulWidget {
  final String adId;
  const AddDetailScreen({required this.adId, Key? key}) : super(key: key);

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  List<String> names = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace'
  ];

  List<int> views = [25, 30, 35, 40, 45, 50, 55];
  List<int> clicks = [25, 30, 35, 40, 45, 50, 55];
  List<int> ctr = [25, 30, 35, 40, 45, 50, 55];

  bool isFacebookSelected = true; // Facebook is active by default
  bool isInstagramSelected = false;

  final List<Map<String, String>> data = [
    {'label': 'Ad Views', 'value1': '1183798', 'value2': '0000000'},
    {'label': 'Click', 'value1': '1183798', 'value2': '0000000'},
    {'label': 'Leads', 'value1': '1183798', 'value2': '0000000'},
    {'label': 'Budget used', 'value1': '1183798', 'value2': '0000000'},
  ];

  Map<String, String> translate = {
    "post_reaction": "Reaction",
    "link_click": "Link Click",
  };

  Map<String, Widget> iconFor = {
    "post_reaction": Image.asset("assets/img_8.png"),
    "link_click": Image.asset("assets/img_7.png"),
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Controllers.campaignProvider(context)
    //     .load(context);
  }

  final lableStyle = TextStyle(
      fontSize: SC.from_height(18),
      fontWeight: FontWeight.w600,
      color: Colors.grey.shade700);

  final sidelabelstyle = TextStyle(
    fontSize: SC.from_height(18),
    color: AppConstent().primeryColor,
    // color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Controllers.campaignProvider(context).clear();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: AppConstent().primeryColor,
            title: Text(
              'Add Detail',
              style: TextStyle(fontSize: SC.from_height(21)),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: SC.from_height(18)),
            child: ListView(
              children: [
                SizedBox(
                  height: SC.from_height(18),
                ),

                //Main Container

                Consumer<CampaignProvider>(builder: (a, p, c) {
                  if (p.loading) {
                    return const ContainerShimmer(
                      height: 150,
                    );
                  }
                  return Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: SC.from_height(150),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(SC.from_height(8)),
                    ),
                    child: Row(
                      children: [
                        // LEAD GENERATION //
                        Container(
                            clipBehavior: Clip.hardEdge,
                            width: SC.from_height(120),
                            height: SC.from_height(105),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(SC.from_height(8))),
                            child: CachedNetworkImage(
                              imageUrl: p.adData?.image ?? "",
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Text("asdf"),
                              errorWidget: (a, b, c) => const Icon(Icons.image),
                            )),
                        SizedBox(
                          width: SC.from_height(15),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p.adData?.addTypeId?.title ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: SC.fromWidth(27),
                                    color: AppConstent().primeryColor),
                              ),
                              Container(
                                width: SC.from_height(90),
                                height: SC.from_height(30),
                                decoration: BoxDecoration(
                                    color: (p.adData?.status == "PAUSED")
                                        ? Colors.yellow.withOpacity(.1)
                                        : const Color.fromRGBO(
                                            36, 255, 229, 0.22),
                                    border: Border.all(
                                        color: (p.adData?.status == "PAUSED")
                                            ? Colors.orange.shade300
                                            : const Color.fromRGBO(
                                                12, 151, 134, 1)),
                                    borderRadius: BorderRadius.circular(
                                        SC.from_height(15))),
                                child: Center(
                                  child: Text(
                                    "${p.adData?.status.toString().capitalizeFirst}",
                                    style: TextStyle(
                                        fontSize: SC.from_height(15),
                                        color: (p.adData?.status == "PAUSED")
                                            ? Colors.orange.shade300
                                            : AppConstent().primeryColor),
                                  ),
                                ),
                              ),
                              Text(
                                '${MyHelper.reFormatDatTime(p.adData?.startDate ?? "")} - ${MyHelper.reFormatDatTime(p.adData?.endDate ?? "")}',
                                // 'Thi sdf dssf',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                    fontSize: SC.fromWidth(30)),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'See Detail >',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: SC.fromWidth(27),
                                          color: AppConstent().primeryColor),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),

                //

                SizedBox(
                  height: SC.from_height(18),
                ),
                Text(
                  'Yay, Your ad reached to 211109 people',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SC.from_height(17)),
                ),
                SizedBox(
                  height: SC.from_height(12),
                ),
                Text(
                  'Congratulations, in just 10 days your ad has reached to 211109 people and got 191 leads.',
                  style: TextStyle(
                      fontSize: SC.from_height(15),
                      color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: SC.from_height(15),
                ),
                // SEE ALL LEADS //
                Center(
                  child: InkWell(
                    onTap: () {
                      RouteTo(context, child: (a, b) => const SeeAllLeads());
                    },
                    child: Text(
                      'See All Leads',
                      style: TextStyle(
                          fontSize: SC.from_height(17),
                          color: AppConstent().primeryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: SC.from_height(15),
                ),

                Consumer<CampaignProvider>(builder: (a, p, c) {
                  var d = p.data?.data;

                  if (p.loading) {
                    return Container();
                  }

                  if (p.faceBookReport?["keyPerformanceIndicators"] == null ||
                      p.faceBookReport?["keyPerformanceIndicators"]["data"]
                              .length ==
                          0) {
                    return const Center(child: Text("No Report Fond "));
                  }

                  return ReportGridView(
                    facbookEnable: d?.isFacebookAdEnabled ?? false,
                    instEnable: d?.isInstaAdEnabled ?? false,
                    facebookdata: p.faceBookReport?["keyPerformanceIndicators"],
                  );
                }),

                SizedBox(
                  height: SC.from_height(20),
                ),

                // FACEBOOK AND INSTAGRAM //

                Consumer<CampaignProvider>(
                  builder: (a, p, c) {
                    if (p.loading) {
                      return Center(
                          child: Text(
                        "Loading..",
                        style: TextStyles().smallBoldText,
                      ));
                    }
                    if (p.selectedPlateform == null) {
                      return Center(
                          child: Text("No Data Found",
                              style: TextStyles().smallBoldText));
                    }
                    if (p.loading == false &&
                        p.faceBookReport == null &&
                        p.instReport == null) {
                      return Center(
                        child: Text("NO Data"),
                      );
                    }

                    // return Text("${p.faceBookReport}");

                    var _data;

                    if (p.selectedPlateform == "F") {
                      _data = p.faceBookReport;
                    } else if (p.selectedPlateform == "I") {
                      _data = p.instReport;
                    }

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (p.data?.data?.isFacebookAdEnabled ?? false)
                              GestureDetector(
                                onTap: () {
                                  p.setSelectedPlateForm("F");
                                },
                                child: Container(
                                  width: SC.fromWidth(2.8),
                                  height: SC.from_height(45),
                                  child: Center(
                                    child: Text(
                                      'Facebook',
                                      style: TextStyle(
                                        color: p.selectedPlateform == "F"
                                            ? Colors.white
                                            : Colors.grey.shade700,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SC.from_height(16),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: p.selectedPlateform == "F"
                                        ? AppConstent().primeryColor
                                        : Colors.white,
                                    border: Border.all(
                                        color: AppConstent().primeryColor),
                                    borderRadius: BorderRadius.circular(
                                        SC.from_height(30)),
                                  ),
                                ),
                              ),
                            if (p.data?.data?.isInstaAdEnabled ?? false)
                              GestureDetector(
                                onTap: () {
                                  p.setSelectedPlateForm("I");
                                },
                                child: Container(
                                  width: SC.fromWidth(2.8),
                                  height: SC.from_height(45),
                                  child: Center(
                                    child: Text(
                                      'Instagram',
                                      style: TextStyle(
                                        color: p.selectedPlateform == "I"
                                            ? Colors.white
                                            : Colors.grey.shade700,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SC.from_height(16),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: p.selectedPlateform == "I"
                                        ? AppConstent().primeryColor
                                        : Colors.white,
                                    border: Border.all(
                                        color: AppConstent().primeryColor),
                                    borderRadius: BorderRadius.circular(
                                        SC.from_height(30)),
                                  ),
                                ),
                              ),
                          ],
                        ),

                        SizedBox(
                          height: SC.from_height(30),
                        ),

                        // DEVICE AND VIEWS //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Device',
                              style: lableStyle,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Views',
                                style: sidelabelstyle,
                              ),
                            ),
                          ],
                        ),
                        DeviceReachView(data: _data["deviceReach"] as Map),

                        SizedBox(
                          height: SC.from_height(30),
                        ),
                        // DIVIDER //
                        const Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: SC.from_height(30),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SC.from_height(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Age',
                                style: lableStyle,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Views',
                                  style: sidelabelstyle,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // AGE AND VIEWS  BarChart //
                        BarChartViewOfAge(
                          data: _data["ageWiseChart"],
                        ),

                        SizedBox(
                          height: SC.from_height(15),
                        ),

                        // DIVIDER //
                        Container(
                          width: double.infinity,
                          child: Divider(
                            thickness: 2,
                            color: Colors.grey.shade300,
                          ),
                        ),

                        SizedBox(
                          height: SC.from_height(15),
                        ),

                        // POST ENGAGEMENT //
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SC.from_height(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Post Engagement',
                                style: lableStyle,
                              ),
                              Text(
                                "${getEngagementCount(_data["engagements"])}",
                                style: TextStyle(
                                    fontSize: SC.from_height(17),
                                    color: AppConstent().primeryColor),
                              ),
                            ],
                          ),
                        ),

                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_data["engagements"]["data"] != null ||
                                  _data["engagements"]["data"].length > 0)
                                const Text("Repot is Empty"),

                              if (_data["engagements"]["data"] != null &&
                                  _data["engagements"]["data"].length > 0)
                                for (var i in _data["engagements"]["data"][0]
                                    ["actions"])
                                  if (translate[i["action_type"]] != null)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: buildCommentWidget(
                                        icon: iconFor[i["action_type"]]!,
                                        title: translate[i["action_type"]] ??
                                            "Null",
                                        count: i["value"] ?? 0,
                                        textColor: Colors.grey,
                                      ),
                                    ),

                              // SizedBox(height: 15),
                              // buildCommentWidget(
                              //   iconPath: 'assets/img_5.png',
                              //   title: 'Comment 1',
                              //   count: '45',
                              //   textColor: Colors.grey.shade600,
                              //   countColor: Colors.grey.shade600,
                              // ),
                              // SizedBox(height: 9),
                              // buildCommentWidget(
                              //   iconPath: 'assets/img_6.png',
                              //   title: 'Post Save',
                              //   count: '32',
                              //   textColor: Colors.grey.shade600,
                              //   countColor: Colors.grey.shade600,
                              // ),
                              // SizedBox(height: 9),
                              // buildCommentWidget(
                              //   iconPath: 'assets/img_7.png',
                              //   title: 'Link Click',
                              //   count: '18',
                              //   textColor: Colors.grey.shade600,
                              //   countColor: Colors.grey.shade600,
                              // ),
                              // SizedBox(height: 9),
                              // buildCommentWidget(
                              //   iconPath: 'assets/img_8.png',
                              //   title: 'Reaction',
                              //   count: '63',
                              //   textColor: Colors.grey.shade600,
                              //   countColor: Colors.grey.shade600,
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SC.from_height(15),
                        ),

                        // DIVIDER //
                        const Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: SC.from_height(15),
                        ),

                        // Gender and CTR //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gender',
                              style: lableStyle,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Views (CTR)',
                                style: TextStyle(
                                    fontSize: SC.from_height(18),
                                    color: AppConstent().primeryColor),
                              ),
                            ),
                          ],
                        ),
                        GenderAndCtrView(data: _data["gender"]),

                        SizedBox(
                          height: SC.from_height(15),
                        ),

                        // DIVIDER //
                        const Divider(
                          color: Colors.grey,
                        ),

                        SizedBox(
                          height: SC.from_height(15),
                        ),
                        // TOP PLACEMENT and CTR //
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SC.from_height(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Top Placement ',
                                style: lableStyle,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Views',
                                  style: sidelabelstyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TopPlacementView(data: _data["placements"]),

                        SizedBox(
                          height: SC.from_height(15),
                        ),

                        // DIVIDER //
                        const Divider(
                          color: Colors.grey,
                        ),

                        SizedBox(
                          height: SC.from_height(15),
                        ),
                        // Top Performing State and CTR //
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SC.from_height(15)),
                          child: Text(
                            'Top Performing State ',
                            style: TextStyle(
                                fontSize: SC.from_height(18),
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700),
                          ),
                        ),
                        SizedBox(
                          height: SC.from_height(15),
                        ),

                        TableView(
                            labale: "State",
                            data: _data['stateWisePerformance']),

                        const Divider(
                          color: Colors.grey,
                          height: 50,
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SC.from_height(15)),
                          child: Text(
                            'Top Performing City ',
                            style: TextStyle(
                                fontSize: SC.from_height(19),
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700),
                          ),
                        ),
                        SizedBox(
                          height: SC.from_height(15),
                        ),

                        TableView(
                            labale: "City", data: _data['cityWisePerformance']),

                        SizedBox(
                          height: SC.from_height(30),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }

  Widget buildCommentWidget({
    required Widget icon,
    required String title,
    required String count,
    Color? textColor,
    Color? countColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
      child: Row(
        children: [
          Container(height: 30, width: 30, child: icon),
          SizedBox(width: SC.from_height(10)),
          Text(
            title,
            style: lableStyle,
          ),
          Expanded(child: Container()),
          Text(
            count,
            style: TextStyle(
                fontSize: SC.from_height(16),
                color: countColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

String getEngagementCount(Map data) {
  if (data["data"] != null && data["data"].length > 0) {
    List _d = data["data"][0]["actions"];
    String ans = "not Found";
    _d.forEach((e) {
      if (e["action_type"] == "post_engagement") {
        ans = e["value"].toString();
      }
    });

    return "${ans}";
  } else {
    return "0";
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}
