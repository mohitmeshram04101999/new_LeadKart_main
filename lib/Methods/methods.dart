import 'dart:developer';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Methods {
  Future<LoginResult?> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.i.login(
      loginBehavior: LoginBehavior.nativeWithFallback,
      loginTracking: LoginTracking.enabled,
      nonce: '123',
      permissions: [
        'pages_show_list',
        'ads_management',
        'ads_read',
        'business_management',
        'leads_retrieval',
        'page_events',
        'pages_manage_ads',
        'pages_manage_posts',
        'pages_read_engagement',
        'read_insights',
      ],
    ); // by default we request the email and the public profile
    if (result.status == LoginStatus.success) {
      return result;
    } else {
      log(result.status.toString());
      log(result.message.toString());
      return null;
    }
  }
}
