import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:leadkart/component/positionedButton.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/enums.dart';
import 'package:leadkart/helper/helper.dart';

class SelectedImageView extends StatefulWidget {
  final String imagePath;
  final String iconPath;
  const SelectedImageView({super.key, required this.imagePath, this.iconPath='assets/repic.svg'});

  @override
  State<SelectedImageView> createState() => _SelectedImageViewState();
}

class _SelectedImageViewState extends State<SelectedImageView> {
  final imageController = Controllers.imageEditorController;
  @override
  Widget build(BuildContext context) {
    return widget.imagePath.isNotEmpty? Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
borderRadius: BorderRadius.circular(10),
          child: Image.file(
            File(widget.imagePath),),
        ),
        TopPostionedButton(
          onTap: () {
            imageController.pickImage();
          },
          iconPath: widget.iconPath,
        )
      ],
    ):Container();
  }
}


