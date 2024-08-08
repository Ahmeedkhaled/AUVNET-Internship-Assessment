import 'package:task_auvnet/domain/entity/auth_result_entity.dart';

abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {}

class LoginCubitLoading extends LoginCubitState {
  String? loadingMessage;
  LoginCubitLoading({required this.loadingMessage});
}

class LoginCubitError extends LoginCubitState {
  String? errorMessage;
  LoginCubitError({required this.errorMessage});
}

class LoginCubitSuccess extends LoginCubitState {
  AuthResultEntity authResultEntity;
  LoginCubitSuccess({required this.authResultEntity});
}
