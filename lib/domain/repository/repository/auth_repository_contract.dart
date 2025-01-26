import 'package:app_e_commerce/domain/entity/register_response_entity.dart';
import 'package:app_e_commerce/domain/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositoryContract {
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String mobileNumber);
}
