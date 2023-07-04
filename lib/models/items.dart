import 'dart:convert';

import 'package:boutique_merchant/models/baseModel.dart';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item extends BaseModel{
  String? name;
  String? id;
  List<String>? colors;
  String? materialType;
  bool isStockAvailable;
  String? itemStatus;
  String? description;
  List<String>? images;
  DateTime? dateCreated;
  String? merchantId;
  String? categoryId;
  double? mrp;
  double? price;

  Item({
     this.name,
     this.id,
     this.colors,
     this.materialType,
     this.isStockAvailable=false,
     this.itemStatus,
     this.description,
     this.images,
     this.dateCreated,
     this.merchantId,
     this.categoryId,
     this.mrp,
     this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    id: json["id"],
    colors: List<String>.from(json["colors"].map((x) => x)),
    materialType: json["materialType"],
    isStockAvailable: json["isStockAvailable"],
    itemStatus: json["itemStatus"],
    description: json["description"],
    mrp: json["mrp"]??15.23,
    price: json["price"]??10.50,
    images: List<String>.from(json["images"].map((x) => x)),
    dateCreated: DateTime.parse(json["dateCreated"]),
    merchantId: json["merchantId"],
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "colors": List<dynamic>.from(colors!.map((x) => x)),
    "materialType": materialType,
    "isStockAvailable": isStockAvailable,
    "itemStatus": itemStatus,
    "description": description,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "dateCreated": dateCreated!.toIso8601String(),
    "merchantId": merchantId,
    "categoryId": categoryId,
  };

  @override
  fromJson(dynamic json) => Item(
    name: json["name"],
    id: json["id"],
    colors: List<String>.from(json["colors"].map((x) => x)),
    materialType: json["materialType"],
    isStockAvailable: json["isStockAvailable"],
    itemStatus: json["itemStatus"],
    description: json["description"],
    mrp: json["mrp"]??15.23,
    price: json["price"]??10.50,
    images: List<String>.from(json["images"].map((x) => x)),
    dateCreated: DateTime.parse(json["dateCreated"]),
    merchantId: json["merchantId"],
    categoryId: json["categoryId"],
  );
}
