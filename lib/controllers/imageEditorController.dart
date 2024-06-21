import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/screens/imageEditor/imageEditor.dart';

class ImageEditorController extends GetxController {
  final undo = false.obs;
  final redo = false.obs;


  final image = ''.obs;
  final selectedImage = ''.obs;
  var widgetList = <WidgetConfigModel>[].obs;
  pickImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type:FileType.image
    );
    if(result != null){
      image.value = result.files.single.path!;
    }
  }
  final containerWidth = 0.0.obs;
  final containerHeight = 0.0.obs;
  final isTextFieldClicked = false.obs;
  final imageOffset = Offset.zero.obs;
  final imageScale = 1.0.obs;
  final imageRotation = 0.0.obs;
final isAdjustClicked = false.obs;
  final imageBrightness = 0.0.obs;
  final imageContrast = 0.0.obs;
  final imageBlur = 0.0.obs;
  final imageSaturation = 0.0.obs;
  final imageSharpness = 0.0.obs;
  final imageHue = 0.0.obs;
}

class WidgetConfigModel {
   double brightness;
   double contrast;
   double blur;
   double saturation;
   double sharpness;
   double hue;
 Widget child;
 double scale;
 double rotation;
 Offset offset;
 String widgetId;
 String widgetType;

//<editor-fold desc="Data Methods">
  WidgetConfigModel({
    required this.brightness,
    required this.contrast,
    required this.blur,
    required this.saturation,
    required this.sharpness,
    required this.hue,
    required this.child,
    required this.scale,
    required this.rotation,
    required this.offset,
    required this.widgetId,
    required this.widgetType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WidgetConfigModel &&
          runtimeType == other.runtimeType &&
          brightness == other.brightness &&
          contrast == other.contrast &&
          blur == other.blur &&
          saturation == other.saturation &&
          sharpness == other.sharpness &&
          hue == other.hue &&
          child == other.child &&
          scale == other.scale &&
          rotation == other.rotation &&
          offset == other.offset &&
          widgetId == other.widgetId &&
          widgetType == other.widgetType);

  @override
  int get hashCode =>
      brightness.hashCode ^
      contrast.hashCode ^
      blur.hashCode ^
      saturation.hashCode ^
      sharpness.hashCode ^
      hue.hashCode ^
      child.hashCode ^
      scale.hashCode ^
      rotation.hashCode ^
      offset.hashCode ^
      widgetId.hashCode ^
      widgetType.hashCode;

  @override
  String toString() {
    return 'WidgetConfigModel{' +
        ' brightness: $brightness,' +
        ' contrast: $contrast,' +
        ' blur: $blur,' +
        ' saturation: $saturation,' +
        ' sharpness: $sharpness,' +
        ' hue: $hue,' +
        ' child: $child,' +
        ' scale: $scale,' +
        ' rotation: $rotation,' +
        ' offset: $offset,' +
        ' widgetId: $widgetId,' +
        ' widgetType: $widgetType,' +
        '}';
  }

  WidgetConfigModel copyWith({
    double? brightness,
    double? contrast,
    double? blur,
    double? saturation,
    double? sharpness,
    double? hue,
    Widget? child,
    double? scale,
    double? rotation,
    Offset? offset,
    String? widgetId,
    String? widgetType,
  }) {
    return WidgetConfigModel(
      brightness: brightness ?? this.brightness,
      contrast: contrast ?? this.contrast,
      blur: blur ?? this.blur,
      saturation: saturation ?? this.saturation,
      sharpness: sharpness ?? this.sharpness,
      hue: hue ?? this.hue,
      child: child ?? this.child,
      scale: scale ?? this.scale,
      rotation: rotation ?? this.rotation,
      offset: offset ?? this.offset,
      widgetId: widgetId ?? this.widgetId,
      widgetType: widgetType ?? this.widgetType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brightness': this.brightness,
      'contrast': this.contrast,
      'blur': this.blur,
      'saturation': this.saturation,
      'sharpness': this.sharpness,
      'hue': this.hue,
      'child': this.child,
      'scale': this.scale,
      'rotation': this.rotation,
      'offset': this.offset,
      'widgetId': this.widgetId,
      'widgetType': this.widgetType,
    };
  }

  factory WidgetConfigModel.fromMap(Map<String, dynamic> map) {
    return WidgetConfigModel(
      brightness: map['brightness'] as double,
      contrast: map['contrast'] as double,
      blur: map['blur'] as double,
      saturation: map['saturation'] as double,
      sharpness: map['sharpness'] as double,
      hue: map['hue'] as double,
      child: map['child'] as Widget,
      scale: map['scale'] as double,
      rotation: map['rotation'] as double,
      offset: map['offset'] as Offset,
      widgetId: map['widgetId'] as String,
      widgetType: map['widgetType'] as String,
    );
  }

//</editor-fold>
}