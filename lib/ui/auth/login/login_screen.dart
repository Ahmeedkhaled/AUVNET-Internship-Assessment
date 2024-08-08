import 'package:flutter/material.dart';
import 'package:task_auvnet/constant/routes.dart';
import 'package:task_auvnet/my_theme.dart';
import 'package:task_auvnet/ui/auth/register/register.dart';
import 'package:task_auvnet/ui/widget/text_field_item.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;

  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFieldItem(
                            fieldName: "email",
                            controller: emailController,
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
                                  isObscure = !isObscure;
                                  setState(() {});
                                },
                                icon: isObscure
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                            keyBoardType: TextInputType.number,
                            fieldName: "Password",
                            isObscure: isObscure,
                            controller: passwordController,
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
                            validator();
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
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
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
    );
  }

  void validator() {
    if (formKey.currentState!.validate() == true) {
      // Navigator.of(context).pushNamed(HomePage.routeName);
    }
  }
}
