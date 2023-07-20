import 'dart:convert';

import 'baseModel.dart';

Favourite favouriteFromJson(String str) => Favourite.fromJson(json.decode(str));

String favouriteToJson(Favourite data) => json.encode(data.toJson());

class Favourite extends BaseModel {
  Favourite({
    this.id,
    this.itemId,
    this.userId,
  });

  String? id;
  String? itemId;
  String? userId;

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        id: json["id"] == null ? null : json["id"],
        itemId: json["itemId"] == null ? null : json["itemId"],
        userId: json["userId"] == null ? null : json["userId"],
      );

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,
        "itemId": itemId == null ? null : itemId,
        "userId": userId == null ? null : userId,
      };

  @override
  fromJson(dynamic json) => Favourite(
        id: json["id"] == null ? null : json["id"],
        itemId: json["itemId"] == null ? null : json["itemId"],
        userId: json["userId"] == null ? null : json["userId"],
      );
}
