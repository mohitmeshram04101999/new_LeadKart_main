
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/dimention.dart';

class BudgetSelector extends StatelessWidget {
  String icon;
  TextEditingController budget;
  void Function()? onInc;
  void Function(String)? onChange;
  void Function()? onDec;
  BudgetSelector({this.onChange,required this.onInc,required this.onDec,super.key, required this.icon, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: SC.fromContextWidth(context, 1.25),
        height: SC.from_width(72),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: SC.from_width(8), vertical: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            //Icon
            Container(
                decoration:  BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey))),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Image.asset(
                  icon,
                  height: SC.from_width(30),
                )),


            GestureDetector(
              onTap:onDec,
              child: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                  child: Image.asset(
                    'assets/minus.png',
                    width: SC.from_width(15),
                  ),
                ),
              ),
            ),


            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              // child: Text(budget,style: Theme.of(context).textTheme.displaySmall,),
              child: Container(
                alignment: Alignment.center,
                height: 30,
                child: TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: SC.from_width(20),
                    color: Color.fromRGBO(83, 83, 83, 1)
                  ),
                  textAlign: TextAlign.center,
                  onChanged: onChange,
                  controller: budget,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],

                  decoration: const InputDecoration(
                    isCollapsed: true,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            )),

            GestureDetector(
              onTap: onInc,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

