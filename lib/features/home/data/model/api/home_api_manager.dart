import 'dart:convert';

import 'package:app_e_commerce/core/constants/api_constants.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/core/utils/shared_preference.dart';
import 'package:app_e_commerce/features/home/data/model/response/add_to_cart_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/add_to_wishlist_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/category_or_brand_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/get_cart_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/get_wishlist_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/product_response_dto.dart';
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

  Future<Either<Failures, AddToCartResponseDto>> addToCart(
      String productId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartEndPoint);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getData(key: 'Token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var json = jsonDecode(response.body);
      var addToCartResponse = AddToCartResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartEndPoint);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getData(key: 'Token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var json = jsonDecode(response.body);
      var getCartResponse = GetCartResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> deleteCartItem(
      String productId) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl, '${ApiConstants.addToCartEndPoint}/$productId');

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getData(key: 'Token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var json = jsonDecode(response.body);
      var deleteCartItemResponse = GetCartResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteCartItemResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteCartItemResponse.message!));
      } else {
        return Left(ServerError(errorMessage: deleteCartItemResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> updateCountCartItem(
      String productId, int count) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl, '${ApiConstants.addToCartEndPoint}/$productId');

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getData(key: 'Token');
      var response = await http.put(url,
          headers: {'token': token.toString()}, body: {'count': '$count'});
      var json = jsonDecode(response.body);
      var updateCountCartItemResponse = GetCartResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateCountCartItemResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: updateCountCartItemResponse.message!));
      } else {
        return Left(
            ServerError(errorMessage: updateCountCartItemResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, AddToWishlistResponseDto>> addToWishlist(
      String productId) async {
    Uri url =
        Uri.https(ApiConstants.baseUrl, ApiConstants.addToWishlistEndPoint);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getData(key: 'Token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var json = jsonDecode(response.body);
      var addToWishlistResponse = AddToWishlistResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToWishlistResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToWishlistResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addToWishlistResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, GetWishlistResponseDto>> getWishlist() async {
    Uri url =
        Uri.https(ApiConstants.baseUrl, ApiConstants.addToWishlistEndPoint);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getData(key: 'Token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var json = jsonDecode(response.body);
      var getWishlistResponse = GetWishlistResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getWishlistResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getWishlistResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getWishlistResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }


    Future<Either<Failures, GetWishlistResponseDto>> deleteWishlistItem(
      String productId) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl, '${ApiConstants.addToCartEndPoint}/$productId');

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getData(key: 'Token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var json = jsonDecode(response.body);
      var deleteWishlistItemResponse = GetWishlistResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteWishlistItemResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteWishlistItemResponse.message!));
      } else {
        return Left(ServerError(errorMessage: deleteWishlistItemResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

}
