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
    return ExpansionTile(
      childrenPadding:const  EdgeInsets.symmetric(horizontal: 20),
      title: Text(user.name??"Unknown"),
      subtitle: Text("Email - ${user.email??""}"),

      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: (user.roleId==null)
              ?const Text("No Role Assign")
              :Text("Role name - ${user.roleId?["roleName"]??""}"),
        ),
        if(user.roleId?["permissions"]!=null)
          for(var pr in user.roleId?["permissions"])
            for(var i in pr.keys)
              Row(children: [
                Text(i,style: TextStyle(
                  color: AppConstent().primeryColor
                ),),
                const Text(" - "),
                for(String role in pr[i])
                  Text("${role.capitalizeFirst.toString()},"),
              ],),
      ],
    );
  }
}
