import 'package:app_e_commerce/domain/entity/auth_response_entity.dart';
import 'package:app_e_commerce/domain/failures.dart';
import 'package:app_e_commerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:app_e_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, AuthResponseEntity>> register(String name,
      String email, String password, String rePassword, String mobileNumber) {
    return authRemoteDataSource.register(
        name, email, password, rePassword, mobileNumber);
  }

  @override
  Future<Either<Failures, AuthResponseEntity>> login(
      String email, String password) {
    return authRemoteDataSource.login(email, password);
  }
}
