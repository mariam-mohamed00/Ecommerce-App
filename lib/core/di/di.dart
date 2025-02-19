import 'package:app_e_commerce/features/auth/data/model/api/api_manager.dart';
import 'package:app_e_commerce/features/auth/data/data_source/auth_remote_data_source_impl.dart';
import 'package:app_e_commerce/features/auth/data/reposotiry/auth_repository_impl.dart';
import 'package:app_e_commerce/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:app_e_commerce/features/auth/domain/repository/auth_repository_contract.dart';
import 'package:app_e_commerce/features/auth/domain/use_case/login_use_case.dart';
import 'package:app_e_commerce/features/auth/domain/use_case/register_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
