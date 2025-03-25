import 'dart:convert';

import 'package:app_e_commerce/core/constants/api_constants.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/data/model/response/product_response_dto.dart';
import 'package:app_e_commerce/features/products/data/model/response/specific_product_response_dto.dart';
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

  Future<Either<Failures, SpecificProductResponseDto>> getSpecificProducts(
      String productId) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl, '${ApiConstants.getProductsEndPoint}/$productId');

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      print(json);
      var specificProductResponse = SpecificProductResponseDto.fromJson(json);
      print('---${specificProductResponse.message}---');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(specificProductResponse);
      } else {
        return Left(
            ServerError(errorMessage: specificProductResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }
}
