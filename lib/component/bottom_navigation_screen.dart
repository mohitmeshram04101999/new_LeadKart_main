import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/business_pages/busines_detail.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/ads_image.dart';
import 'package:leadkart/screens/newLead%20Screen/LeadeScreen.dart';
import 'package:logger/logger.dart';

import '../home_pages/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late var pageController;
  final List<Widget> pages = [
    const HomeScreen(),
    // const AddImages(),
    const AdsPage(),
    const LeadScreen(),
    // CreateAds(),
    const BusinessDetail(),
  ];

  List<MyCustomNavigationItem> _items = [
    MyCustomNavigationItem(icon: "assets/bottom_nav/home.png", lable: "Home"),
    // MyCustomNavigationItem(icon: "assets/bottom_nav/1.png", lable: "Add Image"),
    MyCustomNavigationItem(icon: "assets/bottom_nav/add.png", lable: "Ads"),
    MyCustomNavigationItem(icon: "assets/bottom_nav/lead.png", lable: "Leads"),
    MyCustomNavigationItem(icon: "assets/bottom_nav/business.png", lable: "Business"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);

  }
  int curruntPAge = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: PageView(
          onPageChanged: (v){
            curruntPAge = v;
            setState(() {

            });
          },
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: pages,
        ),
        bottomNavigationBar: CustomBottomTile(
          curruntIndex: curruntPAge,
          pageController: pageController,
          item: _items,
          onTap: (n) {
            print(pageController.page);
            pageController.jumpToPage(n);
          },
          // ),
        ));
  }
}

class MyCustomNavigationItem {
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
  final int curruntIndex;
  final PageController pageController;
  final Function(int) onTap;
  final List<MyCustomNavigationItem> item;
  const CustomBottomTile(
      {required this.pageController,
        required this.curruntIndex,
      required this.onTap,
      required this.item,
      super.key});

  @override
  State<CustomBottomTile> createState() => _CustomBottomTileState();
}

class _CustomBottomTileState extends State<CustomBottomTile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.pageController.jumpToPage(0);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: BottomAppBar(
        shadowColor: Colors.grey,
        elevation: 5,
        color: Colors.white,
        padding: EdgeInsets.zero,
        child: Ink(
          height: 60,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [

            BoxShadow(
                spreadRadius: 2,
                blurRadius: 2,
                color: Colors.grey)
          ]),
          child: Row(
            children: List.generate(
                widget.item.length,
                (i) => Expanded(
                        child: InkWell(
                      onTap: () {
                        widget.onTap(i);
                        setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(kDebugMode)
                            Text("${widget.pageController.page?.toInt()} $i"),
                          if (widget.item[i].icon != null) ...[
                            SizedBox(
                              width: 22,
                              child: Image.asset(widget.item[i].icon!,
                                  color:
                                      (widget.curruntIndex == i)
                                          ? MyHelper.appConstent.primeryColor
                                          : Colors.black),
                            )
                          ] else ...[
                            Theme(
                                data: ThemeData(
                                  iconTheme: IconThemeData(
                                      color:
                                          (widget.curruntIndex ==
                                                  i)
                                              ? MyHelper.appConstent.primeryColor
                                              : Colors.black),
                                ),
                                child: widget.item[i].child ?? SizedBox()),
                          ],
                          Text(
                            widget.item[i].lable,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                                color: (widget.curruntIndex == i)
                                    ? MyHelper.appConstent.primeryColor
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}
