import 'package:mwb_project/core/data/network/endpoints/artists_enpoints.dart';
import 'package:dartz/dartz.dart';
import 'package:mwb_project/core/data/network/endpoints/songs_endpoints.dart';
import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class AddingRepositories {
   Future<Either<String, dynamic>> addArtist(
      {required String firstName,
        required String lastName,
        required String gender,
        required String country,
      }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        body: {
          "FName": firstName,
          "LName": lastName,
          "Gender": gender,
          "Country": country
        },
        url: ArtistsEndpoints.addArtist,
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.POST),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus ) {
          return Right("you have successfuly added a new artist");
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, dynamic>> addSong({
    required String title,
    required String type,
    required int price,
    required int artistId,

  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: SongsEndpoints.sddSong,
        body: {
          "Title": title,
          "Type": type,
          "Price": price,
          "ArtistId": artistId
        },
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.POST,
        ),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right("you have successfuly added a new song");
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
