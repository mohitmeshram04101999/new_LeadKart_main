import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/routes/router.dart';
import 'package:leadkart/them/theme.dart';

void main()
{
  runApp(MyApp());
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
    return  DevicePreview(
      builder: (context)=>
     GetMaterialApp.router(
       builder: (context, child) {
         return Stack(
           children: [
             child!,
             Positioned(
               left: _offset.dx,
               top: _offset.dy,
               child: GestureDetector(
                 onPanUpdate: (d) => setState(() => _offset += Offset(d.delta.dx, d.delta.dy)),
                 child: FloatingActionButton(
                   onPressed: ()async{
                     await Controllers.authController.logOut(context);
                   },
                   backgroundColor: Colors.black,
                   child: Icon(Icons.logout),
                 ),
               ),
             ),
           ],
         );
       },
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
