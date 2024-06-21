import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leadkart/helper/controllerInstances.dart';

class TopPostionedButton extends StatefulWidget {
  final bool? isShow;
  final String iconPath;
  final double top;
  final double right;
  final double width;
  final double height;
  final Function() onTap;
  final Color color;
  const TopPostionedButton({super.key, this.iconPath = 'assets/repic.svg', this.top=-10, this.right=-10, this.width=45, this.height=45, required this.onTap, this.color=Colors.red, this.isShow= true});

  @override
  State<TopPostionedButton> createState() => _TopPostionedButtonState();
}

class _TopPostionedButtonState extends State<TopPostionedButton> {
  final imageController = Controllers.imageEditorController;
  @override
  Widget build(BuildContext context) {
    return                           Visibility(
      visible: widget.isShow!,
      child: Positioned(
          right:widget.right,
          top: widget.top,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              // color: widget.color,
              borderRadius: BorderRadius.circular(15),
            ),
            child:InkWell(child: SvgPicture.asset(widget.iconPath),
              onTap: widget.onTap,
            ),
          )),
    );
    ;
  }
}

class BottomPostionedButton extends StatefulWidget {
  final bool? isShow;
  final String iconPath;
  final double bottom;
  final double right;
  final double width;
  final double height;
  final Function() onTap;
  final Function(DragUpdateDetails) onPanUpdate;
  final Color color;
  const BottomPostionedButton({super.key, this.iconPath = 'assets/repic.svg', this.bottom=-10, this.right=-10, this.width=45, this.height=45, required this.onTap, this.color=Colors.red, required this.onPanUpdate, this.isShow= true});

  @override
  State<BottomPostionedButton> createState() => _BottomPostionedButtonState();
}

class _BottomPostionedButtonState extends State<BottomPostionedButton> {
  final imageController = Controllers.imageEditorController;
  @override
  Widget build(BuildContext context) {
    return                           Visibility(
      visible: widget.isShow!,
      child: Positioned(
          right:widget.right,
          bottom: widget.bottom,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              // color: widget.color,
              borderRadius: BorderRadius.circular(15),
            ),
            child:GestureDetector(child: SvgPicture.asset(widget.iconPath),
              onTap: widget.onTap,
              onPanUpdate: widget.onPanUpdate,
              // onHorizontalDragUpdate: widget.onPanUpdate,
            ),
          )),
    );
    ;
  }
}

class BottomLeftPostionedButton extends StatefulWidget {
  final bool? isShow;
  final String iconPath;
  final double bottom;
  final double left;
  final double width;
  final double height;
  final Function() onTap;
  final Function(DragUpdateDetails) onPanUpdate;
  final Color color;
  const BottomLeftPostionedButton({super.key, this.iconPath = 'assets/repic.svg', this.bottom=-10, this.left=-10, this.width=45, this.height=45, required this.onTap, this.color=Colors.red, required this.onPanUpdate, this.isShow= true});

  @override
  State<BottomLeftPostionedButton> createState() => _BottomLeftPostionedButtonState();
}

class _BottomLeftPostionedButtonState extends State<BottomLeftPostionedButton> {
  final imageController = Controllers.imageEditorController;
  @override
  Widget build(BuildContext context) {
    return                           Visibility(
      visible: widget.isShow!,
      child: Positioned(
          left:widget.left,
          bottom: widget.bottom,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              // color: widget.color,
              borderRadius: BorderRadius.circular(15),
            ),
            child:Center(
              child: GestureDetector(child: SvgPicture.asset(widget.iconPath, width: double.maxFinite, height: double.maxFinite,),
                onTap: widget.onTap,
                onPanUpdate: widget.onPanUpdate,
                // onHorizontalDragUpdate: widget.onPanUpdate,
              ),
            ),
          )),
    );
    ;
  }
}