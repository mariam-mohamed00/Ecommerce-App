import 'dart:convert';

import 'package:app_e_commerce/core/constants/api_constants.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/core/utils/shared_preference.dart';
import 'package:app_e_commerce/features/wishlist/data/model/response/add_to_wishlist_response_dto.dart';
import 'package:app_e_commerce/features/wishlist/data/model/response/delete_wishlist_item_response_dto.dart';
import 'package:app_e_commerce/features/wishlist/data/model/response/get_wishlist_response_dto.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class WishlistApiManager {
  WishlistApiManager._();
  static WishlistApiManager? _instance;

  static WishlistApiManager getInstance() {
    _instance ??= WishlistApiManager._();
    return _instance!;
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

  Future<Either<Failures, DeleteWishlistItemResponseDto>> deleteWishlistItem(
      String productId) async {
    Uri url = Uri.https(ApiConstants.baseUrl,
        '${ApiConstants.addToWishlistEndPoint}/$productId');

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getData(key: 'Token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var json = jsonDecode(response.body);
      var deleteWishlistItemResponse = DeleteWishlistItemResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteWishlistItemResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: deleteWishlistItemResponse.message!));
      } else {
        return Left(
            ServerError(errorMessage: deleteWishlistItemResponse.message!));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }
}
