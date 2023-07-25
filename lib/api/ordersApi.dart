import 'dart:convert';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/httpHandler.dart';
import 'package:boutique_merchant/logger.dart';
import 'package:boutique_merchant/models/AddItemFilter.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/order.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ListResponse.dart';

class OrdersApi {
  static OrdersApi? instance;

  static OrdersApi getInstance() {
    return instance ??= OrdersApi();
  }

  Future<ApiResponse<AddItemFilter>> getAddItemsFilter() async {
    ApiResponse<AddItemFilter> apiResponse = ApiResponse<AddItemFilter>();
    try {
      apiResponse = await HttpHandler.getRequest<AddItemFilter>(
          Utilities.baseUrl + "getAddItemsFilter", () => AddItemFilter());
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

  Future<ApiResponse<ListResponse<Order>>> getOrders(ownerId) async {
    ApiResponse<ListResponse<Order>> apiResponse = ApiResponse();
    try {
      apiResponse = await HttpHandler.getRequest<ListResponse<Order>>(
          Utilities.baseUrl + "getMerchantOrders/$ownerId",
          () => ListResponse<Order>(
                creator: () => Order(),
              ));
      if (apiResponse.success) {
        //apiResponse.data = List<Item>.from(apiResponse.data.map((x) => Item.fromJson(x)));
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse<ListResponse<Order>>> updateOrder(req,orderId) async {
    ApiResponse<ListResponse<Order>> apiResponse = ApiResponse();
    try {
      apiResponse = await HttpHandler.patchRequestToken<ListResponse<Order>>(
          Utilities.baseUrl + "updateOrder/$orderId",req,
          () => ListResponse<Order>(
                creator: () => Order(),
              ));
      if (apiResponse.success) {
        //apiResponse.data = List<Item>.from(apiResponse.data.map((x) => Item.fromJson(x)));
      }
    } catch (e) {
      print(e.toString());
      apiResponse.success = false;
    }
    return apiResponse;
  }

  Future<ApiResponse<Item>> addItem(req) async {
    ApiResponse<Item> apiResponse = ApiResponse();
    try {
      apiResponse = await HttpHandler.postRequestToken<Item>(
          Utilities.baseUrl + "addItem", req, () => Item());
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
