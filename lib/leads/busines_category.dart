

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/component/customBackground.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';

import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/leads/crateAdd%20Tab/tab1.dart';
import 'package:leadkart/leads/crateAdd%20Tab/tab2.dart';
import 'package:leadkart/leads/crateAdd%20Tab/tab3.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/actionButton.dart';import 'package:leadkart/them/constents.dart';

import 'package:leadkart/helper/controllerInstances.dart';
import 'package:logger/logger.dart';

import 'package:provider/provider.dart';

import 'crateAdd Tab/tab4.dart';

class CreateBusinessScreen extends StatefulWidget {
  const CreateBusinessScreen({Key? key}) : super(key: key);

  @override
  State<CreateBusinessScreen> createState() => _CreateBusinessScreenState();
}

class _CreateBusinessScreenState extends State<CreateBusinessScreen> {
  TextEditingController textEditingController = TextEditingController();


  // List of category names
  final List<String> categoryNames = [
    'Art & Entertainment',
    'Business',
    'Education',
    'Health',
    'Technology',
    'Travel',
    'Food & Beverage',
    'Fashion',
    'Sports',
    'Muisc',
    'Dance',
    'Sports',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controllers.businessCategoryProvider(context,listen: false).lode(context);
  }

  final pageController = PageController(initialPage: 0);
  int curruntPAge = 0;

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: ()async{
        Provider.of<CreateBusinessProvider>(context,listen: false).clear();
        return true;
      },

      child: CustomBackground(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Consumer<BussnissCategoryProvider>(
              builder: (context, p1, child) =>
                  Consumer<CreateBusinessProvider>(
                builder: (context, p, child) => MyactionButton(
                  action: () async{

                    if(curruntPAge==0)
                    {
                      if(p.businessNameController.text.trim().isNotEmpty)
                      {
                        pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
                      }
                    }
                    if(curruntPAge==1)
                    {
                      if(p.businessCategoryId!=null)
                      {
                        pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
                      }
                    }

                    if(curruntPAge==2)
                    {
                      Logger().i("${p1.allSrvices},${p.cityId},${p.stateId!=null}");
                      if(p1.allSrvices.isNotEmpty&&p.cityId!=null&&p.stateId!=null)
                        {
                          pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
                        }
                      else
                        {
                          MyHelper.mySnakebar(context, 'Select AtLeast 1 Service, and State and City');
                        }
                    }


                    if(curruntPAge==3)
                      {
                        await p.createBusiness(context);
                      }
                  },
                  lable: "Continue",
                ),
              ),

            ),
          ),


          //
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            leading: SizedBox(),
            leadingWidth: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  for(int i=0;i<4;i++)
                    Expanded(child: AnimatedContainer(
                      height:5 ,
                      width: double.infinity,
                      // child: kDebugMode?Text("${curruntPAge} $i"):null,
                      decoration: BoxDecoration(
                        color: (curruntPAge>=i)?AppConstent().primeryColor:Colors.white,
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      duration: Duration(milliseconds: 300),
                    ))
                ],
              ),
            ),
          ),

          backgroundColor:Colors.transparent,
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (i){
              curruntPAge = i;
              setState(() {

              });
            },
            children: [

              //tab 1
              CreateBusinessTab1(),

              //tab2
              CreateBusinessTab2(),

              //tab3
              CreateBusinessTab3(),

              //tab 4
              CreateBusinessTab4()



            ],
          ),
        ),
      ),
    );
  }
}
