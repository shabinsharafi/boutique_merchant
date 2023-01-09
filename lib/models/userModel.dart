
import 'merchant.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.email,
    required this.dateCreated,
    this.merchant,
  });

  String id;
  String name;
  String phone;
  String image;
  String email;
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
}
