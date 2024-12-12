import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/component/BussneCategoryTile.dart';
import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/controllers/creaetAddProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

import '../../controllers/BussnissCategoryProvider.dart';

class CreateBusinessTab2 extends StatelessWidget {
  CreateBusinessTab2({super.key});

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: SC.from_width(20),vertical: SC.from_width(20)),
      children: [


        // Select business category //
        Padding(
          padding:   EdgeInsets.symmetric(horizontal:SC.from_height(0) ),
          child: Text('Select business category',style: AppConstent.labelStyleBig(context)),
        ),
        SizedBox(height: SC.from_height(15),),

        //  SELECT BUSINESS CATEGORY //
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SC.from_height(0)),
          child: Consumer<BussnissCategoryProvider>(
            builder: (context, p, child) =>  TextFormField(
              controller: searchController,
              cursorColor: Colors.grey,
              onChanged: (s){

                p.upDate();
              },
              decoration: InputDecoration(
                hintText: 'Select busines category',
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade700,), // Add search icon// Adjust padding
                border: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                fillColor: Colors.white, // Optional: Set background color of the text field
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ),

        SizedBox(height: SC.from_height(15),),


        // Grid of containers
        Consumer<BussnissCategoryProvider>(builder: (a,p,c){
          print("bb");
          if(p.loding)
          {
            return Center(child: CircularProgressIndicator());
          }
          return GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: SC.fromHeight(8),
              crossAxisSpacing: SC.from_height(15),
              mainAxisSpacing: SC.from_height(15),
              // childAspectRatio: (SC.from_width(50) / SC.from_height(80)), // Adjust the aspect ratio as needed
            ),

            //Childredn
            children: [

              for(var i in p.allCategory)
                if(searchController.text.isEmpty||i.title.toString().toLowerCase().contains(searchController.text.toLowerCase()))
                  BussneCategoryTile(category: i,onTap: (){
                    Controllers.createBusinessProvider(context,listen: false).setCategoryId(i,context);
                    p.upDate();
                  },)

            ],

          );
        }),

      ],
    );
  }
}
