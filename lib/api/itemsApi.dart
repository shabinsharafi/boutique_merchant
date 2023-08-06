import 'dart:convert';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/httpHandler.dart';
import 'package:boutique_merchant/logger.dart';
import 'package:boutique_merchant/models/AddItemFilter.dart';
import 'package:boutique_merchant/models/itemImage.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/review.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/ListResponse.dart';

class ItemsApi {
  static ItemsApi? instance;

  static ItemsApi getInstance() {
    return instance ??= ItemsApi();
  }

  Future<ApiResponse<AddItemFilter>> getAddItemsFilter() async {
    ApiResponse<AddItemFilter> apiResponse = ApiResponse<AddItemFilter>();
    try {
      apiResponse =
          await HttpHandler.getRequest<AddItemFilter>(Utilities.baseUrl + "getAddItemsFilter",() => AddItemFilter());
      print(apiResponse);
      if (apiResponse.success) {
        //apiResponse.data = AddItemFilter.fromJson(apiResponse.data);
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse<ListResponse<Item>>> getItems(ownerId) async {
    ApiResponse<ListResponse<Item>> apiResponse = ApiResponse();
    try {
      apiResponse =
          await HttpHandler.getRequest<ListResponse<Item>>(Utilities.baseUrl + "getItemsByMerchants/$ownerId",() => ListResponse<Item>(creator: () => Item(),));
      if (apiResponse.success) {
        //apiResponse.data = List<Item>.from(apiResponse.data.map((x) => Item.fromJson(x)));
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse<ListResponse<Review>>> getReviews(itemId) async {
    ApiResponse<ListResponse<Review>> apiResponse = ApiResponse();
    try {
      apiResponse =
      await HttpHandler.getRequest<ListResponse<Review>>(Utilities.baseUrl + "getItemReviews/$itemId",() => ListResponse<Review>(creator: () => Review(),));

    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse<Item>> addItem(req) async {
    ApiResponse<Item> apiResponse = ApiResponse();
    try {
      apiResponse =
          await HttpHandler.postRequestToken<Item>(Utilities.baseUrl + "addItem",req,() =>  Item());
      if (apiResponse.success) {
        //apiResponse.data = List<Item>.from(apiResponse.data.map((x) => Item.fromJson(x)));
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse<Item>> updateItem(req,id) async {
    ApiResponse<Item> apiResponse = ApiResponse();
    try {
      apiResponse =
          await HttpHandler.patchRequestToken<Item>(Utilities.baseUrl + "updateItem/$id",req,() =>  Item());
      if (apiResponse.success) {
        //apiResponse.data = List<Item>.from(apiResponse.data.map((x) => Item.fromJson(x)));
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }
  Future<ApiResponse<ListResponse<ItemImage>>> uploadImage(id,index,path) async {
    ApiResponse<ListResponse<ItemImage>> apiResponse = ApiResponse<ListResponse<ItemImage>>();

    var multipartFile = await http.MultipartFile.fromPath(
        'main_image', path);
    try {
      apiResponse =
          await HttpHandler.uploadImage<ListResponse<ItemImage>>(Utilities.baseUrl + "itemImage/upload/$id/$index",multipartFile,() => ListResponse<ItemImage>(creator: () => ItemImage(),));
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  deleteImage(req) {}
}
