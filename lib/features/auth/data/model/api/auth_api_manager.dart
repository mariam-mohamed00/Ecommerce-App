import 'dart:convert';

import 'package:app_e_commerce/core/constants/api_constants.dart';
import 'package:app_e_commerce/features/auth/data/model/request/login_request.dart';
import 'package:app_e_commerce/features/auth/data/model/request/register_request.dart';
import 'package:app_e_commerce/features/auth/data/model/response/auth_response_dto.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class AuthApiManager {
  AuthApiManager._();
  static AuthApiManager? _instance;

  static AuthApiManager getInstance() {
    _instance ??= AuthApiManager._();
    return _instance!;
  }

  Future<Either<Failures, AuthResponseDto>> register(String name, String email,
      String password, String rePassword, String mobileNumber) async {
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
      var registerResponse = AuthResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(errorMessage: registerResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, AuthResponseDto>> login(
      String password, String email) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginEndPoint);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var loginBody = LoginRequest(email: email, password: password);

      var response = await http.post(url, body: loginBody.toJson());
      var json = jsonDecode(response.body);
      var loginResponse = AuthResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }
}
