import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';
import 'package:shimmer/shimmer.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Shimmer(
                period: const Duration(milliseconds: 1000),
              gradient: LinearGradient(
                colors: [
                  AppConstent().primeryColor,
                  AppConstent().primeryColor.withOpacity(.8)
                ]
              ),
                child:const  Icon(FontAwesomeIcons.facebook,size: 150,)),

            Shimmer(
              // direction: ShimmerDirection.ttb,
              period: const Duration(milliseconds: 1000),
              gradient: LinearGradient(
                colors: [
                  AppConstent().primeryColor,
                  AppConstent().primeryColor.withOpacity(.8),
                ]
              ),
              child: const Text("LEADKART",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 60),),
            ),
          ],
        )
      ),
    );
  }
}
