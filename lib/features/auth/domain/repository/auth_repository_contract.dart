import 'package:app_e_commerce/features/auth/domain/entity/auth_response_entity.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositoryContract {
  Future<Either<Failures, AuthResponseEntity>> register(String name,
      String email, String password, String rePassword, String mobileNumber);

  Future<Either<Failures, AuthResponseEntity>> login(
      String email, String password);
}
