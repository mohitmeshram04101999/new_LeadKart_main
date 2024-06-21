import 'package:flutter/material.dart';
import 'package:leadkart/helper/helper.dart';

class PaymentDetailWidget extends StatelessWidget {
  final List<PaymentOption> paymentOptions;
  final int selectedValue;
  final ValueChanged<int?> onChanged;
  final double Function(double value) scale;

  PaymentDetailWidget({
    required this.paymentOptions,
    required this.selectedValue,
    required this.onChanged,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      constraints: BoxConstraints(
        minHeight: 100,
        maxWidth: scale(1.30),
        minWidth: 100,
      ),
      child: Column(
        children: List.generate(paymentOptions.length, (index) {
          final option = paymentOptions[index];
          return RadioListTile(
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return MyHelper.appConstent.primeryColor; // Color when selected
              }
              return Colors.grey; // Color when unselected
            }),
            title: Row(
              children: [
                Container(
                  width: scale(10),
                  height: scale(10),
                  child: Image.asset(option.imagePath, fit: BoxFit.contain),
                ),
                SizedBox(width: scale(25)),
                Text(option.name, style: TextStyle(fontSize: scale(24))),
              ],
            ),
            value: index + 1,
            groupValue: selectedValue,
            onChanged: onChanged,
          );
        }),
      ),
    );
  }
}
class PaymentOption {
  final String name;
  final String imagePath;

  PaymentOption(this.name, this.imagePath);
}
