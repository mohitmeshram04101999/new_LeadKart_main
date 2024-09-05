import 'package:flutter/material.dart';
import 'package:leadkart/add_images/add_images.dart';
import 'package:leadkart/business_pages/busines_detail.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/ads_image.dart';
import 'package:leadkart/screens/newLead%20Screen/LeadeScreen.dart';

import '../home_pages/home_screen.dart';




class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {


  final List<Widget> pages = [
    const HomeScreen(),
    // const AddImages(),
    const AdsPage(),
    const LeadScreen(),
    // CreateAds(),
    const BusinessDetail(),
  ];


  List<MyCustomNavigationItem> _items  = [
    MyCustomNavigationItem(child: Icon(Icons.home_outlined), lable: "Home"),
    // MyCustomNavigationItem(icon: "assets/bottom_nav/1.png", lable: "Add Image"),
    MyCustomNavigationItem(icon: "assets/bottom_nav/2.png", lable: "Ads"),
    MyCustomNavigationItem(icon: "assets/bottom_nav/3.png", lable: "Leads"),
    MyCustomNavigationItem(icon: "assets/bottom_nav/4.png", lable: "Business"),
  ];




  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: PageView(
        controller:pageController,
        children: pages,
      ),


      bottomNavigationBar: CustomBottomTile(
    pageController: pageController,
        item: _items,
    onTap: (n){
          print(pageController.page);
          pageController.jumpToPage(n);
      },
      // ),

    ));
  }
}



class MyCustomNavigationItem
{
  final String? icon;
  final Widget? child;
  final String lable;
  MyCustomNavigationItem({
    this.icon,
    this.child,
    required this.lable,
});
}


class CustomBottomTile extends StatefulWidget {
  final PageController pageController;
  final Function(int) onTap;
  final List<MyCustomNavigationItem> item;
  const CustomBottomTile({required this.pageController,required this.onTap,required this.item,super.key});

  @override
  State<CustomBottomTile> createState() => _CustomBottomTileState();
}

class _CustomBottomTileState extends State<CustomBottomTile> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Ink(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(-1,-1),
              color: Colors.grey.shade300
            )
          ]
        ),
        child: Row(
          children: List.generate(widget.item.length, (i)=>Expanded(child: InkWell(
            onTap: (){
              widget.onTap(i);
              setState(() {

              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                if(widget.item[i].icon!=null)...[
                  SizedBox(width: 22,child: Image.asset(widget.item[i].icon!,color: (widget.pageController.page?.toInt()==i)?MyHelper.appConstent.primeryColor:Colors.black),)
                ]

                else...[
                  Theme(data: ThemeData(
                    iconTheme: IconThemeData(
                        color: (widget.pageController.page?.toInt()==i)?MyHelper.appConstent.primeryColor:Colors.black
                    ),
                  ), child: widget.item[i].child??SizedBox()),
                  ],
                Text(widget.item[i].lable,style: TextStyle(color: (widget.pageController.page?.toInt()==i)?MyHelper.appConstent.primeryColor:Colors.black),),
              ],
            ),
          ))),
        ),
      ),
    );
  }
}

