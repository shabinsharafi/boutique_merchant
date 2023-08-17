// To parse this JSON data, do
//


import 'package:boutique_merchant/models/baseModel.dart';

class BoutiqueDash  extends BaseModel {
  int newOrders;
  int inProgressOrders;
  int completedOrders;
  int totalOrders;
  double? totalSales;

  BoutiqueDash({
    this.newOrders=0,
    this.inProgressOrders=0,
    this.completedOrders=0,
    this.totalOrders=0,
    this.totalSales,
  });

  factory BoutiqueDash.fromJson(Map<String, dynamic> json) => BoutiqueDash(
    newOrders: json["newOrders"]??0,
    inProgressOrders: json["inProgressOrders"]??0,
    completedOrders: json["completedOrders"]??0,
    totalOrders: json["totalOrders"]??0,
    totalSales: (json["totalSales"]??0).toDouble(),
  );

  @override
  fromJson(dynamic json) => BoutiqueDash(
    newOrders: json["newOrders"]??0,
    inProgressOrders: json["inProgressOrders"]??0,
    completedOrders: json["completedOrders"]??0,
    totalOrders: json["totalOrders"]??0,
    totalSales: (json["totalSales"]??0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "newOrders": newOrders,
    "inProgressOrders": inProgressOrders,
    "completedOrders": completedOrders,
    "totalOrders": totalOrders,
    "totalSales": totalSales,
  };
}
