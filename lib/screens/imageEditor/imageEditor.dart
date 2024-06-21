import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/adjustImageView.dart';
import 'package:leadkart/component/imagePickerDialog.dart';
import 'package:leadkart/component/imageView.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/helper.dart';


class ImageEditor extends StatefulWidget {
  const ImageEditor({super.key});

  @override
  State<ImageEditor> createState() => _ImageEditorState();
}

class _ImageEditorState extends State<ImageEditor> {
  final imageController = Controllers.imageEditorController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select frame'),
        foregroundColor: Colors.white,
        actions: [
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              fixedSize:
                  MaterialStateProperty.resolveWith((states) => Size(100, 20)),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Theme.of(context).primaryColor),
              side: MaterialStateProperty.resolveWith(
                  (states) => BorderSide(color: Colors.white)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Next', style: TextStyle(color: Colors.white)),
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: imageController.isAdjustClicked.value?150:100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              imageController.isAdjustClicked.value?  Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    AdjustOption(text: 'Brightness', onTap: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) =>  Container(
                            height: 150,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      context.pop();
                                    }, icon: Icon(Icons.arrow_back)),
                                    Icon(Icons.sunny),
                                    SizedBox(width: 5),
                                    Text('Brightness')
                                  ],
                                ),
                                Slider(
                                  value: imageController.imageBrightness.value,
                                  onChanged: (value) {
                                    setState(() {
                                      imageController.imageBrightness.value = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },);
                    }),
                    AdjustOption(text: 'Saturation', onTap: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) =>  Container(
                            height: 150,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      context.pop();
                                    }, icon: Icon(Icons.arrow_back)),
                                    Icon(Icons.sunny),
                                    SizedBox(width: 5),
                                    Text('Saturation')
                                  ],
                                ),
                                Slider(
                                  value: imageController.imageSaturation.value,
                                  onChanged: (value) {
                                    setState(() {
                                      imageController.imageSaturation.value = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },);
                    }),
                    AdjustOption(text: 'Hue', onTap: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) =>  Container(
                            height: 150,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      context.pop();
                                    }, icon: Icon(Icons.arrow_back)),
                                    Icon(Icons.sunny),
                                    SizedBox(width: 5),
                                    Text('Hue')
                                  ],
                                ),
                                Slider(
                                  value: imageController.imageHue.value,
                                  onChanged: (value) {
                                    setState(() {
                                      imageController.imageHue.value = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },);
                    }),
AdjustOption(text: 'Contrast', onTap: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) =>  Container(
                            height: 150,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      context.pop();
                                    }, icon: Icon(Icons.arrow_back)),
                                    Icon(Icons.sunny),
                                    SizedBox(width: 5),
                                    Text('Contrast')
                                  ],
                                ),
                                Slider(
                                  value: imageController.imageContrast.value,
                                  onChanged: (value) {
                                    setState(() {
                                      imageController.imageContrast.value = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },);
                    }),
                    AdjustOption(text: 'Blur', onTap: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) =>  Container(
                            height: 150,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      context.pop();
                                    }, icon: Icon(Icons.arrow_back)),
                                    Icon(Icons.sunny),
                                    SizedBox(width: 5),
                                    Text('Blur')
                                  ],
                                ),
                                Slider(
                                  value: imageController.imageBlur.value,
                                  onChanged: (value) {
                                    setState(() {
                                      imageController.imageBlur.value = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },);
                    }),
                  ],
                ),
              ):Container(),
              Expanded(
                child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                BottomChips(text: 'Frame', onTap: () {}),
                BottomChips(text: 'Text', onTap: () {
                  setState(() {
                    imageController.isAdjustClicked.value = false;
                  });
                  showModalBottomSheet(context: context, builder: (context) {
                    return TextFieldPickerDialog();
                  },);
                }),
                BottomChips(
                    text: 'Image',
                    onTap: () {
                      setState(() {
                        imageController.isAdjustClicked.value = false;
                      });
                      showDialog(
                          context: context, builder: (context) => ImagePickerDialog());
                    }),
                BottomChips(text: 'Adjust', onTap: () {
                  setState(() {
                    imageController.isAdjustClicked.value = !imageController.isAdjustClicked.value;
                  });
                }),
                BottomChips(text: 'Business', onTap: () {}),
                BottomChips(text: 'Sticker', onTap: () {}),
                        ],
                      ),
              ),
            ],
          )),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.share, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.download, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
         !imageController.isAdjustClicked.value? ImageView():AdjustImageView(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/undo.png', width: 25),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/redo.png', width: 25),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomChips extends StatefulWidget {
  final String text;
  final String? icon;
  Function()? onTap;
  BottomChips({super.key, required this.text, this.icon, this.onTap});

  @override
  State<BottomChips> createState() => _BottomChipsState();
}

class _BottomChipsState extends State<BottomChips> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActionChip(
          label: Row(
            children: [
              Icon(Icons.filter_frames_outlined),
              SizedBox(width: 5),
              Text(widget.text),
            ],
          ),
          backgroundColor: MyHelper.appConstent.leadsBannerColor,
          shape: StadiumBorder(),
          onPressed: widget.onTap),
    );
  }
}
class AdjustOption extends StatefulWidget {
  final String text;
  final String? icon;
  Function()? onTap;
  AdjustOption({super.key, required this.text, this.icon, this.onTap});

  @override
  State<AdjustOption> createState() => _AdjustOptionState();
}

class _AdjustOptionState extends State<AdjustOption> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActionChip(
          label: Row(
            children: [
              Icon(Icons.filter_frames_outlined),
              SizedBox(width: 5),
              Text(widget.text),
            ],
          ),
          backgroundColor: MyHelper.appConstent.leadsBannerColor,
          shape: StadiumBorder(
            side: BorderSide(color: Colors.transparent),
          ),
          onPressed: widget.onTap),
    );
  }
}


