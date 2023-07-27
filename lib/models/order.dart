// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:boutique_merchant/models/address.dart';
import 'package:boutique_merchant/models/baseModel.dart';
import 'package:boutique_merchant/models/cart.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/merchant.dart';
import 'package:boutique_merchant/models/review.dart';
import 'package:boutique_merchant/models/userModel.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order extends BaseModel {
  String? id;
  String? paymentMode;
  num? totalAmount;
  num? taxAmount;
  num? discount;
  num? deliveryCharge;
  num? finalAmount;
  DateTime? dateCreated;
  String? merchantId;
  String? userId;
  String? addressId;
  String? orderStatus;
  Merchant? merchant;
  UserModel? user;
  Address? address;
  List<Review> reviews;
  List<Cart>? items;

  Order({
    this.id,
    this.paymentMode,
    this.totalAmount,
    this.taxAmount,
    this.discount,
    this.finalAmount,
    this.deliveryCharge,
    this.dateCreated,
    this.merchantId,
    this.orderStatus,
    this.userId,
    this.addressId,
    this.merchant,
    this.user,
    this.address,
    this.items,
    this.reviews=const [],
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    paymentMode: json["paymentMode"],
    totalAmount: json["totalAmount"],
    taxAmount: json["taxAmount"],
    discount: json["discount"],
    finalAmount: json["finalAmount"],
    dateCreated: json["dateCreated"] == null
        ? null
        : DateTime.parse(json["dateCreated"]),
    merchantId: json["merchantId"],
    userId: json["userId"],
    addressId: json["addressId"],
    merchant: json["merchant"] == null
        ? null
        : Merchant.fromJson(json["merchant"]),
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "paymentMode": paymentMode,
    "totalAmount": totalAmount,
    "taxAmount": taxAmount,
    "discount": discount,
    "finalAmount": finalAmount,
    "dateCreated":
    "${dateCreated!.year.toString().padLeft(4, '0')}-${dateCreated!.month.toString().padLeft(2, '0')}-${dateCreated!.day.toString().padLeft(2, '0')}",
    "merchantId": merchantId,
    "userId": userId,
    "addressId": addressId,
    "merchant": merchant?.toJson(),
    "user": user?.toJson(),
  };

  @override
  fromJson(json) => Order(
    id: json["id"],
    paymentMode: json["paymentMode"],
    totalAmount: json["totalAmount"],
    taxAmount: json["taxAmount"],
    discount: json["discount"],
    deliveryCharge: json["deliveryCharge"],
    finalAmount: json["finalAmount"],
    dateCreated: json["dateCreated"] == null
        ? null
        : DateTime.parse(json["dateCreated"]),
    merchantId: json["merchantId"],
    userId: json["userId"],
    addressId: json["addressId"],
    orderStatus: json["orderStatus"] ?? "Order Placed",
    merchant: json["merchant"] == null
        ? null
        : Merchant.fromJson(json["merchant"]),
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    address:
    json["address"] == null ? null : Address.fromJson(json["address"]),
    items: json["items"] == null
        ? null
        : List<Cart>.from(json["items"].map((x) => Cart.fromJson(x))),
    reviews: json["reviews"] == null
        ? []
        : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    // items: json["items"] == null ? null :  List<Cart>.from(json["items"].map((x) => Cart.fromJson(x))),
  );
}
