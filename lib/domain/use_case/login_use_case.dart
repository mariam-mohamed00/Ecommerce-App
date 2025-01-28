import 'package:app_e_commerce/domain/entity/auth_response_entity.dart';
import 'package:app_e_commerce/domain/failures.dart';
import 'package:app_e_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  AuthRepositoryContract authRepositoryContract;
  LoginUseCase({required this.authRepositoryContract});

  Future<Either<Failures, AuthResponseEntity>> invoke(
      String email, String password) {
    return authRepositoryContract.login(email, password);
  }
}
