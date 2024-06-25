
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/controllers/BussnissCategoryProvider.dart';
import 'package:leadkart/controllers/CreateBussness%20Provider.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/leads/busines_category.dart';

import 'package:leadkart/routes/router.dart';
import 'package:leadkart/them/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main()
async{
  WidgetsFlutterBinding.ensureInitialized();
  final userPreferenceController = Controllers.userPreferenceController;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  userPreferenceController.prefs.value = preferences;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CreateBusinessProvider()),
      ChangeNotifierProvider(create: (context) => BussnissCategoryProvider()),
    ],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset _offset = Offset(100, 100);

  @override
  Widget build(BuildContext context) {

    SC.getScreen(context);
    return
     GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme:Theme.of(context).brightness==Brightness.light? AppTheme():AppTheme(),
        routeInformationProvider: GoRouterConfig.router.routeInformationProvider,
        routerDelegate: GoRouterConfig.router.routerDelegate,
        backButtonDispatcher: GoRouterConfig.router.backButtonDispatcher,
        routeInformationParser: GoRouterConfig.router.routeInformationParser,

    );
  }
}
