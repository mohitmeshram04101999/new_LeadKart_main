import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/add_images/campaign_setting_page.dart';
import 'package:leadkart/business_pages/additional_detail.dart';
import 'package:leadkart/business_pages/growBusinessFaster.dart';
import 'package:leadkart/helper/controllerInstances.dart';

import 'package:leadkart/leads/adddetail/add_detail_screen.dart';
import 'package:leadkart/leads/ads_image.dart';
import 'package:leadkart/leads/busines_category.dart';
import 'package:leadkart/leads/create_ads_page.dart';
import 'package:leadkart/login_pages/login_screen.dart';
import 'package:leadkart/login_pages/otp_screen.dart';
import 'package:leadkart/screens/imageEditor/imageEditor.dart';
import 'package:leadkart/screens/leads/getNewLeads.dart';
import 'package:leadkart/screens/newLead%20Screen/LeadeScreen.dart';

import '../component/bottom_navigation_screen.dart';
import '../leads/digital_ads_package.dart';
import '../screens/1 . OnBording Screens/OnBordingnavigation.dart';
class GoRouterConfig {
  static final router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final prefs = Controllers.userPreferencesController.prefs;
      String? _data = prefs.value?.getString("currentUser");
      CurrentUser? user;

      if (_data != null) {
        var decode = jsonDecode(_data);
        user = CurrentUser.fromJson(decode);
        if (user.token != null && (state.matchedLocation == '/logInScreen'||state.matchedLocation == '/'||state.matchedLocation == '/otpScreen')) {
          return '/homePage';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => OnBordingMain(),
      ),

      GoRoute(

        name: 'logInScreen',
        path: '/logInScreen',
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            name: 'otpScreen',
            path: 'otpScreen',
            builder: (context, state){
              final data = jsonEncode(state.pathParameters);
              return const OtpScreen();},
          ),
        ]
      ),
      GoRoute(
        name: 'homePage',
        path: '/homePage',
        builder: (context, state) =>MyBottomNavigationBar(),

        routes: [
          GoRoute(
            path: 'AddDetailScreen',
            name: 'AddDetailScreen',
            builder: (context,state){
              final encodedData = jsonEncode(state.extra);
              final decodeddata = jsonDecode(encodedData);
              return AddDetailScreen(adId: decodeddata['id']??"",);
            },

          ),GoRoute(
            path: 'createBusinessScreen',
            name: 'createBusinessScreen',
            builder: (context,state)=>const CreateBusinessScreen(),
          ),

          GoRoute(
            path: 'adsPage',
            name: 'adsPage',
            builder: (context,state){
              final id = state.pathParameters["id"];
              return AdsPage();
            },
          ),

          GoRoute(
            path: 'additionalDetails',
            name: 'additionalDetails',
            builder: (context,state)=>const AdditionalDetail(),
          ),


          GoRoute(
            name: 'getNewLeads',
            path: 'getNewLeads',
            builder: (context, state) =>const  GetNewLeads(),
            routes: [
              GoRoute(
                name: "createAdd",
                  path: "createAdd",
                builder: (context,state)=>const CreateAds(),
              ),
              GoRoute(
                name: "digitalAdsPackage",
                path: "DigitalAdsPackage",
                builder: (context,state)=>const DigitalAdsPackage(),
              )
            ]
          ),
          GoRoute(path: 'campaignSettings', name: 'campaignSettings', builder: (context, state) => CampaignSetting()),
          GoRoute(path: 'growBusinessFaster', name: 'growBusinessFaster', builder: (context, state) => GrowBusinessFaster()),
          GoRoute(path: 'imageEditor', name: 'imageEditor', builder: (context, state) => ImageEditor()),
        ],
      ),

    ],
  );
}