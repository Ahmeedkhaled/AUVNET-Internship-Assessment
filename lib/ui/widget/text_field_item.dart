import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldItem extends StatelessWidget {
  String? fieldName;
  String? hintText;
  Widget? suffixIcon;
  bool? isObscure;
  TextInputType keyBoardType;
  TextEditingController controller;
  String? Function(String?)? validator;
  TextFieldItem(
      {super.key,
      required this.fieldName,
      required this.controller,
      this.isObscure = false,
      this.keyBoardType = TextInputType.text,
      required this.hintText,
      required this.validator,
      this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            fieldName ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: validator,
            controller: controller,
            obscureText: isObscure ?? false,
            keyboardType: keyBoardType,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                suffixIcon: suffixIcon,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                hintText: hintText,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15))),
          )
        ],
      ),
    );
  }
}
