import 'package:app_e_commerce/data/model/api/api_manager.dart';
import 'package:app_e_commerce/data/reposotiry/data_source/auth_remote_data_source_impl.dart';
import 'package:app_e_commerce/data/reposotiry/repository/auth_repository_impl.dart';
import 'package:app_e_commerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:app_e_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:app_e_commerce/domain/use_case/register_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
