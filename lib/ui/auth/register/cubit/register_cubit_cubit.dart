import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_auvnet/domain/use_case/register_use_case.dart';
import 'package:task_auvnet/ui/auth/register/cubit/register_cubit_state.dart';

class RegisterCubitCubit extends Cubit<RegisterCubitState> {
  RegisterUseCase registerUseCase;
  RegisterCubitCubit({required this.registerUseCase})
      : super(RegisterCubitInitial());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmationPasswordController =
      TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isObscureconfirmation = true;
  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterCubitLoading(loadingMessage: "Loading"));
      var either = await registerUseCase.invoke(
          fullNameController.text,
          emailController.text,
          passwordController.text,
          confirmationPasswordController.text,
          numberController.text);

      either.fold((l) {
        emit(RegisterCubitError(errorMessage: l.errorMessage));
      }, (response) {
        emit(RegisterCubitSuccess(authResultEntity: response));
      });
    }
  }
}
