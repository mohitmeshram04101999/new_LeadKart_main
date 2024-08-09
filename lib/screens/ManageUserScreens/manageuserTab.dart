import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/subUser viewTile.dart';
import '../../controllers/SubUserProvider.dart';
import '../../helper/controllerInstances.dart';


class ManageSubUserTab extends StatelessWidget {
  const ManageSubUserTab({super.key});

  @override
  Widget build(BuildContext context) {

    Controllers.subUserProvider(context).lode(context);


    return Consumer<SubUserProvider>(
        builder: (a,p,c)=>

        //ListBuilder
        RefreshIndicator(
          onRefresh: ()=> Controllers.subUserProvider(context).lode(context),
          child: WillPopScope(
            onWillPop: ()async{
              p.clear();
              return true;
            },
            child: ListView.separated(
              // separatorBuilder: (context, index) =>const Divider(endIndent: 20,indent: 20,color: Colors.grey,thickness: .5,),
              separatorBuilder: (context, index) {
                return Container(
                  width: double.maxFinite,
                  height:0,
                );
              },
              itemCount: p.subUsers.reversed.length,
              itemBuilder: (a,i){

                //returnWidget
                return Card(
                  elevation: 3,

                  margin:const  EdgeInsets.symmetric(horizontal: 5,vertical: 7),
                  child: SubUserTile(
                      user: p.subUsers.reversed.toList()[i]
                  ),
                );

              },
            ),
          ),
        )
    );
  }
}
