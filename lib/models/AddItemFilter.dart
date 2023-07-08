// To parse this JSON data, do
//
//     final addItemFilter = addItemFilterFromJson(jsonString);

import 'dart:convert';

import 'package:boutique_merchant/models/baseModel.dart';
import 'package:boutique_merchant/models/category.dart';
import 'package:boutique_merchant/models/itemColor.dart';
import 'package:boutique_merchant/models/masterOption.dart';

AddItemFilter addItemFilterFromJson(String str) => AddItemFilter.fromJson(json.decode(str));

String addItemFilterToJson(AddItemFilter data) => json.encode(data.toJson());

class AddItemFilter extends BaseModel{
  AddItemFilter({
     this.category,
     this.materialType,
     this.itemStatus,
     this.occasion,
     this.color,
  });

  List<Category>? category;
  List<MasterOption>? materialType;
  List<MasterOption>? itemStatus;
  List<Category>? occasion;
  List<ItemColor>? color;


  factory AddItemFilter.fromJson(Map<String, dynamic> json) => AddItemFilter(
    category: json["category"] == null ? [] : List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    materialType: json["materialType"] == null ? [] : List<MasterOption>.from(json["materialType"].map((x) => MasterOption.fromJson(x))),
    itemStatus: json["itemStatus"] == null ? [] : List<MasterOption>.from(json["itemStatus"].map((x) => MasterOption.fromJson(x))),
    occasion: json["occasion"] == null ? [] : List<Category>.from(json["occasion"].map((x) => Category.fromJson(x))),
    color: json["color"] == null ? [] : List<ItemColor>.from(json["color"].map((x) => ItemColor.fromJson(x))),
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
      materialType: json["materialType"] == null ? [] : List<MasterOption>.from(json["materialType"].map((x) => MasterOption.fromJson(x))),
      itemStatus: json["itemStatus"] == null ? [] : List<MasterOption>.from(json["itemStatus"].map((x) => MasterOption.fromJson(x))),
      occasion: json["occasion"] == null ? [] : List<Category>.from(json["occasion"].map((x) => Category.fromJson(x))),
      color: json["color"] == null ? [] : List<ItemColor>.from(json["color"].map((x) => ItemColor.fromJson(x))),
    );
  }
}


