import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/controllers/targetAreaSearchAreaController.dart';
import 'package:leadkart/helper/controllerInstances.dart';
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
    return WillPopScope(
      onWillPop: ()async{
        Controllers.targateAreaProvider(context).clear();
        return true;

      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.only(right: 15),
            child: Consumer<TargateAreaProvider>(
              builder: (a,p,c)=>CupertinoSearchTextField(
                controller: p.searchController,
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

            if(p.searchResult.isEmpty && p.searchController.text.isNotEmpty)
              {
                return Center(child: Text("No Result Found"));
              }

            if(p.searchResult.isEmpty)
              {
                return const Center(child: Text("Search Target Area"));
              }

            return ListView(
              children: [
                for(var targate in p.searchResult)
                  ListTile(

                    onTap: (){
                      Controllers.createAddProvider(context).setTargetArea(targate);
                      p.clear();
                      Navigator.pop(context);
                    },

                    leading: const Icon(Icons.location_pin),

                    title: Text(targate.name??""),

                    subtitle: Text("${(targate.type=="city"||targate.type=="neighborhood"||targate.type=="subcity")?'${targate.region}, ${targate.countryName}':"${targate.countryName}"}",
                      style: const TextStyle(color: Colors.grey),
                    ),


                  )
              ],
            );
          },
        ),

      ),
    );
  }
}
