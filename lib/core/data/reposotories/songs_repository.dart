import 'package:mwb_project/core/data/models/apis/songs_model.dart';
import 'package:mwb_project/core/data/network/endpoints/songs_endpoints.dart';
import 'package:dartz/dartz.dart';
import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class SongRepository {

  Future<Either<String, dynamic>>
  getAllSongs() //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: SongsEndpoints.getAllSongs,
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<SongsModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(SongsModel.fromJson(element));
          });
          return Right(result);
        }  else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, dynamic>>
  searchSong(String song) //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: SongsEndpoints.searchSong,
        params: {"title":song},
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<SongsModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(SongsModel.fromJson(element));
          });
          return Right(result);
        }  else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}