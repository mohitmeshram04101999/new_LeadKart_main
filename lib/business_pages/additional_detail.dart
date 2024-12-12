
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/MyDropDownFeild.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/component/myChipWidget.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';
import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';


class AdditionalDetail extends StatefulWidget {
  const AdditionalDetail({Key? key}) : super(key: key);

  @override
  State<AdditionalDetail> createState() => _AdditionalDetailState();
}

class _AdditionalDetailState extends State<AdditionalDetail> {

  String? selectedOption;

  bool isListening = false;
  TextEditingController textEditingController = TextEditingController();

  TextEditingController _businessContactController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // INITIALIZE SPEECH RECOGINIZER //

  // VOICE START LISTINING //

  final List<String> items = [
    'Website Development',
    'Mobile App Development',
    'UI/UX Design',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppConstent().primeryColor,
        title: Text('Additional Detail',style: TextStyle(fontSize: SC.from_height(21)),),
      ),
      body: Consumer<CreateBusinessProvider>(
        builder: (a,p,c){
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
            children: [
              SizedBox(height: SC.from_height(20),),
              Row(
                children: [

                  // SELECT AN IMAGE //
                  DottedBorder(
                    strokeWidth: 1,
                    dashPattern: [8],
                    color: Colors.grey,
                    child: InkWell(
                      onTap: ()=>p.selectbusinessImage(context),
                      child: Container(
                          width: SC.from_height(105),
                          height: SC.from_height(110),
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(SC.from_height(5))),
                          child: p.businessImage!=null?Image.file(File(p.businessImage!.path),fit: BoxFit.cover,) :
          Center(
                            child: Text(
                              'Business \n   Logo',
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: SC.from_height(17),fontWeight: FontWeight.w500),
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: SC.from_height(10),),

                  // TEXTFIELDS OF 'BUSINESS NAME' OR 'INDUSTRY'
                  Expanded(
                    child: Column(
                      children: [
                        // Your Business Name //
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SC.from_height(0)),
                          child:  CustomTextField(

                            controller: p.businessNameController,
                            labelText: 'Your Business Name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Business Contact No. cannot be empty';
                              }
                              // Additional validation logic if needed
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: SC.from_height(20),),

                        // Industry   DROPDOWN//.

                       Consumer<BussnissCategoryProvider>(builder: (a,p2,c){
                         return MyDropDownField(
                           lebale: "Industry",
                             value: p.businessCategoryId?.title??"",
                             builder: (c,a){
                           return ListView.builder(
                               controller: a,
                               itemCount: p2.allCategory.length,
                               itemBuilder: (a,index)=>ListTile(
                                 title: Text("${p2.allCategory[index].title}"),
                                 onTap: (){
                                   p.setCategoryId(p2.allCategory[index],context);
                                   context.pop();
                                 },
                               ));
                         });
                       }),

                      ],
                    ),
                  )
                ],),

              SizedBox(height: SC.from_height(20),),

              if(p.businessCategoryId!=null)
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                ),
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Consumer<BussnissCategoryProvider>(
                      builder:(a,p3,c){
                        //if Loading
                         if (p3.lodingSevics)
                          {
                            return Center(child: Text("Loding....",style: TextStyles().smallBoldText,));
                          }

                        //if List id empty
                        else if (p3.allSrvices.length ==0)
                          {
                            return Center(child: Text("No Services Found",style: TextStyles().smallBoldText,));
                          }

                        //returning final data
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Wrap(
                            children: [
                              for(var chip in p.service_ids)
                                Mychipwidget(category: chip,onDeleted: (){    Controllers.createBusinessProvider(context,listen: false).removeServiceId(chip.id!);},),
                              
                              //PopUpMenuButton to add Service
                              if(p.service_ids.length !=p3.allSrvices.length)
                                PopupMenuButton(
                                icon: Icon(Icons.add,size: 30,),
                                  itemBuilder: (context){
                                  return [
                                    for(var i in p3.allSrvices)
                                      if(p.service_ids.every((elemt)=>elemt.id!=i.id))
                                        PopupMenuItem(
                                          onTap: (){
                                            Controllers.createBusinessProvider(context,listen: false).addService(i);
                                          },
                                            child: Text(i.title!,style: TextStyle(fontSize: SC.from_width(17)),))
                                  ];
                                  }),
                              //-----
                              
                            ],
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: -20,
                      left: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(SC.from_height(7)),
                          color: Colors.white,
                        ),
                        child: Text(
                          ' Services ',
                          style: TextStyle(

                              color: Colors.grey.shade700, fontSize: SC.fromWidth(26)),
                        ),
                      ),
                    )

                  ],
                ),
              ),


              SizedBox(height: SC.from_height(20),),





              // Business Contact No. //
              CustomTextField(
                format: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
                textInputType: TextInputType.number,
                controller: p.businessPhoneNumberController,
                labelText: 'Business Contact No.',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  }
                  if(value.length<10)
                    {
                      return "Enter Velid Nnumber";
                    }
                  // Additional validation logic if needed

                  return null;
                },
              ),

              SizedBox(height: SC.from_height(20),),

              // Add WhatsApp No.. //
              CustomTextField(
                format: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
                textInputType: TextInputType.number,
                controller: p.businessWatsAppNumberController,
                labelText: 'Add WhatsApp No.. ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  }
                  if(value.length!=10)
                    {
                      return "Enter valid number";
                    }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(20),),

              // State //

              Consumer<BussnissCategoryProvider>(builder: (a,p2,c){
                return MyDropDownField(
                    lebale: "State",
                    value: p.stateId?.name??"",
                    builder: (c,a){
                      return ListView.builder(
                          controller: a,
                          itemCount: p2.allState.length,
                          itemBuilder: (a,index)=>ListTile(
                            title: Text("${p2.allState[index].name}"),
                            onTap: (){
                              p.setStateId(p2.allState[index]);
                              context.pop();
                            },
                          ));
                    });
              }),
              SizedBox(height: SC.from_height(20),),

              // City //
              Consumer<BussnissCategoryProvider>(builder: (a,p2,c){
                return MyDropDownField(
                    lebale: "City",
                    value: p.cityId?.name??"",
                    builder: (c,a){
                      return ListView.builder(
                          controller: a,
                          itemCount: p2.allCity.length,
                          itemBuilder: (a,index)=>ListTile(
                            title: Text("${p2.allCity[index].name}"),
                            onTap: (){
                              p.setCityId(p2.allCity[index]);
                              context.pop();
                            },
                          ));
                    });
              }),

              SizedBox(height: SC.from_height(20),),
              // Website Link //
              CustomTextField(
                controller: p.webLinkController,
                labelText: 'Website Link ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Website Link cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),


              SizedBox(height: SC.from_height(20),),


              // Instagram Link //
              CustomTextField(
                controller:p.instaLinkController,
                labelText: 'Instagram Link ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Instagram Link cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(20),),

              // Twitter Link //
              CustomTextField(
                controller: p.twitterLinkController,
                labelText: 'Twitter Link  ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Twitter Link cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(20),),

              // Youtube Link //
              CustomTextField(
                controller: p.youTubeLinkController,
                labelText: 'Youtube Link  ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Youtube Link cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(20),),

              // Facebook Link //
              CustomTextField(
                controller: p.faceBookLinkController,
                labelText: 'Facebook Link ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Facebook Link cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(20),),

              // Address //
              CustomTextField(
                controller: p.addressController,
                labelText: 'Address ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(20),),

              // Tagline //
              CustomTextField(
                controller: p.tagLinecontroller,
                labelText: 'Tagline ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tagline cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),

              SizedBox(height: SC.from_height(20),),
              MyactionButton(lable: "Create Business",action:()=> p.createBusiness(context)),
              SizedBox(height: SC.from_height(20),),

            ],
          );
        },
      ),
    );
  }
}
