import 'package:app_e_commerce/data/model/api/api_manager.dart';
import 'package:app_e_commerce/domain/entity/register_response_entity.dart';
import 'package:app_e_commerce/domain/failures.dart';
import 'package:app_e_commerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String mobileNumber) async {
    var either = await apiManager.register(
        name, email, password, rePassword, mobileNumber);
    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toRegisterResponseEntity());
      },
    );
  }
}
