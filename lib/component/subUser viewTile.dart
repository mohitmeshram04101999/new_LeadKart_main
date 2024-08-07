import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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

    TextStyle titleStyle = const  TextStyle();
    TextStyle subTitleStyle = TextStyle(color: Colors.grey.shade700);

    if(user.roleId?["permissions"]==null)
      {
        return ListTile(

          leading:Container(
            width: 35,
            height: 35,
            clipBehavior: Clip.hardEdge,
            decoration : BoxDecoration(
                shape: BoxShape.circle
            ),
            child: CachedNetworkImage(
              imageUrl: user.image??"",
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const CircleAvatar(child:Icon(Icons.person),),
            ),
          ),

          title: Text(user.name??"Unknown",style: titleStyle,),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email - ${user.email??""}",style: subTitleStyle,),
              Text("Role name - ${user.roleId?["roleName"]??"No Role assign"}",style: subTitleStyle,),
            ],
          ),
        );
      }

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

      childrenPadding:const  EdgeInsets.symmetric(horizontal: 20),

      leading:Container(
        width: 35,
        height: 35,
        clipBehavior: Clip.hardEdge,
        decoration : BoxDecoration(
          shape: BoxShape.circle
        ),
        child: CachedNetworkImage(
          imageUrl: user.image??"",
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const CircleAvatar(child:Icon(Icons.person),),
        ),
      ),

      title: Text(user.name??"Unknown",style: titleStyle,),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email - ${user.email??""}",style: subTitleStyle,overflow: TextOverflow.ellipsis,),
          Text("Role name - ${user.roleId?["roleName"]??"No Role assign"}",style: subTitleStyle,),
        ],
      ),

      children: [
        if(user.roleId?["permissions"]!=null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DataTable(
            columns: [
              DataColumn(label: Text("Permissions")),
              DataColumn(label: Text("Read")),
              DataColumn(label: Text("Write")),
            ],

            rows: [
              for(var per in user.roleId?["permissions"]??[])
                for(String name in per.keys)
                  DataRow(
                      cells: [
                        DataCell(Text(name),),
                        DataCell(Center(child: (per[name].contains("read"))?Icon(Icons.check,color: AppConstent().primeryColor,):Icon(Icons.close,color: Colors.red,))),
                        DataCell(Center(child: (per[name].contains("write"))?Icon(Icons.check,color: AppConstent().primeryColor,):Icon(Icons.close,color: Colors.red,))),
                      ]
                  ),
            ],

          ),
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
