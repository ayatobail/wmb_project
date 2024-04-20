import 'package:mwb_project/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../core/themes/app_colors.dart';
import '../utils.dart';

class AppDropDown extends StatefulWidget {
  AppDropDown(
      {super.key,
      required this.items,
      this.hintText,
      this.labelText,
      this.isConst = true,
      this.value,
      this.onChanged,
      this.width,
      this.rounded,
      this.color,
      this.validator});

  final List items;
  String? hintText;
  String? labelText;
  final bool isConst;
  double? width;
  double? rounded;
  Color? color;
  String? Function(dynamic)? validator;
  dynamic? value;
  final Function(dynamic val)? onChanged;

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0,),
      child: Container(
         // margin: EdgeInsets.all(16.0),
          // color: Colors.white,
          width: widget.width ?? context.width * 0.85,
          height: screenHeight(19),
          child: DropdownButtonFormField<dynamic>(
            validator: widget.validator,
            value: widget.value,
            isExpanded: false,
            dropdownColor: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            focusColor: AppColors.textColor,
            decoration: InputDecoration(
                fillColor: Theme.of(context).primaryColor,
                focusColor: Theme.of(context).primaryColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.rounded ?? 8.0),
                  borderSide: BorderSide(
                      color: widget.color ?? AppColors.lightGreyColor,
                      width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.rounded ?? 12),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.0,
                  ),
                ),
                isDense: true,
                isCollapsed: false,
                contentPadding: EdgeInsets.symmetric(vertical: screenWidth(50),horizontal: screenWidth(50)),

                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: Theme.of(context).primaryColor,),
                //     borderRadius: BorderRadius.circular(8)),
                labelText: widget.labelText,
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
               ),
            //padding: EdgeInsets.all(4),
            hint: FittedBox(
              child: Text(
                widget.hintText ?? ' ',
              ),
            ),
            items: widget.items
                .map(
                  (e) => DropdownMenuItem<dynamic>(
                    value: e,
                    child: Text(
                      e.toString(),
                    ),
                  ),
                )
                .toList(),
            onChanged: widget.onChanged ??
                (val) {
                  setState(() {
                    widget.hintText = val.toString();
                  });
                },
          )),
    );
  }
}
