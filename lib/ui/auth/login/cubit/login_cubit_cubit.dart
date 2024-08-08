import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_auvnet/domain/use_case/login_use_case.dart';
import 'package:task_auvnet/ui/auth/login/cubit/login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginUseCase loginUseCase;
  LoginCubitCubit({required this.loginUseCase}) : super(LoginCubitInitial());
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isObscure = true;
  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginCubitLoading(loadingMessage: "Loading"));
      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );

      either.fold((l) {
        emit(LoginCubitError(errorMessage: l.errorMessage));
      }, (response) {
        emit(LoginCubitSuccess(authResultEntity: response));
      });
    }
  }
}
