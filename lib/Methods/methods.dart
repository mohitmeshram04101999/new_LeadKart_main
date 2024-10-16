import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:leadkart/controllers/businessProvider.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:provider/provider.dart';

class Methods {
  Future<LoginResult?> loginWithFacebook(BuildContext context) async {
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
      final _currentBusiness =
          Provider.of<BusinessProvider>(context, listen: false).currentBusiness;
      MyHelper.bussnissApi.upDateBusiness(
          businessId: _currentBusiness!.id!,
          serviceId: _currentBusiness!.servicesId,
          address: _currentBusiness!.address,
          businessName: _currentBusiness!.businessName,
          businessCategoryId: _currentBusiness!.businessCategoryId,
          businessContactNum: _currentBusiness!.businessContact.toString(),
          cityId: _currentBusiness!.cityId,
          countryId: _currentBusiness!.countryId,
          faceBookLink: _currentBusiness!.facebookLink,
          instaLink: _currentBusiness!.instagramLink,
          stateId: _currentBusiness!.stateId,
          tagLine: _currentBusiness!.tagline,
          twitterLink: _currentBusiness!.twitterLink,
          webLink: _currentBusiness!.websiteLink,
          whatAppNum: _currentBusiness!.whatsappNumber.toString(),
          youTubeLink: _currentBusiness!.youtubeLink,
          isPageSubscribe: false,
          pageAccessToken: 'null',
          pageId: null,
          metaAccessToken: result.accessToken!.tokenString);

      return result;
    } else {
      log(result.status.toString());
      log(result.message.toString());
      return null;
    }
  }
}
