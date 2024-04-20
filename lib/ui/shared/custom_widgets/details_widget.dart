import 'package:flutter/material.dart';
import 'package:mwb_project/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:mwb_project/ui/shared/utils.dart';

import '../../../core/themes/app_colors.dart';
import 'colored_text.dart';
class DetailsWidget extends StatefulWidget {
  const DetailsWidget({super.key, required this.title, this.text, this.icon, this.text2, this.text3});
final String title;
final String? text;
final String? text2;
final String? text3;
final IconData? icon;
  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
            color: AppColors.primaryColor, style: BorderStyle.solid),
      ),
      color: AppColors.backgroundColor,
      margin: EdgeInsets.all(12),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
            padding: EdgeInsets.only(left: screenWidth(20)),
            child: Icon(
              widget.icon,
              color: AppColors.primaryColor,

            ),
          ),
          ColoredText(
            text: widget.title,
            textColor: AppColors.secondaryColor,
            leftPadding: 0,
            size: screenWidth(20),
          ),
          Spacer(),
          Column(
            children: [
              ColoredText(
                  text: widget.text??"",
                  textColor: AppColors.primaryColor,
                  leftPadding: 0,
                  size: screenWidth(20)),

            ],
          ),

          screenWidth(15).pw
        ],
      ),
    );
  }
}
