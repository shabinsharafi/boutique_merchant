// To parse this JSON data, do
//
//     final addItemFilter = addItemFilterFromJson(jsonString);

import 'dart:convert';

import 'package:boutique_merchant/models/baseModel.dart';
import 'package:boutique_merchant/models/category.dart';

AddItemFilter addItemFilterFromJson(String str) => AddItemFilter.fromJson(json.decode(str));

String addItemFilterToJson(AddItemFilter data) => json.encode(data.toJson());

class AddItemFilter extends BaseModel{
  AddItemFilter({
     this.category,
     this.materialType,
     this.itemStatus,
  });

  List<Category>? category;
  List<Category>? materialType;
  List<Category>? itemStatus;


  factory AddItemFilter.fromJson(Map<String, dynamic> json) => AddItemFilter(
    category: json["category"] == null ? [] : List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    materialType: json["materialType"] == null ? [] : List<Category>.from(json["materialType"].map((x) => Category.fromJson(x))),
    itemStatus: json["itemStatus"] == null ? [] : List<Category>.from(json["itemStatus"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toJson())),
    "materialType": materialType == null ? [] : List<dynamic>.from(materialType!.map((x) => x.toJson())),
    "itemStatus": itemStatus == null ? [] : List<dynamic>.from(itemStatus!.map((x) => x.toJson())),
  };

  @override
  fromJson(dynamic json) {
    return AddItemFilter(
      category: json["category"] == null ? [] : List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
      materialType: json["materialType"] == null ? [] : List<Category>.from(json["materialType"].map((x) => Category.fromJson(x))),
      itemStatus: json["itemStatus"] == null ? [] : List<Category>.from(json["itemStatus"].map((x) => Category.fromJson(x))),
    );
  }
}


