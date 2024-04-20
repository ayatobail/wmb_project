
import 'package:mwb_project/core/data/models/apis/songs_model.dart';
import 'package:mwb_project/core/data/reposotories/songs_repository.dart';
import 'package:mwb_project/core/services/base_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../core/enums/message_type.dart';
import '../../../shared/custom_widgets/custom_toast.dart';


class SongsController extends BaseController{


RxList<SongsModel> songsList = <SongsModel>[].obs;

void onInit()
{
  getAllSongs();
}

void getAllSongs() {
  runFutureFunctionWithLoading(
      function: SongRepository().getAllSongs().then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          songsList.clear();
          songsList.addAll(r);

        });
      }));
}

}
/*class MyServicesController extends BaseController {
  RxList<MyServicesModel> myServicesList = <MyServicesModel>[].obs;
  List<MyServicesModel> filteredList = <MyServicesModel>[];
  List<MyServicesModel> list = <MyServicesModel>[];
  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    searchController.clear();
    getAllMyServices();
    super.onInit();
  }

  void getAllMyServices() {
    runFutureFunctionWithLoading(
        function: ServicesRepository().showMyServices(
            storage.getId().toString()).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            myServicesList.clear();
            list.clear();
            myServicesList.addAll(r);
            list.addAll(r);


          });
        }));
  }

  void filterdTrips() {
    filteredList.clear();
    list!.forEach((element) {
      if (searchController.text == element.userName) {
        filteredList.add(element);
      }
    });

    if (filteredList.isNotEmpty) {
      myServicesList.value = filteredList;
    } else {
      myServicesList.value = list;
      CustomToast.showMessage(
          message: "No items founded", messageType: MessageType.INFO);
    }
  }

}*/