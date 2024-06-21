import 'package:flutter/material.dart';


class MyactionButton extends StatefulWidget {
  Duration? duretion;
  Widget? child;
  double height;
  Curve? curve;
  double? width;
  Function(dynamic)? onActionComplit;
  Function action;
  Widget? activeChild;
  BoxDecoration? decoration;
  BoxDecoration? activeDecoration;
  MyactionButton({
    this.curve,
    this.height = 50,
    this.width,
    this.onActionComplit,
    required this.action,
    this.child,
    this.activeChild,
    this.decoration,
    this.activeDecoration,
    this.duretion,
    super.key
  });

  @override
  State<MyactionButton> createState() => _MyactionButtonState();
}

class _MyactionButtonState extends State<MyactionButton> {

  @override
  void didUpdateWidget(covariant MyactionButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    setState(() {

    });
  }

  bool loding = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ()async{
          if(loding==false)
          {
            loding = true;
            setState(() {

            });
            try{
              dynamic returnData = await widget.action();
              if(widget.onActionComplit!=null)
                {
                  widget.onActionComplit!(returnData);
                }
            }
            catch(ex)
            {
              dynamic returnData = await widget.action();
              if(widget.onActionComplit!=null)
              {
                widget.onActionComplit!(returnData);
              }
              throw ex;

            }
            finally{
              loding = false;
              setState(() {

              });
            }
          }

        },
        child: AnimatedContainer(
          curve:widget.curve?? Curves.easeInOut,
          duration: widget.duretion??Duration(milliseconds: 300),
          height: widget.height,
          width: loding?widget.height:widget.width??MediaQuery.of(context).size.width-30,
          child: Center(child: loding?
          CircularProgressIndicator(
            color: Colors.white,
          ):widget.child??Text("Press",style: TextStyle(color: Colors.white,fontSize: 20),)),
          decoration: !loding?
          widget.decoration??BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: Offset(0,2),
                    blurRadius: 1,
                    spreadRadius: 1
                )
              ]
          ):BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(widget.height),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: Offset(0,2),
                    blurRadius: 1,
                    spreadRadius: 1
                )
              ]
          ),
        ),
      ),
    );
  }
}
