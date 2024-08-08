import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/Models/ad_interests.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/component/flatIconns.dart';
import 'package:leadkart/controllers/creaetAddProvider.dart';import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:leadkart/screens/searchScreen.dart';import 'package:leadkart/them/constents.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/add_images/campaign_setting_page.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

class CreateAds extends StatefulWidget {
  const CreateAds({Key? key}) : super(key: key);

  @override
  State<CreateAds> createState() => _CreateAdsState();
}

class _CreateAdsState extends State<CreateAds> {

  String? selectedOption;
  bool lights = false;

  void _updateUserApi(String fromTime, String toTime, String isContact) {
    // Placeholder for your update user API call
    print(
        'Updating user with fromTime: $fromTime, toTime: $toTime, isContact: $isContact');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppConstent().primeryColor,
        title: Text('Create an Ad',style: TextStyle( fontSize: SC.from_height(21) ),)
      ),

      body: Consumer<CreateAddProvider>(

        builder:(a,p,c)=>ListView(
          padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
          children: [
            SizedBox(
              height: SC.from_height(15),
            ),

            //  SELECT CAMPAIGN   DROPDOWN//

            // GestureDetector(
            //   onTap: () {
            //     MyHelper.mybottomPanel(
            //       context: context,
            //       builder: (context,d) =>  ListView(
            //         controller: d,
            //         children: [
            //           for (int i = 0; i < 5; i++)
            //             ListTile(
            //               title: Text(
            //                 "Option $i",
            //                 style:TextStyle(fontSize:SC.from_height(16),color: Colors.grey.shade700 ,fontWeight: FontWeight.w500),
            //               ),
            //               onTap: () {
            //                 setState(() {
            //                   selectedOption = "Option $i";
            //                 });
            //                 Navigator.pop(context); // Close the bottom sheet
            //               },
            //             )
            //         ],
            //       ),
            //     );
            //   },
            //   child: Container(
            //     width: double.infinity,
            //     height: SC.from_height(45),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey),
            //       borderRadius: BorderRadius.circular(7),
            //     ),
            //     padding: EdgeInsets.symmetric(horizontal: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //             selectedOption ?? 'Select Campaign',
            //             style: TextStyle(fontSize:SC.from_height(16),color: Colors.grey.shade700,fontWeight: FontWeight.w500 )
            //         ),
            //         Transform.rotate(
            //           angle: 1.5708,  // Rotate 90 degrees clockwise (π/2 radians)
            //           child: Icon(
            //             Icons.arrow_forward_ios_rounded,
            //             color: Colors.black.withOpacity(0.8),
            //             size: SC.from_height(17),
            //           ),
            //         ),
            //
            //       ],
            //     ),
            //   ),
            // ),


            SizedBox(
              height: SC.from_height(15),
            ),

            // SELECT AN IMAGE //
            Stack(
              clipBehavior: Clip.none,
              children: [
                DottedBorder(
                  strokeWidth: 1,
                  dashPattern: [8],
                  color: Colors.grey,
                  child: MyInkWell(
                    onTap: ()=>p.selectImage(context),
                    width: double.infinity,
                    height: SC.from_height(210),
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(SC.from_height(5))),
                    child: p.image!=null? Image.file(File(p.image??""),fit: BoxFit.cover,):Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: SC.from_height(30),
                          height: SC.from_height(30),
                          child: Image.asset('assets/create.png'),
                        ),
                        SizedBox(
                          width: SC.from_height(15),
                        ),
                        Text(
                          'Select an Image',
                          style: TextStyle(
                              color: Colors.grey, fontSize: SC.from_height(17),fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                if(p.image!=null)
                Positioned(
                    right: -10,
                    top: -10,
                    child: CircleAvatar(child: IconButton(onPressed: ()=>p.selectImage(context), icon: FlatIcon(icon: FlatIcons.editImage,),)))
              ],
            ),
            SizedBox(
              height: SC.from_height(15),
            ),

            // TITLE //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(0)),
              child: CustomTextField(
                controller: p.titleController,
                labelText: "Ad title",
              ),
            ),
            SizedBox(
              height: SC.from_height(15),
            ),

            // CAPTION //
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SC.from_height(0)), // Adjust padding if needed
              child: CustomTextField(
                controller: p.captionController,
                labelText: "Caption",
              ),
            ),

            // AI SUGGESTED   //
            SizedBox(
              height: SC.from_height(15),
            ),
            Container(
              width: double.infinity,
              // height: SC.from_height(100),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 253, 243, 0.5),
                  borderRadius: BorderRadius.circular(
                    SC.from_height(5),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: SC.from_height(10), left: SC.from_height(15)),
                    child: Text('AI Suggested Caption',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: SC.from_height(16),
                            fontWeight: FontWeight.w500)),
                  ),
                  ListTile(
                      title: Text(
                        'Order tastiest momos in Bhopal.\nClick on Link now',
                        style: TextStyle(
                            color: Colors.grey, fontSize: SC.from_height(15),fontWeight: FontWeight.w500),
                      ),
                      // subtitle: Text(
                      //   'Click on Link now',
                      //   style: TextStyle(
                      //       color: Colors.grey, fontSize: SC.from_height(15),fontWeight: FontWeight.w500),
                      // ),
                      trailing: InkWell(
                        onTap: ()=>p.addCaption("Order tastiest momos in Bhopal. Click on Link now"),
                        child: Text(
                          'Add',
                          style: TextStyle(
                              color: const Color.fromRGBO(36, 238, 221, 1),
                              fontSize: SC.from_height(16),fontWeight: FontWeight.w500),
                        ),
                      ))
                ],
              ),
            ),

            // SizedBox(
            //   height: SC.from_height(15),
            // ),


            // ANDROID SWITCH //
            // Row(
            //   children: [
            //     Text(
            //       'Call to Action',
            //       style: TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(19),fontWeight: FontWeight.w500),
            //     ),
            //     SizedBox(
            //       width: SC.from_height(10),
            //     ),
            //     Center(
            //       child: SwitchTheme(
            //         data: SwitchThemeData(
            //           thumbColor: MaterialStateProperty.resolveWith((states) {
            //             if (states.contains(MaterialState.selected)) {
            //               return Colors.white; // Active thumb color
            //             }
            //             return Colors.blue; // Inactive thumb color
            //           }),
            //           trackColor: MaterialStateProperty.resolveWith((states) {
            //             if (states.contains(MaterialState.selected)) {
            //               return Colors.blue; // Active track color
            //             }
            //             return Colors.white; // Inactive track color
            //           }),
            //         ),
            //         child: Switch(
            //           value: lights,
            //           onChanged: (bool value) {
            //             setState(() {
            //               lights = value;
            //             });
            //
            //             _updateUserApi('08:00', '17:00', value ? "1" : "0"); // Replace '08:00' and '17:00' with your actual times
            //           },
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // ),

            //  CALL TO ACTION  DROPDOWN//
            // SizedBox(
            //   height: SC.from_height(15),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     MyHelper.mybottomPanel(
            //       context: context,
            //       builder: (context,d) => ListView(
            //         children: [
            //           for (int i = 0; i < 5; i++)
            //             ListTile(
            //               title: Text(
            //                 "Option $i",
            //                 style:TextStyle(fontSize:SC.from_height(16),color: Colors.grey.shade700 ,fontWeight: FontWeight.w500),
            //               ),
            //               onTap: () {
            //                 setState(() {
            //                   selectedOption = "Option $i";
            //                 });
            //                 Navigator.pop(context); // Close the bottom sheet
            //               },
            //             )
            //         ],
            //       ),
            //     );
            //   },
            //   child: Container(
            //     width: double.infinity,
            //     height: SC.from_height(45),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey),
            //       borderRadius: BorderRadius.circular(7),
            //     ),
            //     padding: EdgeInsets.symmetric(horizontal: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //             selectedOption ?? 'Select a Call to Action',
            //             style:  TextStyle(fontSize:SC.from_height(15) ,color: Colors.grey.shade700,fontWeight: FontWeight.w500)
            //         ),
            //         Transform.rotate(
            //           angle: 1.5708,  // Rotate 90 degrees clockwise (π/2 radians)
            //           child: Icon(
            //             Icons.arrow_forward_ios_rounded,
            //             color: Colors.black.withOpacity(0.8),
            //             size: SC.from_height(17),
            //           ),
            //         ),
            //
            //       ],
            //     ),
            //   ),
            // ),

            SizedBox(
              height: SC.from_height(8),
            ),

            // DESTINATION URL   DROPDOWN//
            SizedBox(
              height: SC.from_height(15),
            ),
        CustomTextField(controller: p.destinationUrlController, labelText: "Destination Url"),

            SizedBox(
              height: SC.from_height(8),
            ),

            InterestSelectionWithSearch(),

            SizedBox(
              height: SC.from_height(15),
            ),

            // ADD AUDIENCEE //
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     // border: Border.all(color: Colors.grey),
            //     borderRadius: BorderRadius.circular(SC.from_height(7)),
            //   ),
            //   width: double.infinity,
            //   // height: SC.from_height(100),
            //   height: SC.fromHeight(8.2),
            //   child: Stack(
            //     // alignment: Alignment.bottomCenter,
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Container(
            //             decoration: BoxDecoration(
            //               border: Border.all(color: Colors.grey),
            //               borderRadius: BorderRadius.circular(SC.from_height(7)),
            //             ),
            //             width: double.infinity,
            //             height: SC.from_height(55),
            //             child: Row(
            //               children: [
            //                 SizedBox(
            //                     width: SC.from_height(
            //                         10)), // Optional: Add some space before the chip
            //                 Chip(
            //                   label: Text(
            //                     'Food Shopper',
            //                     style: TextStyle(color: Colors.grey.shade700,fontSize:SC.from_height(15) ),
            //                   ),
            //                   backgroundColor:
            //                   Colors.white, // Customize chip background color
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(
            //                         SC.from_height(
            //                             15)), // Match container border radius
            //                     side: BorderSide(
            //                         color: Colors
            //                             .grey), // Optional: Match container border color
            //                   ),
            //
            //                   // Optional: Add an icon to the chip
            //                   onDeleted: () {
            //                     // Handle chip deletion or button click action
            //                     print('Chip button pressed');
            //                   },
            //                   deleteIcon: Icon(Icons.cancel,
            //                       color: Colors
            //                           .grey), // Optional: Customize delete icon
            //                   deleteButtonTooltipMessage:
            //                   'Remove', // Tooltip for the delete button
            //                 ),
            //                 SizedBox(width: SC.from_height(10)),
            //                 Chip(
            //                   label: Text(
            //                     'Retailer',
            //                     style: TextStyle(color: Colors.grey.shade700,fontSize:SC.from_height(15) ),
            //                   ),
            //                   backgroundColor:
            //                   Colors.white, // Customize chip background color
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(
            //                         SC.from_height(
            //                             15)), // Match container border radius
            //                     side: BorderSide(
            //                         color: Colors
            //                             .grey), // Optional: Match container border color
            //                   ),
            //
            //                   // Optional: Add an icon to the chip
            //                   onDeleted: () {
            //                     // Handle chip deletion or button click action
            //                     print('Chip button pressed');
            //                   },
            //                   deleteIcon: Icon(Icons.cancel,
            //                       color: Colors
            //                           .grey), // Optional: Customize delete icon
            //                   deleteButtonTooltipMessage:
            //                   'Remove', // Tooltip for the delete button
            //                 ),
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //       Positioned(
            //         top: SC.from_height(8),
            //         left: SC.from_height(20),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             // border: Border.all(),
            //             borderRadius: BorderRadius.circular(SC.from_height(7)),
            //             color: Colors.white,
            //           ),
            //           child: Text(
            //             ' Audience ',
            //             style: TextStyle(
            //                 color: Colors.grey.shade700, fontSize: SC.from_height(16)),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            //
            // SizedBox(
            //   height: SC.from_height(15),
            // ),

            // AI SUGESTED CAPTION  //
            // Container(
            //   width: double.infinity,
            //   height: SC.from_height(95),
            //   decoration: BoxDecoration(
            //       color: Color.fromRGBO(236, 253, 243, 0.5),
            //       borderRadius: BorderRadius.circular(
            //         SC.from_height(5),
            //       )),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(
            //             top: SC.from_height(10), left: SC.from_height(15)),
            //         child: Text('AI Suggested Caption',
            //             style:  TextStyle(
            //                 color: Colors.grey.shade700,
            //                 fontSize: SC.from_height(16),
            //                 fontWeight: FontWeight.w500)),
            //       ),
            //       SizedBox(
            //         height: SC.from_height(10),
            //       ),
            //
            //
            //
            //       Row(
            //         children: [
            //           SizedBox(
            //             width: SC.from_height(12),
            //           ),
            //           Container(
            //             padding:const  EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
            //             // height: SC.from_height(32),
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               border: Border.all(color: Colors.grey,),
            //               borderRadius: BorderRadius.circular(SC.fromWidth(15)),
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Text(
            //                   'Food Shopper',
            //                   style: TextStyle(
            //                       color: Colors.grey.shade700,
            //                       fontSize:SC.fromWidth(27)),
            //                 ),
            //                 Icon(
            //                   Icons.add,
            //                   color: Colors.blue,
            //                 )
            //               ],
            //             ),
            //           ),
            //           SizedBox(
            //             width: SC.from_height(20),
            //           ),
            //           Container(
            //             padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               border: Border.all(color: Colors.grey),
            //               borderRadius: BorderRadius.circular(SC.from_height(15)),
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Text(
            //                   'Retailer',
            //                   style: TextStyle(
            //                       color: Colors.grey.shade700,
            //                       fontSize:SC.fromWidth(27)),
            //                 ),
            //                 Icon(
            //                   Icons.add,
            //                   color: Colors.blue,
            //                 )
            //               ],
            //             ),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
            // ),

            // // ADD LOCATION //
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     // border: Border.all(color: Colors.grey),
            //     borderRadius: BorderRadius.circular(SC.from_height(7)),
            //   ),
            //   width: double.infinity,
            //   height: SC.from_height(80),
            //   child: Stack(
            //     // alignment: Alignment.bottomCenter,
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           MyInkWell(
            //             onTap: (){
            //               RouteTo(context, child:(a,n)=>const  SearchTargetAreaScreen());
            //             },
            //             padding: EdgeInsets.only(
            //                 top: SC.from_height(15), left: SC.from_height(15)),
            //             decoration: BoxDecoration(
            //               border: Border.all(color: Colors.grey,width: .5),
            //               borderRadius: BorderRadius.circular(SC.from_height(7)),
            //             ),
            //             width: double.infinity,
            //             height: SC.from_height(50),
            //             child: Text(
            //               p.targetArea!=null
            //                   ? (p.targetArea?.type=="city"||p.targetArea?.type=="neighborhood"||p.targetArea?.type=="subcity")
            //                   ?"${p.targetArea?.name}, ${p.targetArea?.region}, ${p.targetArea?.countryName}"
            //                   :"${p.targetArea?.name}, ${p.targetArea?.countryName}"
            //                   :'Add a location',
            //               style: TextStyle(fontSize: SC.from_height(16),color:p.targetArea==null?Colors.grey.shade500:Colors.grey.shade700),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Positioned(
            //         top: SC.from_height(5),
            //         left: SC.from_height(20),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(SC.from_height(7)),
            //             color: Colors.white,
            //           ),
            //           child: Text(
            //             ' Target Area ',
            //             style: TextStyle(
            //                 color: Colors.grey.shade700, fontSize: SC.from_height(15)),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),

            SizedBox(
              height: SC.from_height(15),
            ),

            // GFBUTTON //
            CustomButton(
              text: 'Next', onPressed: () {
              context.pushNamed("campaignSettings");
              },
            ),


            SizedBox(
              height: SC.from_height(15),
            ),
          ],
        )

      ),
    );
  }
}

class InterestSelectionWithSearch extends StatefulWidget {
  @override
  _InterestSelectionWithSearchState createState() => _InterestSelectionWithSearchState();
}

class _InterestSelectionWithSearchState extends State<InterestSelectionWithSearch> {
  List<dynamic> searchResults = [];
  Timer? _debounce;

  void searchInterests(String query) async{
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async{
      if (query.length >= 3) {
        // Call your API here and update searchResults
        // For demonstration, we'll use a dummy list
        List<dynamic> adInterests = await Controllers.createAddProvider(context,listen: false).getInterests(businessId: '664483cb34434c7cec80d6ed'??'', query: query);
        setState(() {
          searchResults = adInterests.map((e) => e['name']).toList().where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
        });
      } else {
        setState(() {
          searchResults = [];
        });
      }
    });
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateAddProvider>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //
          //Text
          Padding(
            padding: EdgeInsets.only(
                top: SC.from_height(10), left: SC.from_height(15)),
            child: Text('Select Interests',
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: SC.from_height(16),
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(height: SC.from_height(10)),

          //decorationcontainer
          Container(
            width: double.infinity,
            // height: SC.from_height(45),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SC.from_height(10)),
                Wrap(
                  children: value.adInterests.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                    child: Chip(
                      label: Text(e),
                      onDeleted: () {
                        value.removeAdInterests(e);
                      },
                    ),
                  )).toList(),
                ),



                //
                //
                // if (searchResults.isNotEmpty)
                //   Container(
                //   height: 2,
                //     child: Stack(
                //       clipBehavior: Clip.none,
                //       children: [
                //         AnimatedPositioned(
                //           duration:const Duration(minutes: 2000),
                //           top:(searchResults.isNotEmpty|| controller.text.isNotEmpty)?-300:0,
                //             left: 0,right: 0,
                //             bottom: 0,
                //             child: Container(
                //               margin: EdgeInsets.all(10),
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.grey.shade500,
                //                     blurRadius: 3
                //                   )
                //                 ]
                //               ),
                //               height: SC.fromContextWidth(context, 2),
                //               child: ListView.builder(
                //                 itemCount: searchResults.length,
                //                 physics: const NeverScrollableScrollPhysics(),
                //                 itemBuilder: (context, index) {
                //                   return ListTile(
                //                     title: Text(searchResults[index]),
                //                     onTap: () {
                //                       // Handle selection of search result
                //                       value.setAdInterests(searchResults[index]);
                //                       searchInterests("");
                //                       controller.clear();
                //                     },
                //                   );
                //                 },
                //               ),
                //             ),)
                //       ],
                //     ),
                //   ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
                  child: TextField(
                    controller: controller,
                    enableSuggestions: true,
                    contextMenuBuilder: (context, editableTextState) {
                      return Text('Custom context menu');
                    },
                    decoration: InputDecoration(
                      hintText: 'Search interests...',
                      // border: OutlineInputBorder(),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    onChanged: searchInterests,
                  ),
                ),
              ],
            ),
          ),
          if (searchResults.isNotEmpty|| controller.text.isNotEmpty)
            Container(
            height: SC.fromContextWidth(context, 2),
            child: ListView.builder(
              itemCount: searchResults.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]),
                  onTap: () {
                    // Handle selection of search result
                    value.setAdInterests(searchResults[index]);
                    searchInterests("");
                    controller.clear();
                  },
                );
              },
            ),
          )





        ],
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
