import 'dart:convert';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/httpHandler.dart';
import 'package:boutique_merchant/logger.dart';
import 'package:boutique_merchant/models/AddItemFilter.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemsApi {
  static ItemsApi? instance;

  static ItemsApi getInstance() {
    return instance ??= ItemsApi();
  }

  Future<ApiResponse> getAddItemsFilter() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      apiResponse =
          await HttpHandler.getRequest<AddItemFilter>(Utilities.baseUrl + "getAddItemsFilter",);
      if (apiResponse.success) {
        apiResponse.data = UserModel.fromJson(apiResponse.data);
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse> verifyOtp(req) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      apiResponse = await HttpHandler.postRequest(
          Utilities.baseUrl + "users/verifyOtp", req);
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
    ApiResponse apiResponse = ApiResponse();
    var id = await SharedPreferences.getInstance()
        .then((value) => value.getString('id'));
    try {
      apiResponse = await HttpHandler.getRequestToken(
        Utilities.baseUrl + "users/details/$id",
      );
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
    ApiResponse apiResponse = ApiResponse();
    try {
      Map<String, String> req = {};
      await SharedPreferences.getInstance()
          .then((value) => req.putIfAbsent("id", () => value.getString("id")!));
      apiResponse = await HttpHandler.getRequest(
          Utilities.baseUrl + "profiles/" + req["id"]!);
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
