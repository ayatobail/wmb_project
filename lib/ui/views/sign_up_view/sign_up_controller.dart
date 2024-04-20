import 'package:mwb_project/ui/views/login_view/login_view.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../core/data/reposotories/auth_repositories.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../main_view/layout_view/layout_view.dart';


class RegisterController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isloading = true.obs;


  void register() {
    if (formKey.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
          function: AuthRepositories.register(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            userName:userNameController.text,
            email: emailController.text,
            address: addressController.text,
            password: passwordController.text
          ).then((value) {
            value.fold((l) {
              CustomToast.showMessage(
                  messageType: MessageType.REJECTED, message: l);
            }, (r) {
              Get.offAll(LogInScreen(userName: r.username!,));
              formKey.currentState!.save();
            });
          }));
    }
  }
}