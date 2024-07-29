import 'package:flutter/material.dart';
import 'package:leadkart/Models/LeadsApiresponce.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leadkart/component/leadeTile.dart';
import 'package:leadkart/component/leadeTilewithChecBox.dart';
import 'package:leadkart/helper/TextStyles.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:leadkart/them/constents.dart';


class AssaignLeads extends StatefulWidget {

  const AssaignLeads({super.key});

  @override
  State<AssaignLeads> createState() => _AssaignLeadsState();
}

class _AssaignLeadsState extends State<AssaignLeads> {

  Key key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: key,

      //AppBar
      appBar: AppBar(
        title: Text("Assign Leads"),
      ),

      //Body (List Of Leads)
      body: Column(

        children: [

          Padding(
            padding: AppConstent().horizontalPedding,
            child: InkWell(
              onTap: (){
                MyHelper.mybottomPanel(
                    context: context,
                    builder: (context,d)=>ListView(
                      children: [
                        for(int i =0;i<5;i++)
                          Padding(
                            padding: AppConstent().horizontalPedding,
                            child: Text("Option $i",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                          )
                      ],
                    ));
              },

              child: DropdownButtonFormField(

                //DropDown Decoration
                decoration: InputDecoration(
                  label: Text("Assign User"),
                  hintText: "Select users for assign leads"
                ),

                //OnChenge
                onChanged:(v){},
                items: [
                ],
              ),
            ),
          ),
          
          Padding(
            padding: AppConstent().horizontalPedding,
            child: Text("Select leads",style: TextStyle(fontSize: SC.from_width(23),fontWeight: FontWeight.w500,color:Color.fromRGBO(68, 68, 68, 1)),),
          ),
          
          for(int i = 0;i<10;i++)
            LeadeTile2(onChnage: (v){setState(() {

            });},),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: MyactionButton(action: (){},child: Text("Assign Leads",style: TextStyles().actionButtonStyle),),
          ),

        ],
      )
    );
  }
}
