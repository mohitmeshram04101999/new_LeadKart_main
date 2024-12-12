import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leadkart/component/CustomTextField2.dart';
import 'package:leadkart/component/MyDropDownFeild.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/component/myChipWidget.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';
import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

import '../../helper/controllerInstances.dart';
import '../../helper/dimention.dart';
import 'package:go_router/go_router.dart';

class CreateBusinessTab3 extends StatelessWidget {
  const CreateBusinessTab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateBusinessProvider>(
      builder: (a,p,c){
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
          children: [


            Text("Add more details about “${p.businessNameController.text}“",style: AppConstent.labelStyleBig(context),),

            SizedBox(height: SC.from_height(20),),


            Center(
              child: DottedBorder(
                strokeWidth: 1,
                dashPattern: [8],
                color: Colors.grey,
                child: InkWell(
                  onTap: ()=>p.selectbusinessImage(context),
                  child: Container(
                      width: SC.from_height(136),
                      height: SC.from_height(136),
                      decoration: BoxDecoration(
                          color: Colors.white,
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
            ),
            SizedBox(height: SC.from_height(5),),
            Center(
              child: Text("Upload your business logo",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: SC.from_width(16),
                color: Color.fromRGBO(123, 123, 123, 1)
              ),),
            ),

            SizedBox(height: SC.from_height(20),),

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

            SizedBox(height: SC.from_height(20),),
            
            // Service container'
            Text("Services",style: AppConstent.labelStyle2(context),),
            SizedBox(height: 5,),
            Container(
        decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(SC.from_height(7)),
        ),
              child: Consumer<BussnissCategoryProvider>(
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
            ),



            SizedBox(height: SC.from_height(20),),





            // Business Contact No. //
            CustomTextField2(
              format: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
              textInputType: TextInputType.number,
              controller: p.businessPhoneNumberController,
              labelText: 'Business Contact No.',
              hintText: "Contact Number",
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
            CustomTextField2(
              format: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
              textInputType: TextInputType.number,
              controller: p.businessWatsAppNumberController,
              labelText: 'Add WhatsApp No.. ',
              hintText: "Contact Number",
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
            SizedBox(height: SC.from_height(25),),

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
            SizedBox(height: SC.from_height(25),),

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
            // Website Link //


            SizedBox(height: SC.from_width(100),)

          ],
        );
      },
    );
  }
}
