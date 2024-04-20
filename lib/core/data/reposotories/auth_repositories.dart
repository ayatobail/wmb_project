import 'package:mwb_project/core/data/models/apis/auth_model.dart';

import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/endpoints/auth_endpoints.dart';
import '../network/network_config.dart';
import 'package:dartz/dartz.dart';
class AuthRepositories {
  static Future<Either<String, SignUpModel>> register(
      {required String firstName,
      required String lastName,
      required String userName,
        required String password,
        required String email,
        required String address,
        }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        body: {
          "Username": userName,
          "Password": password,
          "FName": firstName,
          "LName": lastName,
          "Address": address,
          "Email": email
        },
        url: AuthEndpoints.signUp,
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.POST),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus ) {
          return Right(SignUpModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, LogInModel>> login({
    required String name,
    required String password
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: AuthEndpoints.login,
        body: {'Username': name, 'Password':password},
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.POST,
        ),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(LogInModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
