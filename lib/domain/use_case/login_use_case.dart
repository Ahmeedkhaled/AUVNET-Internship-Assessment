import 'package:dartz/dartz.dart';
import 'package:task_auvnet/constant/failures.dart';
import 'package:task_auvnet/domain/entity/auth_result_entity.dart';
import 'package:task_auvnet/domain/repository/repository/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract authRepositoryContract;
  LoginUseCase({required this.authRepositoryContract});
  Future<Either<Failures, AuthResultEntity>> invoke(
      String email, String password) {
    return authRepositoryContract.login(email, password);
  }
}
