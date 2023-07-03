import 'dart:convert';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/httpHandler.dart';
import 'package:boutique_merchant/logger.dart';
import 'package:boutique_merchant/models/AddItemFilter.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
}
