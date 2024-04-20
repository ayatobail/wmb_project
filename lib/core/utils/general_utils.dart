import 'package:mwb_project/app/my_app_controller.dart';
import 'package:mwb_project/core/data/reposotories/shared_preferences_repository.dart';
import 'package:mwb_project/core/enums/connectivity_status.dart';
import 'package:mwb_project/core/enums/message_type.dart';
import 'package:mwb_project/core/services/connectivity_service.dart';
import 'package:mwb_project/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

ConnectivityService get connectivityService => Get.find<ConnectivityService>();

SharedPreferencesRepository get storage =>
    Get.find<SharedPreferencesRepository>();



//when value change change
bool get isOnline =>
    Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    Get.find<MyAppController>().connectivityStatus ==
    ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    showNoConnectionMessage();
}

void showNoConnectionMessage() {
  CustomToast.showMessage(
      message: 'Please check internet connection',
      messageType: MessageType.WARNING);
}
