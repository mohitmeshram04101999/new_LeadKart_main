import 'package:flutter/material.dart';
import 'package:leadkart/component/HelpButtonWhite.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {

  // PAY USING UPI //
  final List<PaymentOption> paymentOptions = [
    PaymentOption('Google Pay', 'assets/payments/img.png'),
    PaymentOption('Apple Pay', 'assets/payments/img_1.png'),
    PaymentOption('PayPal', 'assets/payments/img_2.png'),
    PaymentOption('Visa', 'assets/payments/img_3.png'),
    PaymentOption('MasterCard', 'assets/payments/img_4.png'),
    PaymentOption('MasterCard', 'assets/payments/img_5.png'),
  ];

  // PAY USING OTHER //
  final List<PaymentOption> paymentOptions2 = [
    PaymentOption('Credit Card', 'assets/payments/img_6.png'),
    PaymentOption('Debit Card', 'assets/payments/img_7.png'),


  ];

  int selectedValue = 1;
  int selectedValue2 = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Payment details',style: TextStyle(fontSize: SC.from_height(21)),),
        actions: [
          HelpButton(),
          SizedBox(width: SC.from_height(21),)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: SC.fromHeight(30),),

                      // TOTAL COST //
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text('Total Advertising Cost',style: TextStyle(fontSize: SC.fromWidth(27)),),
                                  Spacer(),
                                  Text('₹ 5000.0',style: TextStyle(fontSize: SC.fromWidth(27))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Total (Including GST)',style: TextStyle(fontSize: SC.fromWidth(25),fontWeight: FontWeight.w600),),
                                  Spacer(),
                                  Text('₹ 5000.0',style: TextStyle(fontSize: SC.fromWidth(26),fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        width: double.infinity,height: SC.fromHeight(7.5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),borderRadius: BorderRadius.circular(10)
                        ),
                      ),

                      SizedBox(height: SC.fromHeight(40),),
                      Text('Pay Using Upi',style: TextStyle(fontSize: SC.fromWidth(19)),),
                      SizedBox(height: SC.fromHeight(40),),


                      // PAY USING UPI //
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        // padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
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
                          maxWidth: SC.fromWidth(1.30),
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
                                    width: SC.fromWidth(10),
                                    height: SC.fromWidth(10),
                                    child: Image.asset(option.imagePath, fit: BoxFit.contain),
                                  ),
                                  SizedBox(width: SC.fromWidth(25)),
                                  Text(option.name, style: TextStyle(fontSize: SC.fromWidth(24))),
                                ],
                              ),
                              value: index + 1,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                              },
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: SC.fromHeight(40),),
                      Text('Pay Using Other',style: TextStyle(fontSize: SC.fromWidth(19)),),


                      // PAY USING OTHER //
                      SizedBox(height: SC.fromHeight(40),),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        constraints: BoxConstraints(
                          // minHeight: 100,
                          // maxHeight: SC.fromHeight(5.5),
                          maxWidth: SC.fromWidth(1.30),
                          minWidth: 100,
                        ),
                        child: Column(
                          children: List.generate(paymentOptions2.length, (index) {
                            final option = paymentOptions2[index];
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
                                    width: SC.fromWidth(10),
                                    height: SC.fromWidth(10),
                                    child: Image.asset(option.imagePath, fit: BoxFit.contain),
                                  ),
                                  SizedBox(width: SC.fromWidth(25)),
                                  Text(option.name, style: TextStyle(fontSize: SC.fromWidth(24))),
                                ],
                              ),
                              value: index + 1,
                              groupValue: selectedValue2,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue2 = value!;
                                });
                              },
                            );
                          }),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 100,),
                ],
              ),
            ),
            Padding(
              padding:   EdgeInsets.only(bottom: SC.fromWidth(30)),
              child: Padding(
                padding:   EdgeInsets.symmetric(horizontal: SC.fromWidth(30)),
                child: CustomButton(
                text: 'Proceed to Payment', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetails()));
                              },
                              ),
              ),
            )
          ],
        )
      ),
    );
  }
}

class PaymentOption {
  final String name;
  final String imagePath;

  PaymentOption(this.name, this.imagePath);
}

