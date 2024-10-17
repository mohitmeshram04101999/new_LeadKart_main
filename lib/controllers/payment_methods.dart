import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/controllers/creaetAddProvider.dart';
import 'package:leadkart/generated/assets.dart';
import 'package:logger/logger.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

enum PaymentMethod {
  PhonePe,
  Razorpay,
}

class PaymentMethods {
  static List<Enum> getPaymentMethods() {
    return [
      PaymentMethod.PhonePe,
      PaymentMethod.Razorpay,
    ];
  }

  static String getPaymentDescription(Enum paymentMethod) {
    switch (paymentMethod) {
      case PaymentMethod.PhonePe:
        return 'Phone Pe is a digital wallet platform that allows you to make payments and transfer money to others.';
      case PaymentMethod.Razorpay:
        return 'Razorpay is a payment gateway that allows you to accept payments from customers.';
      default:
        return '';
    }
  }

  static String getPaymentName(Enum paymentMethod) {
    switch (paymentMethod) {
      case PaymentMethod.PhonePe:
        return 'PhonePe';
      case PaymentMethod.Razorpay:
        return 'Razorpay';
      default:
        return '';
    }
  }

  static String getPaymentIcon(Enum paymentMethod) {
    switch (paymentMethod) {
      case PaymentMethod.PhonePe:
        return Assets.assetsPhonepe;
      case PaymentMethod.Razorpay:
        return Assets.assetsRazorpay;
      default:
        return '';
    }
  }

  static Future getPaymentMethod(
      Enum paymentMethod, BuildContext context) async {
    switch (paymentMethod) {
      case PaymentMethod.PhonePe:
        return await makePaymentWithPhonePe(context);
      case PaymentMethod.Razorpay:
        return await makePaymentWithRazorpay(context);
      default:
        return '';
    }
  }

  static initPhonePe() async {
    String? result = '';
    String environmentValue = 'UAT_SIM';
    String appId = "";
    String merchantId = "PGTESTPAYUAT86";
    bool enableLog = true;
    await PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLog)
        .then((val) {
      result = "PhonePe SDK initialization successful $val";
      return result;
    }).catchError((result) {
      // handleError(result);
      Logger().e(result);
      return result;
    });
  }

  static Future makePaymentWithPhonePe(BuildContext context) async {
    String body = '';
    String appSchema =
        "https://webhook.site/9b7c9424-2c04-450c-99e3-9e1c36dd8705";
    String merchantId = "PGTESTPAYUAT86";
    String checksum = '';
    String saltKey = '96434309-7796-489d-8924-ab56988a6076';
    String saltIndex = '1';
    String apiEndPoint = "/pg/v1/pay";

    String packageName = "com.leadkart.advertise";
    handleError(result) {
      Logger().e(result);
    }

    getCheckSum() {
      final requestData = {
        "merchantId": merchantId,
        "merchantTransactionId": 'transactionId',
        "merchantUserId": "90223250",
        "amount": 1000,
        "mobileNumber": "9999999999",
        "callbackUrl": appSchema,
        "paymentInstrument": {"type": "PAY_PAGE"}
      };

      String base64Body = base64.encode(utf8.encode(json.encode(requestData)));

      checksum =
          '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey)).toString()}###$saltIndex';
      log('base64Body $base64Body');
      log('checksum $checksum');
      return (base64Body, checksum);
    }

    String rebody = getCheckSum().$1;
    log('rebody $rebody');
    String reChecksum = getCheckSum().$2;
    log('reChecksum $reChecksum');

    try {
      var response = await PhonePePaymentSdk.startTransaction(
          rebody, appSchema, reChecksum, packageName);
      Logger().i("PhonePe payment response: $response");
    } catch (e) {
      handleError(e.toString());
    }

    // void startTransaction() async {
    //
    // }
  }

  static Future makePaymentWithRazorpay(BuildContext context) async {
    // Add your code here
    final _razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_0wFRWIZnH65uny',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    void showAlertDialog(BuildContext context, String title, String message) {
      // set up the buttons
      Widget continueButton = ElevatedButton(
        child: const Text("Continue"),
        onPressed: () {},
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(title),
        content: Text(message),
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    void handlePaymentErrorResponse(PaymentFailureResponse response) {
      /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
      showAlertDialog(context, "Payment Failed",
          "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
    }

    void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
      /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
      showAlertDialog(
          context, "Payment Successful", "Payment ID: ${response.paymentId}");
      await Provider.of<CreateAddProvider>(context, listen: false)
          .createAdd(context)
          .then(
        (value) {
          if (value != null) {
            showAlertDialog(
                context,
                value["status"] == "Created"
                    ? "Add Created"
                    : "Something went wrong: $value",
                "Payment ID: ${response.paymentId}\nPayment Successful");
          } else {
            showAlertDialog(context, "Something went wrong: $value",
                "Payment ID: ${response.paymentId}");
          }
        },
      );
    }

    void handleExternalWalletSelected(ExternalWalletResponse response) {
      showAlertDialog(
          context, "External Wallet Selected", "${response.walletName}");
    }

    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    _razorpay.open(options);
  }
}
