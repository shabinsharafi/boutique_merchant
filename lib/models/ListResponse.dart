// To parse this JSON data, do
//
//     final addItemFilter = addItemFilterFromJson(jsonString);

import 'dart:convert';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/models/baseModel.dart';
import 'package:boutique_merchant/models/category.dart';

class ListResponse<T extends BaseModel> extends BaseModel{
  ListResponse({
     this.items,
    this.creator
  });
  ItemCreator<T>? creator;
  List<T>? items;

  @override
  fromJson(dynamic json) {
    T t=creator!();
    return ListResponse<T>(
      items: json == null ? [] : List<T>.from(json.map((x) => t.fromJson(x))),
    );
  }
}


