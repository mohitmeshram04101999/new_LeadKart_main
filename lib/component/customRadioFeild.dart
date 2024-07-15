import 'package:flutter/material.dart';
import 'package:leadkart/them/constents.dart';



class CustomRadio extends StatelessWidget {
  final int value;
  final bool active;
  final String label;
  final void Function(int i) onTap;
  const CustomRadio({required this.value,required this.onTap,required this.active,required this.label,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>onTap(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(value: active, onChanged: (v){
            onTap(value);
          }),
           Text(label)
        ],
      ),
    );
  }
}
