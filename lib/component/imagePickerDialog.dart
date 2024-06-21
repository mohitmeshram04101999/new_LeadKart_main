import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/positionedButton.dart';
import 'package:leadkart/component/selectedImageView.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/enums.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:uuid/uuid.dart';

import '../controllers/imageEditorController.dart';

class ImagePickerDialog extends StatefulWidget {
  const ImagePickerDialog({super.key});

  @override
  State<ImagePickerDialog> createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  final imageController = Controllers.imageEditorController;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Text('Select Image'),
      content: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
                    () {
                  return imageController.image.value == ''
                      ? InkWell(
                    onTap: () {
                      imageController.pickImage();
                    },
                    child: DottedBorder(
                        radius: Radius.circular(10),
                        borderPadding: EdgeInsets.all(10),
                        borderType: BorderType.RRect,
                        color: MyHelper.appConstent.dottedBorderColor,
                        child: Container(
                            width: double.maxFinite,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/upload.png', width: 25),
                                  SizedBox(width: 10),
                                  Text('upload an Image',
                                      style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            )


                        )),
                  ): SizedBox(
                    width: double.maxFinite, height: 150,
                    child: Center(
                      child:SelectedImageView(imagePath: imageController.image.value)
                    ),
                  );
                }
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    imageController.image.value = '';
                    context.pop();
                  },
                  child: Text('Cancel'),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor))),
                    fixedSize: WidgetStatePropertyAll<Size>(Size(100, 40)),
                  ),
                ),
                ElevatedButton(onPressed: () {
                  imageController.selectedImage.value = imageController.image.value;
                  imageController.widgetList.add(WidgetConfigModel(
                      brightness: imageController.imageBrightness.value,
                      contrast: imageController.imageContrast.value,
                      blur: imageController.imageBlur.value,
                      saturation: imageController.imageSaturation.value,
                      sharpness: imageController.imageSharpness.value,
                      hue: imageController.imageHue.value,
                      child:Image.file(File(imageController.image.value)),
                      scale: imageController.imageScale.value,
                      rotation: imageController.imageRotation.value,
                      offset: imageController.imageOffset.value,
                    widgetId: Uuid().v4(),
                    widgetType: WidgetType.image.toString()
                  ));
                  context.pop();
                }, child: Text('Submit')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldPickerDialog extends StatefulWidget {
  const TextFieldPickerDialog({super.key});

  @override
  State<TextFieldPickerDialog> createState() => _TextFieldPickerDialogState();
}

class _TextFieldPickerDialogState extends State<TextFieldPickerDialog> {
  final imageController = Controllers.imageEditorController;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Write somethig below", style:Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 100,
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'Enter Text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    textController.clear();
                    context.pop();
                  },
                  child: Text('Cancel'),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor))),
                    fixedSize: WidgetStatePropertyAll<Size>(Size(100, 40)),
                  ),
                ),
                ElevatedButton(onPressed: () {
                  imageController.widgetList.add(WidgetConfigModel(
                      brightness: imageController.imageBrightness.value,
                      contrast: imageController.imageContrast.value,
                      blur: imageController.imageBlur.value,
                      saturation: imageController.imageSaturation.value,
                      sharpness: imageController.imageSharpness.value,
                      hue: imageController.imageHue.value,
                      child:Text(textController.text, style: TextStyle(
                        color:Colors.white
                      ),),
                      scale: imageController.imageScale.value,
                      rotation: imageController.imageRotation.value,
                      offset: imageController.imageOffset.value,
                      widgetId: Uuid().v4(),
                    widgetType: WidgetType.textField.toString()
                  ));
                  // textController.clear();
                  context.pop();
                }, child: Text('Submit')),
              ],
            )
          ],
        ),
      );
  }
}


