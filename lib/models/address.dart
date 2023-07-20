
import 'package:boutique_merchant/models/baseModel.dart';

class Address extends BaseModel{
  String? id;
  String? name;
  String? address;
  String? pincode;
  String? mobile;
  DateTime? dateCreated;
  String? userId;

  Address({
    this.id,
    this.name,
    this.address,
    this.pincode,
    this.mobile,
    this.dateCreated,
    this.userId,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    pincode: json["pincode"],
    mobile: json["mobile"],
    dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "pincode": pincode,
    "mobile": mobile,
    "dateCreated": "${dateCreated!.year.toString().padLeft(4, '0')}-${dateCreated!.month.toString().padLeft(2, '0')}-${dateCreated!.day.toString().padLeft(2, '0')}",
    "userId": userId,
  };

  @override
  fromJson(json) => Address(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    pincode: json["pincode"],
    mobile: json["mobile"],
    dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
    userId: json["userId"],
  );
}
