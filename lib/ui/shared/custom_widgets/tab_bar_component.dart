import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_colors.dart';



class TabBarComponent extends StatelessWidget {
  const TabBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
            child: Text(
          'add song',
        )),
        Tab(
          child: Text(
            'add artist',
          ),
        ),


      ],
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      indicatorColor: AppColors.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      //indicatorPadding: EdgeInsets.only(right: 20),
      //tabAlignment: TabAlignment.start,
      isScrollable: false,
      automaticIndicatorColorAdjustment: true,
      //dividerHeight: 0,
      indicatorWeight: 1,
      splashBorderRadius: BorderRadius.circular(20),
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
