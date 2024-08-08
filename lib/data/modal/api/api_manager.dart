import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:task_auvnet/constant/failures.dart';
import 'package:task_auvnet/constant/shared_pre.dart';
import 'package:task_auvnet/data/modal/api/api_constant.dart';
import 'package:task_auvnet/data/modal/request/login_request.dart';
import 'package:task_auvnet/data/modal/request/register_request.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:task_auvnet/data/modal/respones/cart_dto.dart';
import 'package:task_auvnet/data/modal/respones/login_respone_dto.dart';
import 'package:task_auvnet/data/modal/respones/productResponseDto.dart';
import 'package:task_auvnet/data/modal/respones/register_respone_dto.dart';

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }
  //https://ecommerce.routemisr.com/api/v1/auth/signup

  Future<Either<Failures, RegisterResponeDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.registerApi);
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var registerBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        phone: phone,
        rePassword: rePassword,
      );
      var response = await http.post(url, body: registerBody.toJson());

      var registerResponse =
          RegisterResponeDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        SharedPereferanceConstant.saveData(
            key: "token", value: registerResponse.token);
        return right(registerResponse);
      } else {
        return left(ServerError(errorMessage: registerResponse.statusMsg));
      }
    } else {
      return left(
          NetworkError(errorMessage: "Please Check Internet Connection"));
    }
  }

  Future<Either<Failures, LoginResponeDto>> login(
      String email, String password) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.loginApi);
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var loginBody = LoginRequest(email: email, password: password);
      var response = await http.post(url, body: loginBody.toJson());

      var loginResponse = LoginResponeDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        SharedPereferanceConstant.saveData(
            key: "token", value: loginResponse.token);
        return right(loginResponse);
      } else {
        return left(ServerError(errorMessage: loginResponse.statusMsg));
      }
    } else {
      return left(
          NetworkError(errorMessage: "Please Check Internet Connection"));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getAllProduct() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.productApi);
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await http.get(url);

      var productResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(productResponse);
      } else {
        return left(ServerError(errorMessage: productResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: "Please Check Internet Connection"));
    }
  }

  Future<Either<Failures, CartResponseDto>> addToCart(String productId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.cartApi);
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    var token = SharedPereferanceConstant.getData(key: "token");
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await http.post(url,
          body: {"productId": productId}, headers: {"token": token.toString()});

      var cartResponse = CartResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(cartResponse);
      } else if (response.statusCode == 401) {
        return left(ServerError(errorMessage: cartResponse.message));
      } else {
        return left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: "Please Check Internet Connection"));
    }
  }
}
