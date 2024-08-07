import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/subUser viewTile.dart';
import '../../controllers/SubUserProvider.dart';


class ManageSubUserTab extends StatelessWidget {
  const ManageSubUserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubUserProvider>(
        builder: (a,p,c)=>

        //ListBuilder
        ListView.separated(
          reverse: true,
          // separatorBuilder: (context, index) =>const Divider(endIndent: 20,indent: 20,color: Colors.grey,thickness: .5,),
          separatorBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height:10,
              color: Colors.grey.shade200,
            );
          },
          itemCount: p.subUsers.length,
          itemBuilder: (a,i){

            //returnWidget
            return SubUserTile(
                user: p.subUsers[i]
            );

          },
        )
    );
  }
}
