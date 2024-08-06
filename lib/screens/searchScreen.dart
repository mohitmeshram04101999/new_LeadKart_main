import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/controllers/targetAreaSearchAreaController.dart';
import 'package:provider/provider.dart';

class SearchTargetAreaScreen extends StatefulWidget {
  const SearchTargetAreaScreen({super.key});

  @override
  State<SearchTargetAreaScreen> createState() => _SearchTargetAreaScreenState();
}

class _SearchTargetAreaScreenState extends State<SearchTargetAreaScreen> {
  final border =   OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Consumer<TargateAreaProvider>(
            builder: (a,p,c)=>CupertinoSearchTextField(
              backgroundColor: Colors.white,
              suffixIcon: Icon(CupertinoIcons.search,size: 0,),
              prefixIcon: SizedBox(),
              onChanged: (data){
                p.search(context, data: data);
              },

              //
              //

            ),
          ),
        ),

        // title: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal:8.0),
        //   child: SizedBox(
        //     height: 50,
        //     child: TextFormField(
        //       decoration: InputDecoration(
        //
        //         prefixIcon: IconButton(icon: const Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context),),
        //         suffixIcon: IconButton(icon: const Icon(Icons.search),onPressed: (){},),
        //
        //         border: border,
        //         hintText: "Search",
        //
        //         focusedBorder:  border,
        //
        //         contentPadding: const  EdgeInsets.symmetric(horizontal: 8),
        //         fillColor: Colors.white,
        //         filled: true,
        //       ),
        //     ),
        //   ),
        // ),
      ),


      body: Consumer<TargateAreaProvider>(
        builder: (a,p,c){

          if(p.loading)
            {
              return const Center(child: CircularProgressIndicator());
            }

          return ListView(
            children: [
              for(var targate in p.searchResult)
                ListTile(
                  title: Text(targate.name),
                )
            ],
          );
        },
      ),

    );
  }
}
