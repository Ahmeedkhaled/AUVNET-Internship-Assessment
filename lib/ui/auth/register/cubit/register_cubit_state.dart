import 'package:task_auvnet/domain/entity/auth_result_entity.dart';

abstract class RegisterCubitState {}

class RegisterCubitInitial extends RegisterCubitState {}

class RegisterCubitLoading extends RegisterCubitState {
  String? loadingMessage;
  RegisterCubitLoading({required this.loadingMessage});
}

class RegisterCubitError extends RegisterCubitState {
  String? errorMessage;
  RegisterCubitError({required this.errorMessage});
}

class RegisterCubitSuccess extends RegisterCubitState {
  AuthResultEntity authResultEntity;
  RegisterCubitSuccess({required this.authResultEntity});
}
