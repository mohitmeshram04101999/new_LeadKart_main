import 'package:flutter/material.dart';
import 'package:leadkart/component/subUser%20viewTile.dart';
import 'package:leadkart/controllers/SubUserProvider.dart';
import 'package:leadkart/controllers/addSubUserProvider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/animated%20dilog.dart';
import 'package:provider/provider.dart';



class ManageUserScreen extends StatefulWidget {
  const ManageUserScreen({super.key});

  @override
  State<ManageUserScreen> createState() => _ManageUserScreenState();
}

class _ManageUserScreenState extends State<ManageUserScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controllers.subUserProvider(context).lode(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:const Text("Manage Users"),
        actions: [
          Consumer<AddSubUserProvider>(builder: (a,p,c)=>IconButton(onPressed:()=> p.addUser(context), icon: const Icon(Icons.person_add)))
        ],
      ),


      body:Consumer<SubUserProvider>(
          builder: (a,p,c)=>

          //ListBuilder
              ListView.builder(
                itemCount: p.subUsers.length,
                itemBuilder: (a,i){

                  //returnWidget
                  return SubUserTile(
                      user: p.subUsers[i]
                  );

                },
              )
      )

    );
  }
}
