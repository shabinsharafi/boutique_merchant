import 'dart:convert';

import 'baseModel.dart';

Favourite favouriteFromJson(String str) => Favourite.fromJson(json.decode(str));

String favouriteToJson(Favourite data) => json.encode(data.toJson());

class Favourite extends BaseModel {
  Favourite({
    this.id,
    this.petId,
    this.userId,
  });

  String? id;
  String? petId;
  String? userId;

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        id: json["id"] == null ? null : json["id"],
        petId: json["petId"] == null ? null : json["petId"],
        userId: json["userId"] == null ? null : json["userId"],
      );

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,
        "petId": petId == null ? null : petId,
        "userId": userId == null ? null : userId,
      };

  @override
  fromJson(dynamic json) => Favourite(
        id: json["id"] == null ? null : json["id"],
        petId: json["petId"] == null ? null : json["petId"],
        userId: json["userId"] == null ? null : json["userId"],
      );
}
