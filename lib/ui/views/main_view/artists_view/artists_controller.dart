
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mwb_project/core/data/models/apis/artist_Model.dart';

import '../../../../core/data/reposotories/artists_repository.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/services/base_controller.dart';
import '../../../shared/custom_widgets/custom_toast.dart';

class ArtistsController extends BaseController{
  List<String> artists=["shayne ward","west life","bsb","bbbb"];

  RxList<ArtistsModel> artistsList = <ArtistsModel>[].obs;

  void onInit()
  {
    getAllArtists();
  }

  void getAllArtists() {
    runFutureFunctionWithLoading(
        function: ArtistRepository().getAllArtists1().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            artistsList.clear();
            artistsList.addAll(r);

          });
        }));
  }
}
/*class MyTripsController extends BaseController{
  RxList<TripsModel> tripsList = <TripsModel>[].obs;
  RxList<TripsModel> filteredTripsList = <TripsModel>[].obs;
  List<TripsModel> list=<TripsModel>[];
  TextEditingController searchController = TextEditingController();


  /*bool get isCategoryLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          operationType == OperationType.CATEGORY;

  bool get isMealLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          operationType == OperationType.MEAL;

  RxInt cartCount = 0.obs;*/

  @override
  void onInit() {
    searchController.text="";
    getAllTrips();
    super.onInit();
  }

  void getAllTrips() {
    runFutureFunctionWithLoading(
        function: TripsRepository().getAllTrips().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            tripsList.addAll(r);
            //tripsList.clear();
          });
        }));
  }



  void filterdTrips(){
    filteredTripsList.clear();
    list!.forEach((element) {
      if(searchController.text==element.flightN.toString())
      {filteredTripsList.add(element);}
    });

    if(filteredTripsList.isNotEmpty)
    {tripsList.value=filteredTripsList;}else{tripsList.value=list ; CustomToast.showMessage(
        message: "No items founded", messageType: MessageType.INFO);
    }
  }

}*/