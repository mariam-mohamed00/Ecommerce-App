import 'dart:convert';

import 'package:app_e_commerce/core/constants/api_constants.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/data/model/response/product_response_dto.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ProductApiManager {
  ProductApiManager._();
  static ProductApiManager? _instance;

  static ProductApiManager getInstance() {
    _instance ??= ProductApiManager._();
    return _instance!;
  }

  Future<Either<Failures, ProductResponseDto>> getProducts() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getProductsEndPoint);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var productResponse = ProductResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(ServerError(errorMessage: productResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }
}
