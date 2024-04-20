import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mwb_project/core/services/base_controller.dart';
import 'package:mwb_project/ui/shared/custom_widgets/custom_text.dart';

import '../../../core/enums/message_type.dart';
import '../../../core/themes/app_colors.dart';
import '../../shared/custom_widgets/app_text_field.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../../shared/utils.dart';

class SongDetailsController extends BaseController{
  void buySong(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.backgroundColor,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  CustomText(textType: TextStyleType.CUSTOM, text: 'Payment method',fontSize: screenWidth(18),fontWeight: FontWeight.bold,textColor: AppColors.textColor,),
              Image(
              image: ResizeImage(AssetImage('assets/images/money.png'),
                width: 130, height: 150)),

                  CustomText(textType: TextStyleType.CUSTOM, text: 'please enter your credit card number',fontSize: screenWidth(20),),
                  AppTextField(
                    width: screenWidth(2),
                    height: screenHeight( 19),
                    hintText: "xxxx xxxx xxxx xxxx",
                    inputType: TextInputType.number,
                    validator: (value) {
                      print(value);
                      if (value == '' || value == null) {
                        return "ypu have to enter a credit card number";
                      }
                      if(value.length<=12){return "credit card number is invalid";}
                    },
                  ),
                  AppButton(
                      btnWidth: screenWidth(4),
                      onTap: () {
                        CustomToast.showMessage(
                            message: "process done successfuly", messageType: MessageType.SUCCESS);
                      },
                      buttonText: 'Submit'),
                ],
              ),
            ),
          );
        });
  }

}
