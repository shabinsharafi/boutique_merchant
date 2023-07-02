// To parse this JSON data, do
//
//     final addItemFilter = addItemFilterFromJson(jsonString);

import 'dart:convert';

import 'package:boutique_merchant/models/baseModel.dart';
import 'package:boutique_merchant/models/category.dart';

class ListResponse<T> extends BaseModel{
  ListResponse({
     this.category,
  });

  List<Category>? category;

  @override
  fromJson(Map<String, dynamic> json) {
    print(json);
    return ListResponse(
      category: json["category"] == null ? [] : List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    );
  }
}


