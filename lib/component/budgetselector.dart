
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
        decoration: BoxDecoration(
          border: Border.all(color:Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 0, vertical: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                decoration:  BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey))),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Image.asset(
                  icon,
                  height: SC.from_width(20),
                )),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              // child: Text(budget,style: Theme.of(context).textTheme.displaySmall,),

              child: Container(
                alignment: Alignment.center,
                height: 30,
                child: TextField(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: SC.from_width(27),
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0, vertical: 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                      GestureDetector(
                        onTap: onInc,
                        child: Container(
                          decoration:  BoxDecoration(
                              color: Theme.of(context).colorScheme.onSecondary,
                              border: Border(
                                  left: BorderSide(color: Colors.grey))),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/add.png',
                                  width: SC.from_width(15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

