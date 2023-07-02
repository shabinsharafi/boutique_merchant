import 'dart:convert';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/httpHandler.dart';
import 'package:boutique_merchant/logger.dart';
import 'package:boutique_merchant/models/LoginResponse.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  static UserApi? instance;

  static UserApi getInstance() {
    return instance ??= UserApi();
  }

  Future<ApiResponse> login(req) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      apiResponse =
          await HttpHandler.postRequest<UserModel>(Utilities.baseUrl + "users/login", req,() => UserModel());
      if (apiResponse.success) {
        //apiResponse.data = UserModel.fromJson(apiResponse.data);
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = true;
    }
    return apiResponse;
  }

  Future<ApiResponse<LoginResponse>> verifyOtp(req) async {
    ApiResponse<LoginResponse> apiResponse = ApiResponse();
    try {
      apiResponse = await HttpHandler.postRequest<LoginResponse>(
          Utilities.baseUrl + "users/verifyOtp", req,() => LoginResponse());
      if (!apiResponse.success) {
        //apiResponse.data = LoginResponse.fromJson(apiResponse.data);
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse<LoginResponse>> getUserDetails() async {
    ApiResponse<LoginResponse> apiResponse = ApiResponse();
    var id = await SharedPreferences.getInstance()
        .then((value) => value.getString('id'));
    try {
      apiResponse = await HttpHandler.getRequestToken<LoginResponse>(
        Utilities.baseUrl + "users/details/$id",() => LoginResponse()
      );
      print("uSERaPIO");
      print(apiResponse);
      /*if (apiResponse.success) {
        apiResponse.data = UserModel.fromJson(apiResponse.data);
      }*/
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse> getProfile() async {
    ApiResponse<LoginResponse> apiResponse = ApiResponse();
    try {
      Map<String, String> req = {};
      await SharedPreferences.getInstance()
          .then((value) => req.putIfAbsent("id", () => value.getString("id")!));
      apiResponse = await HttpHandler.getRequest(
          Utilities.baseUrl + "profiles/" + req["id"]!,() => LoginResponse());
      if (!apiResponse.success) {
        // apiResponse.data = UserModel.fromJson(apiResponse.data);
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse<UserModel>> saveProfile(Map<String, dynamic> request) async {
    ApiResponse<UserModel> apiResponse = ApiResponse();
    try {
      apiResponse = await HttpHandler.postRequest<UserModel>(
          Utilities.baseUrl + "profiles", request,() => UserModel());
      if (!apiResponse.success) {
        //apiResponse.data = UserModel.fromJson(apiResponse.data);
      }
    } catch (e) {
      debugPrint(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }
}
