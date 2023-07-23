import 'dart:convert';

import 'package:boutique_merchant/models/baseModel.dart';
import 'package:boutique_merchant/models/category.dart';
import 'package:boutique_merchant/models/favourite.dart';
import 'package:boutique_merchant/models/itemColor.dart';
import 'package:boutique_merchant/models/masterOption.dart';
import 'package:boutique_merchant/models/merchant.dart';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item extends BaseModel{
  String? name;
  String? id;
  List<ItemColor>? colors;
  List<Category>? occasions;
  bool isStockAvailable;
  String? description;
  List<String>? images;
  DateTime? dateCreated;
  String? merchantId;
  String? categoryId;
  num mrp;
  num price;
  Merchant? merchant;
  Category? category;
  MasterOption? itemStatus;
  MasterOption? materialType;
  List<Favourite>? favourites;

  Item({
    this.name,
    this.id,
    this.colors,
    this.occasions,
    this.materialType,
    this.isStockAvailable=false,
    this.itemStatus,
    this.description,
    this.images,
    this.dateCreated,
    this.merchantId,
    this.categoryId,
    this.mrp=0,
    this.price=0,
    this.category,
    this.merchant,
    this.favourites,
  });

  Item.dummy({
    this.name="",
    this.id="",
    this.colors=const [],
    this.occasions=const [],
    this.materialType,
    this.isStockAvailable=false,
    this.itemStatus,
    this.description="",
    this.images=const [],
    this.dateCreated,
    this.merchantId="",
    this.categoryId="",
    this.mrp=0,
    this.price=0,
    this.merchant,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    id: json["id"],
    colors: json["colors"]!=null?List<ItemColor>.from(json["colors"].map((x) => ItemColor.fromJson(x))):[],
    occasions: json["occasions"]!=null?List<Category>.from(json["occasions"].map((x) => Category.fromJson(x))):null,
    materialType:  json["materialType"]!=null?MasterOption.fromJson(json["materialType"]):null,
    itemStatus:  json["itemStatus"]!=null?MasterOption.fromJson(json["itemStatus"]):null,
    isStockAvailable: json["isStockAvailable"],
    description: json["description"],
    mrp: json["mrp"]??15.23,
    price: json["price"]??10.50,
    images: List<String>.from(json["images"].map((x) => x)),
    dateCreated: DateTime.parse(json["dateCreated"]),
    merchantId: json["merchantId"],
    categoryId: json["categoryId"],
    merchant: json["merchant"]!=null?Merchant.fromJson(json["merchant"]):null,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "colors": List<String>.from(colors!.map((x) => x)),
    "materialType": materialType,
    "isStockAvailable": isStockAvailable,
    "itemStatus": itemStatus,
    "description": description,
    "images": List<String>.from(images!.map((x) => x)),
    "dateCreated": dateCreated!.toIso8601String(),
    "merchantId": merchantId,
    "categoryId": categoryId,
  };

  @override
  fromJson(dynamic json) {
    print(json);
    return Item(
      name: json["name"],
      id: json["id"],
      colors: json["colors"]!=null?List<ItemColor>.from(json["colors"].map((x) => ItemColor.fromJson(x))):[],
      occasions: json["occasions"]!=null?List<Category>.from(json["occasions"].map((x) => Category.fromJson(x))):null,
      favourites: json["favourites"]!=null?List<Favourite>.from(json["favourites"].map((x) => Favourite.fromJson(x))):null,
      materialType:  json["materialType"]!=null?MasterOption.fromJson(json["materialType"]):null,
      itemStatus:  json["itemStatus"]!=null?MasterOption.fromJson(json["itemStatus"]):null,
      isStockAvailable: json["isStockAvailable"],
      description: json["description"],
      mrp: json["mrp"]??15.23,
      price: json["price"]??10.50,
      images: json["images"]!=null?List<String>.from(json["images"].map((x) => x)):null,
      dateCreated: DateTime.parse(json["dateCreated"]),
      merchantId: json["merchantId"],
      categoryId: json["categoryId"],
      merchant:  json["merchant"]!=null?Merchant.fromJson(json["merchant"]):null,
      category:  json["category"]!=null?Category.fromJson(json["category"]):null,
    );
  }
}
