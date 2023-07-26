// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'dart:convert';

import 'package:boutique_merchant/models/baseModel.dart';
import 'package:boutique_merchant/models/userModel.dart';

class Review extends BaseModel{
  String? id;
  int? rating;
  String? review;
  DateTime? dateCreated;
  String? merchantId;
  String? userId;
  String? itemId;
  String? orderId;
  UserModel? user;

  Review({
    this.id,
    this.rating,
    this.review,
    this.dateCreated,
    this.merchantId,
    this.userId,
    this.itemId,
    this.orderId,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    rating: json["rating"],
    review: json["review"],
    dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
    merchantId: json["merchantId"],
    userId: json["userId"],
    itemId: json["itemId"],
    orderId: json["orderId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rating": rating,
    "review": review,
    "dateCreated": "${dateCreated!.year.toString().padLeft(4, '0')}-${dateCreated!.month.toString().padLeft(2, '0')}-${dateCreated!.day.toString().padLeft(2, '0')}",
    "merchantId": merchantId,
    "userId": userId,
    "itemId": itemId,
    "orderId": orderId,
  };

  @override
  fromJson(json)  => Review(
    id: json["id"],
    rating: json["rating"],
    review: json["review"],
    dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    merchantId: json["merchantId"],
    userId: json["userId"],
    itemId: json["itemId"],
    orderId: json["orderId"],
  );
}
