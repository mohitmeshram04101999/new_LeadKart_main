
import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';


class LeadeTile extends StatelessWidget {
  const LeadeTile({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 8,
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: SC.from_width(20)),
      child: Container(
        height: SC.from_width(73),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //Leading
            Container(
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.all(SC.from_width(8)),
              width: SC.from_width(69),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300,width: 2),
                  borderRadius: BorderRadius.circular(5)),
              child: Stack(
                children: [
                  Image.asset("assets/onBording2/leadTileImage.png",fit: BoxFit.cover,),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: SC.from_width(17),
                      color: Colors.black.withOpacity(.5),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text("See detail",
                      style: TextStyle(fontSize: SC.from_width(8.7),color: Colors.white),),
                    ),
                  )

                ],
              ),

            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //title
                Text("Demo Lead",style: MyHelper.textStyls.leadTileTitle,),

                //subtitle
                Text("+91 9988909890",style: MyHelper.textStyls.leadTileSubTitle,),

                Text("Added : 8789-887-788",style: MyHelper.textStyls.leadTileSubTitle,),

              ],
            ),
            Spacer(),

            AspectRatio(aspectRatio: 1,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text("New Lead",style: TextStyle(fontSize: SC.from_width(12),fontWeight: FontWeight.w500),),
                      decoration: BoxDecoration(
                          color: MyHelper.appConstent.leadTiletagColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32)
                        )
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Center(
                            child: ShaderMask(
                              shaderCallback: (b){
                                return LinearGradient(colors: [
                                  MyHelper.appConstent.OnbordingAppBar.withOpacity(1),
                                  Color.fromRGBO(78, 168, 255, 1)
                                ]).createShader(b);
                              },
                              child: CircleAvatar(),
                            ),
                          ),
                          Center(child: Icon(Icons.call_outlined,color: Colors.white,))
                        ],
                      ),
                    ),
                  ],
                ))


          ],
        ),
      ),
    );
  }
}
