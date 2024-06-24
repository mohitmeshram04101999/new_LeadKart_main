import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/component/helpButton.dart';
import 'package:leadkart/component/image_row.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';

class AddImages extends StatefulWidget {
  const AddImages({Key? key}) : super(key: key);

  @override
  State<AddImages> createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {

  final List<String> imagePaths = [
    'assets/add_images/img.png',
    'assets/add_images/img_1.png',
    'assets/add_images/img_2.png',
    // 'assets/add_images/img.png',
    // Add more image paths if needed
  ];

  final List<String> imagePaths2 = [
    'assets/add_images/img_3.png',
    'assets/add_images/img_4.png',
    'assets/add_images/img_5.png',
    // 'assets/add_images/img.png',
    // Add more image paths if needed
  ];

  final List<String> imagePaths3 = [
    'assets/add_images/img_6.png',
    'assets/add_images/img_7.png',
    'assets/add_images/img_8.png',
    // 'assets/add_images/img.png',
    // Add more image paths if needed
  ];


  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar:  AppBar(
        leading: SizedBox(),
        leadingWidth: 0,

        title: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: SC.from_width(40),
              height: SC.from_height(30),
              decoration: BoxDecoration(
                // border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/home_images/img.png',
              ),
            ),
            InkWell(
              onTap: () {
                MyHelper.mybottomPanel(context: context,
                  builder: (context,d) {
                    return Container(
                      child: ListView.builder(
                        controller: d,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('SK e solution $index'),
                            onTap: () {
                              Navigator.pop(context, {'index': index});
                            },
                          );
                        },
                      ),
                    );
                  },);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    " SK e solution  ",
                    style: TextStyle(color: Colors.white, fontSize: SC.from_height(18)),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
            Spacer(),
            // SizedBox(width: SC.from_width(50)),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HelpButton(
                title: 'Search?',
                icon: Icons.search,
              ),
            ),
          ],
        ),
        // actions: [
        //
        //
        //   // Container(
        //   //   child: Row(
        //   //     mainAxisAlignment: MainAxisAlignment.center,
        //   //     children: [
        //   //       Icon(Icons.search,size:  SC.from_height(17),color: Colors.white,),
        //   //       SizedBox(width: SC.from_height(4),),
        //   //       Center(child: Text('Search',style: TextStyle(fontSize: SC.from_height(16),color: Colors.white),),),
        //   //     ],
        //   //   ),
        //   //   width: SC.from_height(85),
        //   //   height: SC.from_height(30),
        //   //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(SC.from_height(15)),border: Border.all(
        //   //       color: Colors.white,width: 1.5
        //   //   )),
        //   // ),
        //   SizedBox(width: SC.from_height(20)),
        // ],
      ),


      body: ListView(
        children: [
          SizedBox(height: SC.from_height(18),),

          CustomListTile(
            title: 'AI Created Images',
            subtitle: 'For Your Business',
            trailingText: 'See more',
          ),



          ImageRow(imagePaths: ['assets/add_images/img.png', 'assets/add_images/img_1.png', 'assets/add_images/img_2.png']),

          // BUSINESS IMAGE //

          CustomListTile(
            title: 'Business Image',
            subtitle: 'For Your Business',
            trailingText: 'See more',
          ),

          ImageRow(imagePaths: ['assets/add_images/img_3.png', 'assets/add_images/img_4.png', 'assets/add_images/img_5.png']),

          // AYUSHMAN BHARAT DIWAS //
          CustomListTile(
            title: 'Ayushman Bharat Diwas',
            subtitle: 'For Your Business',
            trailingText: 'See more',
          ),

           
          ImageRow(imagePaths: ['assets/add_images/img_6.png', 'assets/add_images/img_7.png', 'assets/add_images/img_8.png']),

        ],
      ),
    );
  }
}
