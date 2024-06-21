import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({Key? key}) : super(key: key);

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {

  List<String> names = ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace'];

  List<int> views = [25, 30, 35, 40, 45, 50, 55];
  List<int> clicks = [25, 30, 35, 40, 45, 50, 55];
  List<int> ctr = [25, 30, 35, 40, 45, 50, 55];

  bool isFacebookSelected = true;  // Facebook is active by default
  bool isInstagramSelected = false;

  final List<Map<String, String>> data = [
    {'label': 'Ad Views', 'value1': '1183798', 'value2': '0000000'},
    {'label': 'Click', 'value1': '1183798', 'value2': '0000000'},
    {'label': 'Leads', 'value1': '1183798', 'value2': '0000000'},
    {'label': 'Budget used', 'value1': '1183798', 'value2': '0000000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Add Detail',style: TextStyle(fontSize: SC.from_height(21)),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SC.from_height(18)),
        child: ListView(
          children: [
            SizedBox(
              height: SC.from_height(18),
            ),
            Container(
              padding: EdgeInsets.all(10),
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
                    child: Image.asset(
                      'assets/img_4.png',
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SC.from_height(8))),
                  ),
                  SizedBox(
                    width: SC.from_height(15),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lead Generation',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SC.fromWidth(27),
                            color:  MyHelper.appConstent.primeryColor),
                      ),
                      Container(
                        width: SC.from_height(90),
                        height: SC.from_height(30),
                        child: Center(
                          child: Text(
                            'Finished',
                            style: TextStyle(
                              fontSize: SC.from_height(15),
                                color: MyHelper.appConstent.primeryColor),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(36, 255, 229, 0.22),
                            border: Border.all(
                                color: Color.fromRGBO(12, 151, 134, 1)),
                            borderRadius:
                            BorderRadius.circular(SC.from_height(15))),
                      ),
                      Text(
                        '1 May - 10 May',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700, fontSize: SC.fromWidth(30)),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){

                            },
                            child: Text(
                              'See Detail >',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: SC.fromWidth(27),
                                  color: Color.fromRGBO(36, 238, 221, 1)),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: SC.from_height(18),
            ),
            Text(
              'Yay, Your ad reached to 211109 people',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: SC.from_height(17)),
            ),
            SizedBox(
              height: SC.from_height(12),
            ),
            Text(
              'Congratulations, in just 10 days your ad has reached to 211109 people and got 191 leads.',
              style: TextStyle(
                  fontSize: SC.from_height(15), color: Colors.grey.shade700),
            ),
            SizedBox(
              height: SC.from_height(15),
            ),
            // SEE ALL LEADS //
            Center(
              child: InkWell(
                onTap: (){

                },

                child: Text(
                  'See All Leads',
                  style: TextStyle(
                      fontSize: SC.from_height(17),
                      color: Color.fromRGBO(36, 238, 221, 1)),
                ),
              ),
            ),
            SizedBox(
              height: SC.from_height(15),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: SC.from_height(180),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(SC.from_height(8))),
              child: Padding(
                padding: EdgeInsets.only(left: SC.fromWidth(45),right: SC.fromWidth(35)),
                child: Column(
                  children: [
                    //  FACEBOOK AND INSTAGRAM //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Facebook',
                          style: TextStyle(
                              color: Color.fromRGBO(36, 238, 221, 1),
                              fontSize: SC.from_height(16)),
                        ),
                        SizedBox(
                          width: SC.from_height(10),
                        ),
                        Text(
                          'Instagram',
                          style: TextStyle(fontSize: SC.from_height(16)),
                        )
                      ],
                    ),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(

                              children: [
                                Text(
                                  item['label']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: SC.from_height(15),
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  item['value1']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: SC.from_height(15),
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                SizedBox(width: SC.fromWidth(18)),
                                Text(
                                  item['value2']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: SC.from_height(15),
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SC.from_height(20),
            ),


            // FACEBOOK AND INSTAGRAM //

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isFacebookSelected = !isFacebookSelected;
                  if (isFacebookSelected) {
                    isInstagramSelected = false;
                  }
                });
              },
              child: Container(
                width: SC.fromWidth(2.8),
                height: SC.from_height(45),
                child: Center(
                  child: Text(
                    'Facebook',
                    style: TextStyle(
                      color: isFacebookSelected ? Colors.white : Colors.grey.shade700,fontWeight: FontWeight.w500,
                      fontSize: SC.from_height(16),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: isFacebookSelected
                      ? Color.fromRGBO(36, 238, 221, 1)
                      : Colors.white,
                  border: Border.all(color:Color.fromRGBO(36, 238, 221, 1)),
                  borderRadius: BorderRadius.circular(SC.from_height(30)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isInstagramSelected = !isInstagramSelected;
                  if (isInstagramSelected) {
                    isFacebookSelected = false;
                  }
                });
              },
              child: Container(
                width: SC.fromWidth(2.8),
                height: SC.from_height(45),
                child: Center(
                  child: Text(
                    'Instagram',
                    style: TextStyle(
                      color: isInstagramSelected ? Colors.white : Colors.grey.shade700,fontWeight: FontWeight.w500,
                      fontSize: SC.from_height(16),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: isInstagramSelected
                      ? Color.fromRGBO(36, 238, 221, 1)
                      : Colors.white,
                  border: Border.all(color: Color.fromRGBO(36, 238, 221, 1)),
                  borderRadius: BorderRadius.circular(SC.from_height(30)),
                ),
              ),
            ),
          ],
        ),

            SizedBox(
              height: SC.from_height(30),
            ),

            // DEVICE AND VIEWS //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Device',
                    style: TextStyle(fontSize: SC.from_height(18),color: Colors.grey.shade700,fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Text(
                      'Views',
                      style: TextStyle(
                          fontSize: SC.from_height(18),
                          color: Color.fromRGBO(36, 238, 221, 1)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SC.from_height(60),
            ),
            Column(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  width: SC.from_height(55),
                  height: SC.from_height(55),
                  child: Image.asset('assets/phone.png'),
                ),
                Text(
                  'Mobile',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700, fontSize: SC.from_height(16)),
                ),
                Text(
                  '3.08 lacs',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SC.from_height(18),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),

            SizedBox(
              height: SC.from_height(30),
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
              height: SC.from_height(30),
            ),

            // AGE AND VIEWS  BarChart //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Age',
                    style: TextStyle(fontSize: SC.from_height(18),color: Colors.grey.shade700,fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Text(
                      'Views',
                      style: TextStyle(
                          fontSize: SC.from_height(18),
                          color: Color.fromRGBO(36, 238, 221, 1)),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    child: SfCartesianChart(

                      primaryXAxis: CategoryAxis(
                        majorGridLines: MajorGridLines(width: 0),// Remove X-axis gridlines
                        axisLine: AxisLine(width: 0),
                        majorTickLines: MajorTickLines(size: 0),
                      ),
                      primaryYAxis: NumericAxis(
                        isVisible: false, // Hide Y-axis for better visual
                        majorGridLines: MajorGridLines(width: 0), // Remove Y-axis gridlines
                      ),

                      borderColor: Colors.white, // Remove the chart border
                      backgroundColor: Colors.white,// Hide Y-axis for better visual
                      plotAreaBorderWidth: 0,
                        // Remove plot area border
                      series: [
                        ColumnSeries<SalesData, String>(
                          dataSource: <SalesData>[
                            SalesData('Below-10', 20),
                            SalesData('10-20', 25),
                            SalesData('20-30', 30),
                            SalesData('30-40', 25),
                            SalesData('40-Above', 20),
                          ],
                          xValueMapper: (SalesData sales, _) => sales.month,
                          yValueMapper: (SalesData sales, _) => sales.sales,
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.indigo.shade400,
                          // Optionally, make bar corners rounded
                          // spacing: 0.2,
                          // Adjust spacing between bars
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            labelPosition: ChartDataLabelPosition.inside,
                            builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                              // Check if data is not null
                              if (data != null) {
                                return Text(
                                  data.sales.toString(), // Access sales property if data is not null
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                );
                              } else {
                                return SizedBox(); // Return an empty widget if data is null
                              }
                            },

                            labelAlignment: ChartDataLabelAlignment.top, // Align labels inside the bars
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
             Center(
               child: Text('Age Group',style: TextStyle(color: Colors.grey),),
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
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Post Engagement',
                    style: TextStyle(fontSize: SC.from_height(18),fontWeight: FontWeight.w600,color: Colors.grey.shade700),
                  ),
                  Text(
                    '4322',
                    style: TextStyle(
                        fontSize: SC.from_height(17),
                        color: Color.fromRGBO(36, 238, 221, 1)),
                  ),
                ],
              ),
            ),

          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            buildCommentWidget(
              iconPath: 'assets/img_5.png',
              title: 'Comment 1',
              count: '45',
              textColor: Colors.grey.shade600,
              countColor: Colors.grey.shade600,
            ),
            SizedBox(height: 9),
            buildCommentWidget(
              iconPath: 'assets/img_6.png',
              title: 'Post Save',
              count: '32',
              textColor: Colors.grey.shade600,
              countColor: Colors.grey.shade600,
            ),
            SizedBox(height: 9),
            buildCommentWidget(
              iconPath: 'assets/img_7.png',
              title: 'Link Click',
              count: '18',
              textColor: Colors.grey.shade600,
              countColor: Colors.grey.shade600,
            ),
            SizedBox(height: 9),
            buildCommentWidget(
              iconPath: 'assets/img_8.png',
              title: 'Reaction',
              count: '63',
              textColor: Colors.grey.shade600,
              countColor: Colors.grey.shade600,
            ),
          ],
        ),
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

            // Gender and CTR //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: SC.from_height(19),fontWeight: FontWeight.w600,color: Colors.grey.shade700),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Text(
                      'Views (CTR)',
                      style: TextStyle(
                          fontSize: SC.from_height(18),
                          color: Color.fromRGBO(36, 238, 221, 1)),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   child: SfCircularChart(
            //     series: <CircularSeries>[
            //       // Renders pie chart
            //       PieSeries<SalesData, String>(
            //         dataSource: <SalesData>[
            //           SalesData('Male', 820),    // Replace 'Mon' with 'Male'
            //           SalesData('Female', 932),  // Replace 'Tue' with 'Female'
            //           SalesData('Other', 901),   // Replace 'Wed' with 'Other'
            //         ],
            //         xValueMapper: (SalesData sales, _) => sales.month,
            //         yValueMapper: (SalesData sales, _) => sales.sales,
            //         // Set color for each data point
            //         pointColorMapper: (SalesData sales, _) {
            //           // Return the desired color based on condition
            //           if (sales.month == 'Male') {
            //             return Colors.greenAccent;
            //             // For Male, set color to pink
            //           } else if (sales.month == 'Female') {
            //             return Colors.pink.shade200;
            //             // For Female, set color to blue
            //           } else if (sales.month == 'Other') {
            //             return Colors.blue;     // For Other, set color to green
            //           } else {
            //             return Colors.orange;           // Default color for other labels
            //           }
            //         },
            //         // Enable data labels
            //         dataLabelSettings: DataLabelSettings(
            //           isVisible: true,
            //           // Custom function to generate labels
            //           builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
            //             final SalesData salesData = data as SalesData;
            //             return Text(
            //               '${salesData.month}: ${salesData.sales}',
            //               style: TextStyle(fontSize: 12),
            //             );
            //           },
            //           // Adjust the connector line settings
            //           connectorLineSettings: ConnectorLineSettings(
            //             type: ConnectorType.curve,
            //             color: Colors.black, // Set the color of the connector line
            //             length: '10%',      // Set the length of the connector line
            //           ),
            //           // Add headings above each value
            //           labelPosition: ChartDataLabelPosition.outside,
            //         ),
            //       ),
            //     ],
            //   ),
            //   width: SC.from_height(300),
            //   height: SC.from_height(250),
            // ),


            // Container(
            //   child: SfCircularChart(
            //     series: <CircularSeries>[
            //       // Renders pie chart
            //       PieSeries<SalesData, String>(
            //         dataSource: <SalesData>[
            //           SalesData('Male', 820),    // Replace 'Mon' with 'Male'
            //           SalesData('Female', 932),  // Replace 'Tue' with 'Female'
            //           SalesData('Other', 901),   // Replace 'Wed' with 'Other'
            //         ],
            //         xValueMapper: (SalesData sales, _) => sales.month,
            //         yValueMapper: (SalesData sales, _) => sales.sales,
            //         // Set color for each data point
            //         pointColorMapper: (SalesData sales, _) {
            //           if (sales.month == 'Male') {
            //             return Colors.blue; // Set color for Male to blue
            //           } else if (sales.month == 'Other') {
            //             return Colors.pink.shade200; // Set color for Other to pink
            //           } else if (sales.month == 'Female') {
            //             return Colors.greenAccent; // Set color for Female to green
            //           } else {
            //             return Colors.orange; // Default color for other labels
            //           }
            //         },
            //
            //         // Enable data labels
            //         dataLabelSettings: DataLabelSettings(
            //           isVisible: true,
            //           // Custom function to generate labels
            //           builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
            //             final SalesData salesData = data as SalesData;
            //             // Conditionally set different values based on the category
            //             String labelText = '';
            //             if (salesData.month == 'Male') {
            //               labelText = 'Male\n 3 Lacs \n(0.96)';
            //               // Set Male-specific value
            //             }
            //             else if (salesData.month == 'Female') {
            //               labelText = 'Female \n 58K \n(0.96)'; // Set Female-specific value
            //             }
            //             else {
            //               labelText = '${salesData.month}: ${salesData.sales}'; // Default label
            //             }
            //             return Text(
            //               labelText,
            //               style: TextStyle(fontSize: SC.from_height(13), color: Colors.grey),
            //             );
            //           },
            //           // Adjust the connector line settings
            //           connectorLineSettings: ConnectorLineSettings(
            //             type: ConnectorType.curve,
            //             color: Colors.black, // Set the color of the connector line
            //             length: '10%',      // Set the length of the connector line
            //           ),
            //           // Add headings above each value
            //           labelPosition: ChartDataLabelPosition.outside,
            //         ),
            //       ),
            //     ],
            //   ),
            //   width: SC.from_height(300),
            //   height: SC.from_height(250),
            // ),

            Container(
              child: Echarts(
                option: '''
      {
        title: {
          left: 'center',
        },
        tooltip: {
          trigger: 'item',
          formatter: function(params, ticket, callback) {
            if (params.name === 'Male') {
              return 'Male: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Female') {
              return 'Female: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Other') {
              return 'Other: ' + params.value + ' (' + params.percent + '%)';
            }
          }
        },
        series: [
          {
            name: 'Sales',
            type: 'pie',
            radius: '50%',
            data: [
              {value: 820, name: 'Male', color: 'grey'},
              {value: 820, name: 'Female', color: 'green'},
              {value: 600, name: 'Other', color: 'pink'},
            ],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      }
    ''',
              ),
              width: SC.from_height(300),
              height: SC.from_height(300),
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
            // TOP PLACEMENT and CTR //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Placement ',
                    style: TextStyle(fontSize: SC.from_height(19),fontWeight: FontWeight.w600,color: Colors.grey.shade700),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Text(
                      'Views',
                      style: TextStyle(
                          fontSize: SC.from_height(18),
                          color: Color.fromRGBO(36, 238, 221, 1)),
                    ),
                  ),
                ],
              ),
            ),

    //         Container(
    //           child: Echarts(
    //             option: '''
    //   {
    //     title: {
    //       left: 'center',
    //     },
    //     tooltip: {
    //       trigger: 'item',
    //       formatter: '{a} <br/>{b}: {c} ({d}%)'
    //     },
    //     series: [
    //       {
    //         name: 'Sales',
    //         type: 'pie',
    //         radius: '50%',
    //         data: [
    //           {value: 820, name: 'Instagram video'},
    //           {value: 100, name: 'Feed 1'},
    //           {value: 901, name: 'Feed 2'},
    //           {value: 901, name: 'Video feed'},
    //         ],
    //         emphasis: {
    //           itemStyle: {
    //             shadowBlur: 10,
    //             shadowOffsetX: 0,
    //             shadowColor: 'rgba(0, 0, 0, 0.5)'
    //           }
    //         },
    //         itemStyle: {
    //           // Define colors for each data point
    //           color: function(params) {
    //             var colorList = ['grey', 'cyan', 'purple', 'pink'];
    //             return colorList[params.dataIndex];
    //           }
    //         }
    //       }
    //     ]
    //   }
    // ''',
    //           ),
    //           width:  SC.from_height(300),
    //           height:  SC.from_height(250),
    //         ),

            Container(
              child: Echarts(
                option: '''
      {
        title: {
          left: 'center',
        },
        tooltip: {
          trigger: 'item',
          formatter: function(params, ticket, callback) {
            if (params.name === 'Instagram video') {
              return 'Instagram Video: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Feed 1') {
              return 'Feed 1: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Feed 2') {
              return 'Feed 2: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Video feed') {
              return 'Video Feed: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Feed 3') {
              return 'Feed 3: ' + params.value + ' (' + params.percent + '%)';
            }
          }
        },
        series: [
          {
            name: 'Sales',
            type: 'pie',
            radius: '50%',
            data: [
              {value: 820, name: 'Instagram video', color: 'grey'},
              {value: 100, name: 'Feed 1', color: 'blue'},
              {value: 80, name: 'Feed 2', color: 'orange'},
              {value: 901, name: 'Video feed', color: 'purple'},
              {value: 901, name: 'Feed 3', color: 'green'},
            ],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      }
    ''',
              ),
              width:  SC.from_height(300),
              height:  SC.from_height(300),
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
            // Top Performing State and CTR //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
              child:    Text(
                'Top Performing State ',
                style: TextStyle(fontSize: SC.from_height(19),fontWeight: FontWeight.w600,color: Colors.grey.shade700),
              ),
            ),
            SizedBox(
              height: SC.from_height(15),
            ),
            Container(
              // decoration: BoxDecoration(border: Border.all()),
              width: double.infinity,
              height: SC.from_height(25),
              child: Container(
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text('City',style: TextStyle(color: Colors.white,fontSize:SC.from_height(16) ),),
                  Text('Views',style: TextStyle(color: Colors.white,fontSize:SC.from_height(16) ),),
                  Text('Click',style: TextStyle(color: Colors.white,fontSize:SC.from_height(16) ),),
                  Text('CTR',style: TextStyle(color: Colors.white,fontSize:SC.from_height(16) ),),
                ],),
              ),
            ),


            // Table(
            //   children: [
            //     TableRow(
            //       children: [
            //         TableCell(
            //           child: Container(
            //             padding: EdgeInsets.all(8.0),
            //             color: Colors.grey,
            //             child: Text('Cell 1'),
            //           ),
            //         ),
            //         TableCell(
            //           child: Container(
            //             padding: EdgeInsets.all(8.0),
            //             color: Colors.blue,
            //             child: Text('Cell 2'),
            //           ),
            //         ),
            //         TableCell(
            //           child: Container(
            //             padding: EdgeInsets.all(8.0),
            //             color: Colors.green,
            //             child: Text('Cell 3'),
            //           ),
            //         ),
            //       ],
            //     ),
            //
            //   ],
            // ),

            Table(
              children: [
                TableRow(
                  children: [

                    // CITY TABLE CELL //

                    TableCell(
                      child: Container(

                        padding: EdgeInsets.all(SC.from_height(8)),
                        color: Colors.blue.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            views.length,
                                (index) => Padding(
                              padding:   EdgeInsets.all(SC.from_height(8)),
                              child: Text('${names[index]}',
                                style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black,fontSize: SC.from_height(16)),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // TableCell(
                    //   child: Container(
                    //
                    //     padding: EdgeInsets.all(SC.from_height(8)),
                    //     color: Colors.blue.shade200,
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: List.generate(
                    //         names.length,
                    //             (index) => Padding(
                    //               padding:   EdgeInsets.all(SC.from_height(6)),
                    //               child: Text(names[index],style: TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(15.3)),),
                    //             ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // VIEWS TABLE CELL //
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.all(SC.from_height(8)),
                        color: Colors.blue.shade50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            views.length,
                                (index) => Padding(
                                  padding:   EdgeInsets.all(SC.from_height(8)),
                                  child: Text('${views[index]}',style: TextStyle(color: Colors.black,fontSize: SC.from_height(16)),),
                                ),
                          ),
                        ),
                      ),
                    ),

                    // CLICK TABLE CELL //
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.all(SC.from_height(8)),
                        color: Colors.blue.shade50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            growable: true,
                            clicks.length,
                                (index) => Padding(
                                  padding:   EdgeInsets.all(SC.from_height(8)),
                                  child: Text('${clicks[index]}',style: TextStyle(color: Colors.black,fontSize: SC.from_height(16)),),
                                ),
                          ),
                        ),
                      ),
                    ),

                    // CTR TABLE CELL //
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.all(SC.from_height(8)),
                        color: Colors.blue.shade50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            ctr.length,
                                (index) => Padding(
                                  padding:   EdgeInsets.all(SC.from_height(8)),
                                  child: Text('${ctr[index].toStringAsFixed(0)}%',style: TextStyle(color: Colors.black,fontSize: SC.from_height(16)),),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: SC.from_height(30),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildCommentWidget({
    required String iconPath,
    required String title,
    required String count,
    required Color textColor,
    required Color countColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
      child: Row(
        children: [
          Container(
            child: Image.asset(
              iconPath,
              width: SC.from_height(24),
              height: SC.from_height(24),
              color: Colors.black,
            ),
          ),
          SizedBox(width: SC.from_height(10)),
          Text(
            title,
            style: TextStyle(fontSize: SC.from_height(16), color: textColor,fontWeight: FontWeight.w500),
          ),
          Expanded(child: Container()),
          Text(
            count,
            style: TextStyle(fontSize: SC.from_height(16), color: countColor,fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}