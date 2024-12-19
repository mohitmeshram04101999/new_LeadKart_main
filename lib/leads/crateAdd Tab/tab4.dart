

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/component/CustomTextField2.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

class CreateBusinessTab4 extends StatelessWidget {
  const CreateBusinessTab4({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateBusinessProvider>(
      builder: (context, p, child) => ListView(
        padding: EdgeInsets.symmetric(horizontal: SC.from_width(20)),
        children: [
          Text("Lastly few more details ",style: AppConstent.labelStyleBig(context),),

          SizedBox(height: SC.from_width(60)),
          CustomTextField2(
            controller: p.webLinkController,
            labelText: 'Website Link ',
            hintText: 'Paste Link',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Website Link cannot be empty';
              }
              // Additional validation logic if needed
              return null;
            },
          ),


          SizedBox(height: SC.from_height(15),),


          // Instagram Link //
          CustomTextField2(
            controller:p.instaLinkController,
            labelText: 'Instagram Link ',
            hintText: 'Paste Link',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Instagram Link cannot be empty';
              }
              // Additional validation logic if needed
              return null;
            },
          ),
          SizedBox(height: SC.from_height(15),),

          // Twitter Link //
          CustomTextField2(
            controller: p.twitterLinkController,
            labelText: 'Twitter Link  ',
            hintText: 'Paste Link',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Twitter Link cannot be empty';
              }
              // Additional validation logic if needed
              return null;
            },
          ),
          SizedBox(height: SC.from_height(15),),

          // Youtube Link //
          CustomTextField2(
            controller: p.youTubeLinkController,
            labelText: 'Youtube Link  ',
            hintText: 'Paste Link',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Youtube Link cannot be empty';
              }
              // Additional validation logic if needed
              return null;
            },
          ),
          SizedBox(height: SC.from_height(15),),

          // Facebook Link //
          CustomTextField2(
            controller: p.faceBookLinkController,
            labelText: 'Facebook Link ',
            hintText: 'Paste Link',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Facebook Link cannot be empty';
              }
              // Additional validation logic if needed
              return null;
            },
          ),
          SizedBox(height: SC.from_height(15),),

          // Address //
          CustomTextField2(
            controller: p.addressController,
            labelText: 'Address ',
            hintText: 'Adress',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Address cannot be empty';
              }
              // Additional validation logic if needed
              return null;
            },
          ),
          SizedBox(height: SC.from_height(15),),

          // Tagline //
          CustomTextField2(
            controller: p.tagLinecontroller,
            labelText: 'Tagline ',
            hintText: 'TagLine',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tagline cannot be empty';
              }
              // Additional validation logic if needed
              return null;
            },
          ),


          if(kDebugMode)
            ElevatedButton(onPressed: ()=>p.createBusiness(context), child:Text("run") ),


          SizedBox(height: SC.from_height(20),),
          // MyactionButton(lable: "Create Business",action:()=> p.createBusiness(context)),
          SizedBox(height: SC.from_height(80),),





        ],
      ),
    );
  }
}
