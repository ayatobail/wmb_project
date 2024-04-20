import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mwb_project/core/enums/connectivity_status.dart';
import 'package:mwb_project/core/utils/general_utils.dart';
import 'package:mwb_project/ui/shared/colors.dart';
import 'package:get/get.dart';
import 'package:mwb_project/ui/views/login_view/login_view.dart';
import 'package:mwb_project/ui/views/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import '../core/themes/app_themes.dart';

late BuildContext appContext;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    appContext = context;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.transparentColor,
      statusBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return StreamProvider<ConnectivityStatus>(
      initialData: ConnectivityStatus.ONLINE,
      create: (context) =>
          connectivityService.connectivityStatusController.stream,
      child: GetMaterialApp(
        defaultTransition: Transition.circularReveal,
        transitionDuration: Duration(milliseconds: 12),
        title: 'mwb_project',
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
        theme: appThemeData[AppTheme.lightTheme],
        home: SplashScreen(),
      ),
    );
  }
}
