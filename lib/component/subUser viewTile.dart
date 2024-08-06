import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/Models/getAllsubUsersResonceModel.dart';
import 'package:leadkart/them/constents.dart';

class SubUserTile extends StatelessWidget {
  final SubUsers user;
  final void Function()? onTap;
  const SubUserTile({this.onTap,required this.user,super.key});

  @override
  Widget build(BuildContext context) {

    String? roleNames;
    for(var i in user.roleId?["permissions"]??[])
      {
        for(var j in i.keys)
          {
            roleNames ??= "";
            roleNames += "$j, ";
          }
      }

    return ExpansionTile(
      backgroundColor: Colors.grey.shade100,
      childrenPadding:const  EdgeInsets.symmetric(horizontal: 20),
      title: Text(user.name??"Unknown"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email - ${user.email??""}"),
          Text("Role name - ${user.roleId?["roleName"]??"No Role assign"}"),
        ],
      ),

      children: [
        if(user.roleId?["permissions"]!=null)
        Table(

          border: TableBorder.all(
            color: Colors.black
          ),
          children:  [
            const TableRow(
              children:[
                TableCell(child: Text("Permissions")),
                TableCell(child: Center(child: Text("Read"))),
                TableCell(child: Center(child: Text("Write"))),
              ]
            ),

            for(var per in user.roleId?["permissions"]??[])
              for(String name in per.keys)
                TableRow(
                  children: [
                    TableCell(child: Text(name),),
                    TableCell(child: Center(child: (per[name].contains("read"))?Icon(Icons.check,color: AppConstent().primeryColor,):Icon(Icons.close,color: Colors.red,))),
                    TableCell(child: Center(child: (per[name].contains("write"))?Icon(Icons.check,color: AppConstent().primeryColor,):Icon(Icons.close,color: Colors.red,))),
                  ]
                ),

          ],
        ),
        // if(user.roleId?["permissions"]!=null)
        //   for(var pr in user.roleId?["permissions"])
        //     for(var i in pr.keys)
        //       Row(children: [
        //         Text(i,style: TextStyle(
        //           color: AppConstent().primeryColor
        //         ),),
        //         const Text(" - "),
        //         for(String role in pr[i])
        //           Text("${role.capitalizeFirst.toString()},"),
        //       ],),
      ],
    );
  }
}
