import 'package:app_e_commerce/features/auth/data/model/api/auth_api_manager.dart';
import 'package:app_e_commerce/features/auth/data/model/response/auth_response_dto.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthApiManager authApiManager;
  AuthRemoteDataSourceImpl({required this.authApiManager});

  @override
  Future<Either<Failures, AuthResponseDto>> register(String name, String email,
      String password, String rePassword, String mobileNumber) async {
    var either = await authApiManager.register(
        name, email, password, rePassword, mobileNumber);
    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r);
      },
    );
  }

  @override
  Future<Either<Failures, AuthResponseDto>> login(
      String email, String password) async {
    var either = await authApiManager.login(password, email);
    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r);
      },
    );
  }
}
