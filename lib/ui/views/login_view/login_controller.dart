

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/data/reposotories/auth_repositories.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/services/base_controller.dart';
import '../../../core/utils/general_utils.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../main_view/layout_view/layout_view.dart';
import 'login_view.dart';

 class  LoginController extends BaseController {
  RxBool loader = false.obs;
  String? userName;
  TextEditingController? loginUserNameController ;
  TextEditingController loginPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  LoginController(String? userName){
   this.userName=userName;
   loginUserNameController = TextEditingController(text: userName);

  }

  void login() {
    if (formKey1.currentState!.validate()) {
      //Get.off(layoutView());
     runFutureFunctionWithFullLoading(
          function: AuthRepositories()
              .login(
              name: loginUserNameController!.text, password: loginPasswordController.text)
              .then((value) {
            value.fold((l) {
              CustomToast.showMessage(
                  messageType: MessageType.REJECTED, message: l);
              //loader.value = true;
             // ErrorDialog(errorText: l);
            }, (r) {
              Get.off(layoutView());
              storage.setLogin(true);
              storage.setUserInfo(r);
              formKey1.currentState!.save();
            });
          }));
    }
  }


}