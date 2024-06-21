import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/positionedButton.dart';
import 'package:leadkart/component/selectedEditorImage.dart';
import 'package:leadkart/component/selectedImageView.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/enums.dart';
import 'package:leadkart/helper/helper.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final imageController = Controllers.imageEditorController;// Track the position of the selected image

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: Obx(
            () {
              return Stack(children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/add_images/img_3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  for(var i in imageController.widgetList) GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        //if selected image position is within the image container
                        // if(i.offset.dx + details.delta.dx >= 0 && i.offset.dx + details.delta.dx <= MediaQuery.of(context).size.width - 100 && i.offset.dy + details.delta.dy >= 0 && i.offset.dy + details.delta.dy <= MediaQuery.of(context).size.width - 100) {
                        //   i.offset = Offset(i.offset.dx + details.delta.dx, i.offset.dy + details.delta.dy);
                        // }
                  i.offset = Offset(i.offset.dx + details.delta.dx, i.offset.dy + details.delta.dy);

                      });
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          left: i.offset.dx,
                          top: i.offset.dy,

                          child: i.widgetType==WidgetType.image.toString()? SelectedEditorWidgetView(
                            width: 200,
                            height: 200,
                            widgetId: i.widgetId,
                            child: i.child,
                            iconPath: 'assets/close.svg',
                          ):SelectedEditorTextView(child: i.child, width: 300, height: 100, widgetId: i.widgetId, iconPath: 'assets/close.svg'),
                        ),
                      ],
                    ),
                  )
              ]);
            }
          ),
        ),
      ),
    );
  }
}
