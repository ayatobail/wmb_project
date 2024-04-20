import 'package:mwb_project/core/data/models/apis/artist_Model.dart';
import 'package:mwb_project/core/data/network/endpoints/artists_enpoints.dart';
import 'package:dartz/dartz.dart';
import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class ArtistRepository {
  Future<Either<String, dynamic>>
  getAllArtists() //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ArtistsEndpoints.getAllArtists,
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<dynamic> result = [];
          commonResponse.data!.forEach((element) {
            result.add(element);
          });
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }



  Future<Either<String, dynamic>>
  getAllArtists1() //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ArtistsEndpoints.getAllArtists,
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<ArtistsModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(ArtistsModel.fromJson(element));
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
  searchArtist(String artist) //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ArtistsEndpoints.searchArtists,
        params: {},
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<ArtistsModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(ArtistsModel.fromJson(element));
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