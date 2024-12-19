import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/them/constents.dart';

class MyactionButton extends StatefulWidget {
  Color? color;
  bool? handelError;
  Duration? duretion;
  Widget? child;
  double height ;
  String? customErrorMessage;
  String? lable;
  Curve? curve;
  double? width;
  Function(dynamic)? onActionComplit;
  Function action;
  Widget? activeChild;
  BoxDecoration? decoration;
  BoxDecoration? activeDecoration;
  MyactionButton(
      {this.handelError,
        this.lable,
        this.color,
        this.customErrorMessage,
        this.curve,
        this.height = 72,
        this.width,
        this.onActionComplit,
        required this.action,
        this.child,
        this.activeChild,
        this.decoration,
        this.activeDecoration,
        this.duretion,
        super.key});

  @override
  State<MyactionButton> createState() => _MyactionButtonState();
}

class _MyactionButtonState extends State<MyactionButton> {
  @override
  void didUpdateWidget(covariant MyactionButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  bool loding = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (loding == false) {
          loding = true;
          setState(() {});


          if(widget.handelError??kDebugMode)
            {
              dynamic returnData = await widget.action();
              log(widget.onActionComplit.toString());
              if (widget.onActionComplit != null) {
                widget.onActionComplit!(returnData);
              }
            }
          else
            {
              try {
                dynamic returnData = await widget.action();
                log(widget.onActionComplit.toString());
                if (widget.onActionComplit != null) {
                  widget.onActionComplit!(returnData);
                }
              } catch (e) {
                log("${'--' * 10} Error from myActionButton ${'--' * 10}\n");
                log(e.toString());
                log(widget.customErrorMessage.toString());
                log("${'--' * 10} Error from myActionButton ${'--' * 10}\n");
                if (widget.customErrorMessage != null) {
                  MyHelper.mySnakebar(context, '${widget.customErrorMessage}');
                } else {
                  MyHelper.mySnakebar(context, "Something went wrong");
                }
              }
            }



          loding = false;
          setState(() {});
        }
      },
      child: AnimatedContainer(
        curve: widget.curve ?? Curves.easeInOut,
        duration: widget.duretion ?? Duration(milliseconds: 300),
        height: widget.height,
        width: loding
            ? widget.height
            : widget.width ?? MediaQuery.of(context).size.width - 30,
        child: Center(
            child: loding
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : (widget.child != null && widget.lable == null)
                    ? widget.child
                    : Row(
              mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text(
                          "${widget.lable ?? "Press"}",
                          style: TextStyle(color: Colors.white, fontSize: SC.from_width(20),fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_forward,color: Colors.white,)
                      ],
                    )),
        decoration: !loding
            ? widget.decoration ??
                BoxDecoration(
                    color: widget.color??Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          offset: Offset(0, 2),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ])
            : BoxDecoration(
                color: widget.color??Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(widget.height),
                boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: Offset(0, 2),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ]),
      ),
    );
  }
}
