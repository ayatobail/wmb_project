
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mwb_project/core/utils/general_utils.dart';
import 'package:mwb_project/ui/views/main_view/artists_view/artists_view.dart';
import '../home_view/home_view.dart';
import '../main_view_widgets/bottom_navigation_widget.dart';
import '../songs_view/songs_view.dart';
import 'layout_controller.dart';

class layoutView extends StatefulWidget {
  const layoutView({Key? key}) : super(key: key);

  @override
  _layoutViewState createState() => _layoutViewState();
}

class _layoutViewState extends State<layoutView> {
  final layoutController controller = Get.put(layoutController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            //extendBody: true,
            //backgroundColor: Theme.of(context).colorScheme.primary,
          //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Obx(() {
            return BottomNavigationWidget(
              bottomNavigation: controller.selected.value,
              onTap: controller.onClick,
            );
          }),


          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: [
              if(storage.getUserInfo()!.isAdmin)HomeView(),
              SongsView(controller: controller.songsController,),
              ArtistsView(controller: controller.artistsController),

            ],
          ),


    )
    ,
    );
  }
}