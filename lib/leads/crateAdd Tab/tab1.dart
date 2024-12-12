import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/BussneCategoryTile.dart';
import 'package:leadkart/component/CustomTextField2.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/component/custom_textfield.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

class CreateBusinessTab1 extends StatelessWidget {
  const CreateBusinessTab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
      child: ListView(
        children: [
          SizedBox(height: SC.from_height(15),),

          Padding(
            padding:   EdgeInsets.symmetric(horizontal:SC.from_height(0) ),
            child: Text('Name of your business ?',style: AppConstent.labelStyleBig(context)),
          ),
          SizedBox(height: SC.from_height(7),),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal:SC.from_height(0) ),
            child: Text('Please provide your business name to continue.',style: TextStyle(fontSize: SC.from_height(18),fontWeight: FontWeight.w500,color: Colors.grey.shade700),),
          ),

          SizedBox(
            height: SC.from_height(18),
          ),

          // Busines Name //
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SC.from_height(0)),
            child:     CustomTextField2(
              controller: Controllers.createBusinessProvider(context,listen: false).businessNameController,
              labelText: '',
              hintText: "Enter Business Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Provide Business name';
                }
                // Additional validation logic if needed
                return null;
              },
            ),
          ),
          SizedBox(height: SC.from_height(18),),





          // GFBUTTON //

          // CustomButton(
          //   text: 'Next', onPressed: () {
          //   context.pushNamed("additionalDetails");
          //   // Navigator.push(context, MaterialPageRoute(builder: (context)=> FollowUpDate()));
          //
          // },
          // ),


          SizedBox(height: SC.from_height(20),),

        ],
      ),
    );
  }
}
