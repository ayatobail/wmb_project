import 'package:mwb_project/core/data/models/apis/artist_Model.dart';
import 'package:mwb_project/core/services/base_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
class ArtistSearchController extends BaseController{
  RxList<ArtistsModel> filteredSongs = <ArtistsModel>[].obs;
 /* void searchSongs(String song) {
    runFutureFunctionWithLoading(
        function: Ar().searchSong(song).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            filteredSongs.clear();
            filteredSongs.addAll(r);

          });
        }));
  }*/
}