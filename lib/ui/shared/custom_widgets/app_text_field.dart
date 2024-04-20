
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_colors.dart';
import '../utils.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,

        this.width,
        this.height,
        this.validator,
        this.controller,
        this.labelText,
        this.hintText,
        this.maxLines,
        this.inputType,
        this.prefIcon,
        this.sufIcon,
        this.color,
        this.size,
        this.isPassword,
        this.round,
        this.inputActionType,
        this.onSubmitted,
        this.focusNode,
        this.onEditingComplete,
        this.enable,
        this.error

      })
      : super(key: key);
  double? width;
  double? height;
  final TextEditingController? controller;
  String? Function(String?)? validator;
  String? Function(String)? onSubmitted;
  void Function()? onEditingComplete;
  String? labelText;
  String? hintText;
  int? maxLines;
  TextInputType? inputType;
  IconData? prefIcon;
  IconData? sufIcon;
  Color? color;
  double? size;
  bool? isPassword;
  double?round;
  dynamic? inputActionType;
  FocusNode? focusNode;
  bool? enable;
  bool? error;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16.0),
        width: width ?? screenWidth(1.18),
        height:validator!=null? height??screenHeight(12):screenHeight(17),
        child: TextFormField(
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          textInputAction: inputActionType??null,
          onFieldSubmitted: onSubmitted,
           obscureText:isPassword??false ,
          cursorColor: AppColors.primaryColor,
          validator: validator,
          controller: controller,
          maxLines: maxLines ?? 1,
          keyboardType: inputType ?? TextInputType.text,
          decoration: InputDecoration(
              enabled: enable??true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.transparent,
              filled: true,
              prefixIcon: prefIcon != null ?Icon(prefIcon) : null,
              suffixIcon: sufIcon!=null?Icon(sufIcon):null,
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
              label: Text(labelText ?? '',),
              labelStyle: TextStyle(color: AppColors.grey,),
              hintText: hintText,
              focusColor: AppColors.primaryColor,
              // helperText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(round??8.0),
                borderSide: BorderSide(color: AppColors.grey, width: 1.0,),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:color??AppColors.primaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(round??12),
              )
          ),
        ));
  }
}
