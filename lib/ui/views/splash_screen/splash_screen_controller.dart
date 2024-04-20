import 'package:mwb_project/core/services/base_controller.dart';
import 'package:mwb_project/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreenController extends BaseController{
  void onInit(){
    Future.delayed(Duration(seconds: 3)).then((value) {
      Get.off(LogInScreen());
    });
  }
}