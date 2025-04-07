import 'dart:convert';

import 'package:app_e_commerce/core/constants/api_constants.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/data/model/response/category_or_brand_response_dto.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class HomeApiManager {
  HomeApiManager._();
  static HomeApiManager? _instance;

  static HomeApiManager getInstance() {
    _instance ??= HomeApiManager._();
    return _instance!;
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getCategories() async {
    Uri url =
        Uri.https(ApiConstants.baseUrl, ApiConstants.getCategoriesEndPoint);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var categoryResponse = CategoryOrBrandResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(ServerError(errorMessage: categoryResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getBrands() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getBrandsEndPoint);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var brandResponse = CategoryOrBrandResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(brandResponse);
      } else {
        return Left(ServerError(errorMessage: brandResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

}
