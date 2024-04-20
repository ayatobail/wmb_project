
import 'package:mwb_project/ui/views/sign_up_view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/themes/app_colors.dart';
import '../../shared/custom_widgets/app_logo_container.dart';
import '../../shared/custom_widgets/app_text_field.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_text.dart';
import '../../shared/custom_widgets/label_text.dart';

import '../../shared/utils.dart';
import 'login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key, this.userName});
  final String? userName;

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}
late LoginController controller ;
class _LogInScreenState extends State<LogInScreen> {

  void initState(){
    controller = LoginController(widget.userName);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: controller.formKey1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                 height: MediaQuery.of(context).size.height * 0.08,
                ),
            CustomText(textType:TextStyleType.CUSTOM, text: "Log in",fontSize: screenWidth(12),),
            AppLogoContainer(),
            LabelText(
              labelText: 'Enter user name',
              padding: 30,
            ),
            AppTextField(
              controller: controller.loginUserNameController,
              validator: (value) {
                // value = context.read<AuthCubit>().phoneController.text;
                print(value);
                if (value == '' || value == null) {
                  return 'please enter the user name';
                }

                return null;
              },
              hintText: 'userName',
            ),
            LabelText(
              labelText: 'Enter your password',
              padding: 30,
            ),
            AppTextField(
              isPassword: true,
              controller: controller.loginPasswordController,
              validator: (value) {
                // value = context.read<AuthCubit>().phoneController.text;
                print(value);
                if (value == '' || value == null) {
                  return ' please enter your password';
                }
                if (value.length < 6) {
                  return 'the password shoud be more than 6 characters';
                }
                return null;
              },
              hintText: '**********',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            AppButton(
                      onTap: () =>controller.login(),
                      btnWidth: screenWidth(1.17),
                      //btnWidth: context.width * 0.85,
                      buttonText: 'Log In')
            ,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      'Don\'t have an account yet !',
                      style: TextStyle(
                        // color: appColors.kDarkColor,
                        // fontFamily: appColor.kMedium,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: ()=>Get.to(SignUpView()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          // fontFamily: appColor.kMedium,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
           // AgreeToTermsText()
          ],
        ),
      ),
    ));
  }
}
