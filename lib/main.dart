import 'dart:developer';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:leadkart/controllers/AllPlansProvider.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';
import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/controllers/FaqProvider.dart';
import 'package:leadkart/controllers/GetCampaignProvider.dart';
import 'package:leadkart/controllers/LeadeDetaileProvider.dart';
import 'package:leadkart/controllers/RolsAndPermisionProvider.dart';
import 'package:leadkart/controllers/SubUserProvider.dart';
import 'package:leadkart/controllers/addListByBussnessProvider.dart';
import 'package:leadkart/controllers/addSubUserProvider.dart';
import 'package:leadkart/controllers/businessProvider.dart';
import 'package:leadkart/controllers/creaetAddProvider.dart';
import 'package:leadkart/controllers/editBussnessProvider.dart';
import 'package:leadkart/controllers/leadeProvider.dart';
import 'package:leadkart/controllers/linkedPageProvider.dart';
import 'package:leadkart/controllers/profileProvider.dart';
import 'package:leadkart/controllers/targetAreaSearchAreaController.dart';
import 'package:leadkart/controllers/terestProvider.dart';
import 'package:leadkart/firebase_options.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/routes/router.dart';
import 'package:leadkart/them/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await setupFlutterNotifications();
  await initializeLocalNotifications();
  // showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  log('Handling a background message ${message.messageId}');
}

Future<void> initializeLocalNotifications() async {
  await AwesomeNotifications().initialize(
      null, //'resource://drawable/res_app_icon',//
      [
        NotificationChannel(
            channelKey: 'alerts',
            channelName: 'Alerts',
            channelDescription: 'Notification tests as alerts',
            playSound: true,
            onlyAlertOnce: true,
            groupAlertBehavior: GroupAlertBehavior.Children,
            importance: NotificationImportance.High,
            defaultPrivacy: NotificationPrivacy.Private,
            defaultColor: Colors.deepPurple,
            enableVibration: true,
            ledColor: Colors.deepPurple)
      ],
      debug: true);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
// Get initial notification action is optional
  ReceivedAction? initialAction = await AwesomeNotifications()
      .getInitialNotificationAction(removeFromActionEvents: false);
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'alerts',
            title: notification.title,
            body: notification.body));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeLocalNotifications();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    showFlutterNotification(message);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // showFlutterNotification(message);
  });
  await FirebaseMessaging.instance.getToken().then((value) {
    log(value!);
  });
  final userPreferenceController = Controllers.userPreferencesController;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  userPreferenceController.prefs.value = preferences;
  MyHelper();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CreateBusinessProvider()),
    ChangeNotifierProvider(create: (context) => BussnissCategoryProvider()),
    ChangeNotifierProvider(create: (context) => Allplansprovider()),
    ChangeNotifierProvider(create: (context) => Profileprovider()),
    ChangeNotifierProvider(create: (context) => BusinessProvider()),
    ChangeNotifierProvider(create: (context) => EditBusinessProvider()),
    ChangeNotifierProvider(create: (context) => CreateAddProvider()),
    ChangeNotifierProvider(create: (context) => CampaignProvider()),
    ChangeNotifierProvider(create: (context) => AddListByBusinessProvider()),
    ChangeNotifierProvider(create: (context) => LeadsProvider()),
    ChangeNotifierProvider(create: (context) => LeadDetailProvider()),
    ChangeNotifierProvider(create: (context) => SubUserProvider()),
    ChangeNotifierProvider(create: (context) => AddSubUserProvider()),
    ChangeNotifierProvider(create: (context) => TargateAreaProvider()),
    ChangeNotifierProvider(create: (context) => RolesAndPermProvider()),
    ChangeNotifierProvider(create: (context) => FaqProvider()),
    ChangeNotifierProvider(create: (context) => InterestProvider()),
    ChangeNotifierProvider(create: (context) => LinkedPageProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Offset _offset = const Offset(100, 100);

  @override
  Widget build(BuildContext context) {
    SC.getScreen(context);
    debugPaintLayerBordersEnabled = false;
    debugRepaintRainbowEnabled = false;
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: Theme.of(context).brightness == Brightness.light
          ? AppTheme()
          : AppTheme(),
      routeInformationProvider: GoRouterConfig.router.routeInformationProvider,
      routerDelegate: GoRouterConfig.router.routerDelegate,
      backButtonDispatcher: GoRouterConfig.router.backButtonDispatcher,
      routeInformationParser: GoRouterConfig.router.routeInformationParser,
    );
    // return
    //  DevicePreview(builder: (context)=>GetMaterialApp.router(
    //    debugShowCheckedModeBanner: false,
    //    themeMode: ThemeMode.light,
    //    theme:Theme.of(context).brightness==Brightness.light? AppTheme():AppTheme(),
    //    routeInformationProvider: GoRouterConfig.router.routeInformationProvider,
    //    routerDelegate: GoRouterConfig.router.routerDelegate,
    //    backButtonDispatcher: GoRouterConfig.router.backButtonDispatcher,
    //    routeInformationParser: GoRouterConfig.router.routeInformationParser,
    //
    //  ));
  }
}
