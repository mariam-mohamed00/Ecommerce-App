import 'package:app_e_commerce/domain/entity/auth_response_entity.dart';
import 'package:app_e_commerce/domain/failures.dart';
import 'package:app_e_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepositoryContract;
  RegisterUseCase({required this.authRepositoryContract});

  Future<Either<Failures, AuthResponseEntity>> invoke(String name, String email,
      String password, String rePassword, String mobileNumber) {
    return authRepositoryContract.register(
        name, email, password, rePassword, mobileNumber);
  }
}
