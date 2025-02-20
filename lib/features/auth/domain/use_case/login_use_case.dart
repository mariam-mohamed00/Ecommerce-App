import 'package:app_e_commerce/features/auth/domain/entity/auth_response_entity.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/auth/domain/repository/auth_repository_contract.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  AuthRepositoryContract authRepositoryContract;

  LoginUseCase({required this.authRepositoryContract});

  Future<Either<Failures, AuthResponseEntity>> invoke(
      String email, String password) {
    return authRepositoryContract.login(email, password);
  }
}
