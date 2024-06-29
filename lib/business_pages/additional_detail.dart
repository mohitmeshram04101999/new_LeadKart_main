
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/MyDropDownFeild.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/component/myChipWidget.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';
import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';


class AdditionalDetail extends StatefulWidget {
  const AdditionalDetail({Key? key}) : super(key: key);

  @override
  State<AdditionalDetail> createState() => _AdditionalDetailState();
}

class _AdditionalDetailState extends State<AdditionalDetail> {

  String? selectedOption;

  SpeechToText speechToText = SpeechToText();
  bool isListening = false;
  TextEditingController textEditingController = TextEditingController();

  TextEditingController _businessContactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeSpeechRecognizer();
  }

  // INITIALIZE SPEECH RECOGINIZER //
  void initializeSpeechRecognizer() async {
    bool available = await speechToText.initialize(
      onStatus: (status) => print('Status: $status'),
      onError: (error) => print('Error: $error'),
    );
    if (available) {
      print('Speech recognizer initialized');
    } else {
      print('Failed to initialize speech recognizer');
    }
  }

  // VOICE START LISTINING //
  void startListening() async {
    if (!isListening) {
      bool available = await speechToText.hasPermission && await speechToText.initialize();
      if (available) {
        setState(() {
          isListening = true;
        });

        speechToText.listen(

          listenFor: Duration(seconds: 10),
          onResult: (result) {
            setState(() {
              textEditingController.text = result.recognizedWords;
              isListening = false;
            });
            print('Result: ${result.recognizedWords}');
          },
        );
      } else {
        print('Microphone not available or not initialized');
      }
    } else {
      speechToText.stop();
      setState(() {
        isListening = false;
      });
    }
  }

  final List<String> items = [
    'Website Development',
    'Mobile App Development',
    'UI/UX Design',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      floatingActionButton:FloatingActionButton(onPressed: ()async{
        var usr = await Controllers.useraPrefrenc.getUser();
        MyHelper.bussnissApi.getAllCity(userId: usr!.id);
      },),

      appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Additional Detail',style: TextStyle(fontSize: SC.from_height(21)),),
      ),
      body: Consumer<CreateBusinessProvider>(
        builder: (a,p,c){
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
            children: [
              SizedBox(height: SC.from_height(15),),
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
                          child: p.businessImage!=null?Image.file(File(p.businessImage.toString()),fit: BoxFit.cover,) :  Center(
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

              SizedBox(height: SC.from_height(15),),

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
                            return Center(child: Text("Loding....",style: MyHelper.textStyls.smallBoldText,));
                          }

                        //if List id empty
                        else if (p3.allSrvices.length ==0)
                          {
                            return Center(child: Text("No Services Found",style: MyHelper.textStyls.smallBoldText,));
                          }

                        //returning final data
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Wrap(
                            children: [
                              for(var chip in p.service_ids)
                                Mychipwidget(category: chip),
                              
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


              SizedBox(height: SC.from_height(15),),





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

              SizedBox(height: SC.from_height(15),),

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
              SizedBox(height: SC.from_height(15),),

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
              SizedBox(height: SC.from_height(15),),

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

              SizedBox(height: SC.from_height(15),),
              // Website Link //
              CustomTextField(
                controller: p.webLinkController,
                labelText: 'Website Link ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),


              SizedBox(height: SC.from_height(15),),


              // Instagram Link //
              CustomTextField(
                controller:p.instaLinkController,
                labelText: 'Instagram Link ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(15),),

              // Twitter Link //
              CustomTextField(
                controller: p.twitterLinkController,
                labelText: 'Twitter Link  ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(15),),

              // Youtube Link //
              CustomTextField(
                controller: p.youTubeLinkController,
                labelText: 'Youtube Link  ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(15),),

              // Facebook Link //
              CustomTextField(
                controller: p.faceBookLinkController,
                labelText: 'Facebook Link ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(15),),

              // Address //
              CustomTextField(
                controller: p.addressController,
                labelText: 'Address ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: SC.from_height(15),),

              // Tagline //
              CustomTextField(
                controller: p.tagLinecontroller,
                labelText: 'Tagline ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business Contact No. cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),

              SizedBox(height: SC.from_height(20),),
              MyactionButton(action:()=> p.createBusiness(context)),
              SizedBox(height: SC.from_height(20),),

            ],
          );
        },
      ),
    );
  }
}
