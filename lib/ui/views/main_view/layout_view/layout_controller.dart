
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mwb_project/core/utils/general_utils.dart';
import 'package:mwb_project/ui/views/main_view/artists_view/artists_controller.dart';
import '../../../../core/enums/bottom_Navigation.dart';
import '../../../../core/services/base_controller.dart';
import '../songs_view/songs_controller.dart';



class layoutController extends BaseController{
  SongsController songsController=Get.put(SongsController());
  ArtistsController artistsController=ArtistsController();
  Rx<BottomNavigationEnum> currentIndex = storage.getUserInfo()!.isAdmin?BottomNavigationEnum.HOME.obs:BottomNavigationEnum.SONGS.obs;
  PageController pageController = PageController(initialPage: 0);
  late Rx<BottomNavigationEnum> selected = storage.getUserInfo()!.isAdmin?BottomNavigationEnum.HOME.obs:BottomNavigationEnum.SONGS.obs;
  RxInt pageIndex = 2.obs;

  void onClick(BottomNavigationEnum select, int pageNumber,) {
    selected.value = select;
    if(selected == BottomNavigationEnum.SONGS.obs){songsController.onInit();}
    if(selected == BottomNavigationEnum.ARTISTS.obs){artistsController.onInit();}
    pageController.jumpToPage(pageNumber);
    pageIndex.value = pageNumber;

  }

}