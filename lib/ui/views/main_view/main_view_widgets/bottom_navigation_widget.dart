
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mwb_project/core/utils/general_utils.dart';
import '../../../../core/enums/bottom_Navigation.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../shared/utils.dart';
import 'bottom_navigation_controller.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigation;
  final Function(BottomNavigationEnum, int,) onTap;

  const BottomNavigationWidget(
      {super.key, required this.bottomNavigation, required this.onTap,});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  late BottomNavigationController controller;

  @override
  void initState() {
    controller = BottomNavigationController(widget.bottomNavigation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth(1),
        height: screenWidth(9),
        color: AppColors.primaryColor,
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             if(storage.getUserInfo()!.isAdmin) navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.HOME, 0,);
                    controller.enumType.value = BottomNavigationEnum.HOME;
                  },
                  icon: Icons.home_outlined,
                  isSelected: controller.enumType.value ==
                      BottomNavigationEnum.HOME),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.SONGS, storage.getUserInfo()!.isAdmin?1:0,);
                    controller.enumType.value =
                        BottomNavigationEnum.SONGS;

                  },
                  icon: Icons.music_note_outlined,
                  isSelected: controller.enumType.value ==
                      BottomNavigationEnum.SONGS),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.ARTISTS, storage.getUserInfo()!.isAdmin?2:1,);
                    controller.enumType.value = BottomNavigationEnum.ARTISTS;
                  },
                  icon: Icons.person_2_outlined,
                  isSelected:
                      controller.enumType.value == BottomNavigationEnum.ARTISTS),
            ],
          );
        }));
  }

  Widget navItem({
    required IconData icon,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap() ;
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: screenWidth(30)),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,

            ),
            SizedBox(
              height: screenWidth(100),
            ),
            Container(
              width: screenWidth(10),
              height: screenWidth(200),
              color:
                  isSelected ? Colors.white : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
