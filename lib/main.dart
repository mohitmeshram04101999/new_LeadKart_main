import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/routes/router.dart';
import 'package:leadkart/them/theme.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SC.getScreen(context);
    return  DevicePreview(
      builder: (context)=>
     GetMaterialApp.router(

        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme:Theme.of(context).brightness==Brightness.light? AppTheme():AppTheme(),
        routeInformationProvider: GoRouterConfig.router.routeInformationProvider,
        routerDelegate: GoRouterConfig.router.routerDelegate,
        backButtonDispatcher: GoRouterConfig.router.backButtonDispatcher,
        routeInformationParser: GoRouterConfig.router.routeInformationParser,
      ),
    );
  }
}
