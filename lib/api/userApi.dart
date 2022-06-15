import 'dart:convert';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:boutique_merchant/api/httpHandler.dart';
import 'package:boutique_merchant/logger.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:flutter/cupertino.dart';

class UserApi {
  static UserApi? instance;

  static UserApi getInstance() {
    return instance??= UserApi();
  }

  Future<ApiResponse> getProfile() async {
    ApiResponse apiResponse =  ApiResponse();
    try {
      Map<String, String> req =  {};
      req.putIfAbsent("userId", () => "");
      apiResponse = await HttpHandler.getRequest(Utilities.baseUrl +
          "profiles/" +
          FirebaseAuth.instance.currentUser!.uid);
      if (!apiResponse.haserror) {
        apiResponse.data = UserModel.fromJson(apiResponse.data);
      }
    } catch (e) {
      print(e.toString());
      apiResponse.haserror = true;
    }
    return apiResponse;
  }

  Future<ApiResponse> saveProfile(Map<String, dynamic> request) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      apiResponse = await HttpHandler.postRequest(
          Utilities.baseUrl + "profiles", request);
      if (!apiResponse.haserror) {
        apiResponse.data = UserModel.fromJson(apiResponse.data);
      }
    } catch (e) {
      debugPrint(e.toString());
      apiResponse.haserror = true;
    }
    return apiResponse;
  }
}
