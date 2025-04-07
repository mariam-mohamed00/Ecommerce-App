import 'package:app_e_commerce/features/auth/data/model/response/auth_response_dto.dart';
import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, AuthResponseDto>> register(String name,
      String email, String password, String rePassword, String mobileNumber);

  Future<Either<Failures, AuthResponseDto>> login(
      String email, String password);
}
