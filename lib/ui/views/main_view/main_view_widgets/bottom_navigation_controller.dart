
import 'package:get/get.dart';
import 'package:mwb_project/core/utils/general_utils.dart';

import '../../../../core/enums/bottom_Navigation.dart';
import '../../../../core/services/base_controller.dart';

class BottomNavigationController extends BaseController {
  BottomNavigationController(BottomNavigationEnum type) {
    enumType.value = type;
  }
  Rx<BottomNavigationEnum> enumType = storage.getUserInfo()!.isAdmin?BottomNavigationEnum.HOME.obs:BottomNavigationEnum.SONGS.obs;
}