import 'dart:convert';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:boutique_merchant/api/httpHandler.dart';
import 'package:boutique_merchant/logger.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  static UserApi? instance;

  static UserApi getInstance() {
    return instance??= UserApi();
  }

  Future<ApiResponse> login(req) async {
    ApiResponse apiResponse =  ApiResponse();
    try {
      apiResponse = await HttpHandler.postRequest(Utilities.baseUrl +
          "users/login",req);
      if (apiResponse.success) {
        apiResponse.data = UserModel.fromJson(apiResponse.data);
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = true;
    }
    return apiResponse;
  }

  Future<ApiResponse> verifyOtp(req) async {
    ApiResponse apiResponse =  ApiResponse();
    try {
      apiResponse = await HttpHandler.postRequest(Utilities.baseUrl +
          "users/verifyOtp",req);
      if (!apiResponse.success) {
        apiResponse.data = UserModel.fromJson(apiResponse.data);
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse> getUserDetails() async {
    ApiResponse apiResponse =  ApiResponse();
    var id=await SharedPreferences.getInstance().then((value) => value.getString('id'));
    try {
      apiResponse = await HttpHandler.getRequestToken(Utilities.baseUrl +
          "users/details/$id",);
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
    ApiResponse apiResponse =  ApiResponse();
    try {
      Map<String, String> req =  {};
      req.putIfAbsent("userId", () => "");
      apiResponse = await HttpHandler.getRequest(Utilities.baseUrl +
          "profiles/" +
          FirebaseAuth.instance.currentUser!.uid);
      if (!apiResponse.success) {
        apiResponse.data = UserModel.fromJson(apiResponse.data);
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse> saveProfile(Map<String, dynamic> request) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      apiResponse = await HttpHandler.postRequest(
          Utilities.baseUrl + "profiles", request);
      if (!apiResponse.success) {
        apiResponse.data = UserModel.fromJson(apiResponse.data);
      }
    } catch (e) {
      debugPrint(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }
}
