import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';
import 'package:leadkart/component/customAppBar.dart';
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

        appBar:PreferredSize(
        preferredSize: Size.fromHeight(60),
    child: CustomAppBar(

    trailingButton: HelpButton(
      icon: Icons.search,
      title: "Search",
    ),

    )),


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
