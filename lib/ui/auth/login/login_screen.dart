import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_auvnet/constant/dialog_utils.dart';
import 'package:task_auvnet/constant/routes.dart';
import 'package:task_auvnet/domain/di.dart';
import 'package:task_auvnet/my_theme.dart';
import 'package:task_auvnet/ui/auth/login/cubit/login_cubit_cubit.dart';
import 'package:task_auvnet/ui/auth/login/cubit/login_cubit_state.dart';
import 'package:task_auvnet/ui/widget/text_field_item.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubitCubit loginCubitCubit =
      LoginCubitCubit(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubitCubit, LoginCubitState>(
      bloc: loginCubitCubit,
      listener: (context, state) {
        if (state is LoginCubitLoading) {
          DialogUtils.showLoading(context, state.loadingMessage ?? "Loading");
        } else if (state is LoginCubitError) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage ?? "Error",
              posActionName: "Ok", title: "Error");
        } else if (state is LoginCubitSuccess) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, "Register successfully",
              posActionName: "Ok", title: "success");
        }
      },
      child: Scaffold(
        backgroundColor: MyTheme.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      "AUVNET",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Welcome Back To AUVNET",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    child: Form(
                      key: loginCubitCubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFieldItem(
                              fieldName: "email",
                              controller: loginCubitCubit.emailController,
                              hintText: "enter Your Name",
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "please enter your email";
                                }
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return "please enter valid email";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          TextFieldItem(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    loginCubitCubit.isObscure =
                                        !loginCubitCubit.isObscure;
                                    setState(() {});
                                  },
                                  icon: loginCubitCubit.isObscure
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility)),
                              keyBoardType: TextInputType.number,
                              fieldName: "Password",
                              isObscure: loginCubitCubit.isObscure,
                              controller: loginCubitCubit.passwordController,
                              hintText: "enter Your Password",
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "please enter your Password";
                                }
                                if (value.trim().length < 6 ||
                                    value.trim().length > 30) {
                                  return "password should be >6&<30";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const Text(
                            "ForgetPassword",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              loginCubitCubit.login();
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  const WidgetStatePropertyAll(Colors.white),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Login",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Dont have an account? ",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                textAlign: TextAlign.end,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(MyRoute.register);
                                  },
                                  child: const Text(
                                    "Create Account?",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    textAlign: TextAlign.end,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
