import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:leadkart/Models/VerifyOtpModel.dart';
import 'package:leadkart/add_images/campaign_setting_page.dart';
import 'package:leadkart/business_pages/growBusinessFaster.dart';
import 'package:leadkart/helper/controllerInstances.dart';

import 'package:leadkart/leads/add_detail_screen.dart';
import 'package:leadkart/login_pages/login_screen.dart';
import 'package:leadkart/login_pages/otp_screen.dart';
import 'package:leadkart/screens/imageEditor/imageEditor.dart';
import 'package:leadkart/screens/leads/getNewLeads.dart';

import '../component/bottom_navigation_screen.dart';
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
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            name: 'otpScreen',
            path: 'otpScreen',
            builder: (context, state){
              final data = jsonEncode(state.pathParameters);
              return OtpScreen();},
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
            builder: (context,state)=>AddDetailScreen(),

          ),
          GoRoute(
            name: 'getNewLeads',
            path: 'getNewLeads',
            builder: (context, state) => GetNewLeads(),
          ),
          GoRoute(path: 'campaignSettings', name: 'campaignSettings', builder: (context, state) => CampaignSetting()),
          GoRoute(path: 'growBusinessFaster', name: 'growBusinessFaster', builder: (context, state) => GrowBusinessFaster()),
          GoRoute(path: 'imageEditor', name: 'imageEditor', builder: (context, state) => ImageEditor()),
        ],
      ),

    ],
  );
}