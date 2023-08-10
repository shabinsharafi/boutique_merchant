// To parse this JSON data, do
//


import 'package:boutique_merchant/models/baseModel.dart';

class BoutiqueDash  extends BaseModel {
  int? newOrders;
  int? inProgressOrders;
  int? completedOrders;
  int? totalOrders;
  double? totalSales;

  BoutiqueDash({
    this.newOrders,
    this.inProgressOrders,
    this.completedOrders,
    this.totalOrders,
    this.totalSales,
  });

  factory BoutiqueDash.fromJson(Map<String, dynamic> json) => BoutiqueDash(
    newOrders: json["newOrders"],
    inProgressOrders: json["inProgressOrders"],
    completedOrders: json["completedOrders"],
    totalOrders: json["totalOrders"],
    totalSales: json["totalSales"]?.toDouble(),
  );

  @override
  fromJson(dynamic json) => BoutiqueDash(
    newOrders: json["newOrders"],
    inProgressOrders: json["inProgressOrders"],
    completedOrders: json["completedOrders"],
    totalOrders: json["totalOrders"],
    totalSales: json["totalSales"],
  );

  Map<String, dynamic> toJson() => {
    "newOrders": newOrders,
    "inProgressOrders": inProgressOrders,
    "completedOrders": completedOrders,
    "totalOrders": totalOrders,
    "totalSales": totalSales,
  };
}
