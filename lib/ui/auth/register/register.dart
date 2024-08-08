import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_auvnet/my_theme.dart';
import 'package:task_auvnet/ui/widget/text_field_item.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmationPasswordController =
      TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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
                            fieldName: "Full Name ",
                            controller: fullNameController,
                            hintText: "enter Your Name",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "please enter your name";
                              }
                              return null;
                            }),
                        TextFieldItem(
                            fieldName: "E-mail address",
                            controller: emailController,
                            hintText: "enter Your email",
                            keyBoardType: TextInputType.emailAddress,
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
                            fieldName: "confirmationPassword",
                            isObscure: isObscure,
                            controller: confirmationPasswordController,
                            hintText: "enter Your confirmationPassword",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "please enter your confirmationPassword";
                              }
                              if (value.trim().length < 6 ||
                                  value.trim().length > 30) {
                                return "confirmationPassword should be >6&<30";
                              }
                              if (value != passwordController.text) {
                                return "confirmPassword doesn't match";
                              }
                              return null;
                            }),
                        TextFieldItem(
                            keyBoardType: TextInputType.number,
                            fieldName: "Phone Number",
                            controller: numberController,
                            hintText: "enter Your Phone",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "please enter your phone";
                              }
                              if (value.trim().length < 11 ||
                                  value.trim().length > 11) {
                                return "password should be 11";
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                const WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: MyTheme.darkPrimaryColor,
                                  fontSize: 18),
                            ),
                          ),
                        )
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
}
