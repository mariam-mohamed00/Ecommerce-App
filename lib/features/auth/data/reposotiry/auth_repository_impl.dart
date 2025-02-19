import 'package:app_e_commerce/features/auth/data/mappers/auth_response_dto_mappers.dart';
import 'package:app_e_commerce/features/auth/domain/entity/auth_response_entity.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:app_e_commerce/features/auth/domain/repository/auth_repository_contract.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, AuthResponseEntity>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String mobileNumber) async {
    var result = await authRemoteDataSource.register(
        name, email, password, rePassword, mobileNumber);
    return result.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toRegisterResponseEntity());
      },
    );
  }

  @override
  Future<Either<Failures, AuthResponseEntity>> login(
      String email, String password) async {
    var result = await authRemoteDataSource.login(email, password);
    return result.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toLoginResponseEntity());
      },
    );
  }
}