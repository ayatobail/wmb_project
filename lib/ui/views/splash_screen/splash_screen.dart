import 'package:flutter/material.dart';
import 'package:mwb_project/core/themes/app_colors.dart';
import 'package:mwb_project/ui/shared/custom_widgets/app_logo_container.dart';
import 'package:mwb_project/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController controller=Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogoContainer(),
            SpinKitThreeBounce(color: AppColors.primaryColor,),
          ],
        ),

      ),
    );
  }
}
