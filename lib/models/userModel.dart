
import 'package:boutique_merchant/models/baseModel.dart';

import 'merchant.dart';

class UserModel extends BaseModel{
  UserModel({
     this.id,
     this.name,
     this.phone,
     this.image,
     this.email,
     this.dateCreated,
    this.merchant,
  });

  String? id;
  String? name;
  String? phone;
  String? image;
  String? email;
  DateTime? dateCreated;
  Merchant? merchant;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"]??'',
        phone: json["phone"]??'',
        image: json["image"]??'',
        email: json["email"]??'',
        dateCreated:
            json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
    merchant:
            json["merchant"] == null ? null : Merchant.fromJson(json["merchant"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "image": image,
        "email": email,
        if (dateCreated != null) "dateCreated": dateCreated!.toIso8601String(),
      };

  @override
  fromJson(Map<String, dynamic> json)  => UserModel(
    id: json["id"],
    name: json["name"]??'',
    phone: json["phone"]??'',
    image: json["image"]??'',
    email: json["email"]??'',
    dateCreated:
    json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
    merchant:
    json["merchant"] == null ? null : Merchant.fromJson(json["merchant"]),
  );
}
