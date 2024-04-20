import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../../core/themes/app_colors.dart';

double width = Get.size.shortestSide;
double height = Get.size.longestSide;
Size size = Get.size;

double screenWidth(double percent) {
  return width / percent;
}

double screenHeight(double percent) {
  return height / percent;
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: screenWidth(4),
        height: screenHeight(4),
        child: SpinKitCircle(
          color: AppColors.primaryColor,
        ),
      );
    });
