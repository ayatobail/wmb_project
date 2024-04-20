import 'package:mwb_project/ui/views/sign_up_view/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../shared/custom_widgets/app_logo_container.dart';
import '../../shared/custom_widgets/app_text_field.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_text.dart';
import '../../shared/custom_widgets/label_text.dart';
import '../../shared/utils.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              CustomText(textType:TextStyleType.CUSTOM, text: "Sign up",fontSize: screenWidth(12),),
              AppLogoContainer(),
              LabelText(
                labelText: 'Enter User Name',
                padding: 30,
              ),
              AppTextField(
                hintText: 'userName',
                controller: controller.userNameController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please enter user name';
                  }
                  return null;
                },
              ),
              LabelText(
                labelText: 'Enter Your First Name',
                padding: 30,
              ),
              AppTextField(
                hintText: 'first name',
                controller: controller.firstNameController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please enter your first name';
                  }
                  return null;
                },
              ),



              LabelText(
                labelText: 'Enter Your Last Name',
                padding: 30,
              ),

              AppTextField(
                hintText: 'last name',
                controller: controller.lastNameController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please enter your last name';
                  }
                  return null;
                },
              ),
              LabelText(
                labelText: 'Enter Your Email',
                padding: 30,
              ),
              AppTextField(
                hintText: 'example@gmail.com',
                controller: controller.emailController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please enter your email';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'please enter a valid email';
                  }
                  return null;
                },
              ),

              LabelText(
                labelText: 'Enter Your Address',
                padding: 30,
              ),

              AppTextField(
                hintText: 'address',
                controller: controller.addressController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please enter your address';
                  }
                  return null;
                },
              ),

              LabelText(
                labelText: 'Enter Your Password',
                padding: 30,
              ),
              AppTextField(
                isPassword: true,
                hintText: '*********',
                controller: controller.passwordController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please enter a password';
                  }
                  if (value.length < 6) {
                    return 'the password shoud be more than 6 characters';
                  }
                  return null;
                },
              ),
              LabelText(
                labelText: 'Confirm Your Password',
                padding: 30,
              ),
              AppTextField(
                isPassword: true,
                hintText: '*********',
                controller: controller.confirmPasswordController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please confirm your password';
                  }
                  if (value != controller.passwordController.text) {
                    return 'your confirm password didn\'t match ';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
             AppButton(
                  onTap: () => controller.register(),
                  buttonText: 'Sign Up',
                  btnWidth: screenWidth(1.17),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
