import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/positionedButton.dart';
import 'package:leadkart/component/selectedEditorImage.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/enums.dart';
import 'package:leadkart/helper/helper.dart';

class AdjustImageView extends StatefulWidget {
  const AdjustImageView({super.key});

  @override
  State<AdjustImageView> createState() => _AdjustImageViewState();
}

class _AdjustImageViewState extends State<AdjustImageView> {
  final imageController = Controllers.imageEditorController;

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
              return ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: imageController.imageBlur.value*5, sigmaY: imageController.imageBlur.value*5),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.grey.withOpacity(
                      imageController.imageContrast.value), BlendMode.overlay),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.blue.withOpacity(
                        imageController.imageHue.value), BlendMode.hue),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.grey.withOpacity(
                          imageController.imageSaturation.value), BlendMode.saturation),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(
                            imageController.imageBrightness.value), BlendMode.darken),
                        child: Stack(children: [
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
                                // imageController.imageOffset.value += details
                                //     .delta; // Update the position based on the drag
                                // log('Image Offset: ${imageController.imageOffset.value}');
                                // i.offset+= details.delta;
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

                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height:MediaQuery.of(context).size.width,
                          //   color:Colors.transparent
                          // )
                        ]),
                      ),
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
