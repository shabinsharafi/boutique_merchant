import 'dart:convert';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/httpHandler.dart';
import 'package:boutique_merchant/logger.dart';
import 'package:boutique_merchant/models/LoginResponse.dart';
import 'package:boutique_merchant/models/merchant.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BoutiqueApi {
  static BoutiqueApi? instance;

  static BoutiqueApi getInstance() {
    return instance ??= BoutiqueApi();
  }

  Future<ApiResponse<Merchant>> addBoutique(Map<String, dynamic> request) async {
    ApiResponse<Merchant> apiResponse = ApiResponse();
    try {
      apiResponse = await HttpHandler.postRequestToken<Merchant>(
          Utilities.baseUrl + "addMerchant", request,() => Merchant());
      if (apiResponse.success) {
        //apiResponse.data = Merchant.fromJson(apiResponse.data);
      }
    } catch (e) {
      debugPrint(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }
  Future<ApiResponse<Merchant>> updateBoutique(Map<String, dynamic> request,id) async {
    ApiResponse<Merchant> apiResponse = ApiResponse();
    try {
      apiResponse = await HttpHandler.patchRequestToken<Merchant>(
          Utilities.baseUrl + "updateMerchant/$id", request,() => Merchant());
      if (apiResponse.success) {
        //apiResponse.data = Merchant.fromJson(apiResponse.data);
      }
    } catch (e) {
      debugPrint(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse<Merchant>> uploadImage(id,path) async {
    ApiResponse<Merchant> apiResponse = ApiResponse<Merchant>();

    var multipartFile = await http.MultipartFile.fromPath(
        'main_image', path);
    try {
      apiResponse =
      await HttpHandler.uploadImage<Merchant>(Utilities.baseUrl + "profileImage/upload/$id",multipartFile,() => Merchant());
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }
/*
  Future<ApiResponse<Merchant>> deleteImage(req) async {
    ApiResponse<Merchant> apiResponse = ApiResponse<Item>();

    try {
      apiResponse =
      await HttpHandler.uploadImage<Merchant>(Utilities.baseUrl + "deleteItemImage",req,() => Merchant(),);
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }*/

}
