

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> makePhoneCall(String number) async
{
  String uri = "tel:+91$number";
  var resp = await launchUrlString(uri);
}


void openWhatsAppChat(String phoneNumber) async {
  final whatsappUrl = "whatsapp://send?phone=+91$phoneNumber";
  var resp = await launchUrlString(whatsappUrl);
}