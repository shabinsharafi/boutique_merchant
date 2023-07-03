// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:boutique_merchant/models/merchant.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'baseModel.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse implements BaseModel{
  String? token;
  UserModel? user;
  Merchant? merchant;

  LoginResponse({
     this.token,
     this.user,
     this.merchant,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        user: UserModel.fromJson(json["user"]),
        merchant: Merchant.fromJson(json["merchant"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user!.toJson(),
        "merchant": merchant!.toJson(),
      };

  @override
  fromJson(dynamic json) => LoginResponse(
    token: json["token"],
    user: UserModel.fromJson(json["user"]),
    merchant: Merchant.fromJson(json["merchant"]),
  );
}
