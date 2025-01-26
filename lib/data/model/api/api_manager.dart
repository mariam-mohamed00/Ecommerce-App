import 'dart:convert';

import 'package:app_e_commerce/data/model/api/api_constants.dart';
import 'package:app_e_commerce/data/model/request/register_request.dart';
import 'package:app_e_commerce/data/model/response/register_response_dto.dart';
import 'package:app_e_commerce/domain/failures.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, RegisterResponseDto>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String mobileNumber) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerEndPoint);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var registerBody = RegisterRequest(
          name: name,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: mobileNumber);

      var response = await http.post(url, body: registerBody.toJson());
      var json = jsonDecode(response.body);
      var registerResponse = RegisterResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      }else{
        return Left(ServerError(errorMessage: registerResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }
}
