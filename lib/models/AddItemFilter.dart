// To parse this JSON data, do
//
//     final addItemFilter = addItemFilterFromJson(jsonString);

import 'package:boutique_merchant/models/category.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

AddItemFilter addItemFilterFromJson(String str) => AddItemFilter.fromJson(json.decode(str));

String addItemFilterToJson(AddItemFilter data) => json.encode(data.toJson());

class AddItemFilter {
  AddItemFilter({
    required this.category,
    required this.materialType,
    required this.itemStatus,
  });

  List<Category> category;
  List<ItemStatus> materialType;
  List<ItemStatus> itemStatus;

  factory AddItemFilter.fromJson(Map<String, dynamic> json) => AddItemFilter(
    category: json["category"] == null ? [] : List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    materialType: json["materialType"] == null ? [] : List<ItemStatus>.from(json["materialType"].map((x) => ItemStatus.fromJson(x))),
    itemStatus: json["itemStatus"] == null ? [] : List<ItemStatus>.from(json["itemStatus"].map((x) => ItemStatus.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? [] : List<dynamic>.from(category.map((x) => x.toJson())),
    "materialType": materialType == null ? [] : List<dynamic>.from(materialType.map((x) => x.toJson())),
    "itemStatus": itemStatus == null ? [] : List<dynamic>.from(itemStatus.map((x) => x.toJson())),
  };
}


class ItemStatus {
  ItemStatus({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory ItemStatus.fromJson(Map<String, dynamic> json) => ItemStatus(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
