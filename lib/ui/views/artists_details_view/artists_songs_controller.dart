import 'dart:convert';

import 'package:mwb_project/core/services/base_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/enums/message_type.dart';
import '../../shared/custom_widgets/custom_toast.dart';

class ArtistsSongsController extends BaseController{
  RxList<String> songs = <String>[].obs;
  RxBool isVisible=true.obs;
  RxBool loading=false.obs;
  void fetchSongsByArtist(int artistId) async {
    var url = 'http://mwswmbhwf23.somee.com/api/songs/artist/$artistId';
    try {
      loading.value=true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        loading.value=false;
        var data = json.decode(response.body);
        songs.clear();
        data!.forEach((element) {
          songs.add(element["title"]);
        });

        isVisible.value=false;
      } else {
        loading.value=false;
        CustomToast.showMessage(
            message: response.body, messageType: MessageType.REJECTED);
      }
        // Handle error response


    } catch (e) {
      print("Exception caught: $e");
    }
  }


}