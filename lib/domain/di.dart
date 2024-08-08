import 'package:task_auvnet/data/modal/api/api_manager.dart';
import 'package:task_auvnet/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:task_auvnet/data/repository/data_source/home_remote_data_source_impl.dart';
import 'package:task_auvnet/data/repository/repository/auth_repository_impl.dart';
import 'package:task_auvnet/data/repository/repository/home_repo_imp.dart';
import 'package:task_auvnet/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:task_auvnet/domain/repository/data_source/home_remote_data_source.dart';
import 'package:task_auvnet/domain/repository/repository/auth_repository_contract.dart';
import 'package:task_auvnet/domain/repository/repository/home_repository_contract.dart';
import 'package:task_auvnet/domain/use_case/add_to_cart_use_case.dart';
import 'package:task_auvnet/domain/use_case/get_all_product_use_case.dart';
import 'package:task_auvnet/domain/use_case/login_use_case.dart';
import 'package:task_auvnet/domain/use_case/register_use_case.dart';

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

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepositoryContract: injectAuthRepositoryContract());
}

GetAllProductUseCase injectGetAllProductUseCase() {
  return GetAllProductUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(repositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(dataSource: injectHomeDataSource());
}

HomeDataSource injectHomeDataSource() {
  return HomeDataSourceImpl(apiManager: ApiManager.getInstance());
}
