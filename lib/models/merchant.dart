import 'baseModel.dart';

class Merchant extends BaseModel{
  Merchant({
     this.id,
     this.name,
     this.phone,
     this.image,
     this.email,
     this.ownerId,
     this.dateCreated,
  });

  String? id;
  String? name;
  String? phone;
  String? image;
  String? email;
  String? ownerId;
  DateTime? dateCreated;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        id: json["id"],
        name: json["name"] ?? '',
        phone: json["phone"] ?? '',
        image: json["image"] ?? '',
        email: json["email"] ?? '',
        ownerId: json["ownerId"] ?? '',
        dateCreated: json["dateCreated"] == null
            ? null
            : DateTime.parse(json["dateCreated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "image": image,
        "email": email,
        "ownerId": ownerId,
        if (dateCreated != null) "dateCreated": dateCreated!.toIso8601String(),
      };

  @override
  fromJson(dynamic json) => Merchant(
    id: json["id"],
    name: json["name"] ?? '',
    phone: json["phone"] ?? '',
    image: json["image"] ?? '',
    email: json["email"] ?? '',
    ownerId: json["ownerId"] ?? '',
    dateCreated: json["dateCreated"] == null
        ? null
        : DateTime.parse(json["dateCreated"]),
  );
}
