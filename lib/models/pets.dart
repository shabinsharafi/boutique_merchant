// To parse this JSON data, do
//
//     final pets = petsFromJson(jsonString);

import 'dart:convert';

import 'package:boutique_merchant/models/category.dart';
import 'package:boutique_merchant/models/userModel.dart';

Pets petsFromJson(String str) => Pets.fromJson(json.decode(str));

String petsToJson(Pets data) => json.encode(data.toJson());

class Pets {
  Pets({
    required this.id,
    required this.name,
    required this.age,
    required this.colors,
    required this.type,
    required this.description,
    required this.breed,
    required this.imagePath,
    required this.dateCreated,
    required this.categoryId,
    required this.ownerId,
    required this.category,
    required this.owner,
  });

  String id;
  String name;
  int age;
  List<String>? colors;
  int type;
  String description;
  String breed;
  List<String>? imagePath;
  String categoryId;
  String ownerId;
  DateTime? dateCreated;
  Category? category;
  UserModel? owner;

  factory Pets.fromJson(Map<String, dynamic> json) => Pets(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        colors: json["colors"] == null
            ? null
            : List<String>.from(json["colors"].map((x) => x)),
        type: json["type"],
        description: json["description"],
        breed: json["breed"],
        imagePath: json["imagePath"] == null
            ? null
            : List<String>.from(json["imagePath"].map((x) => x)),
        categoryId: json["categoryId"],
        ownerId: json["ownerId"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        dateCreated:
            json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
        owner: json["owner"] == null ? null : UserModel.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        if (colors != null) "colors": List<String>.from(colors!.map((x) => x)),
        "type": type,
        "description": description,
        "breed": breed,
        if (dateCreated != null) "dateCreated": dateCreated!.toIso8601String(),
        if (imagePath != null)
          "imagePath": List<String>.from(imagePath!.map((x) => x)),
        "categoryId": categoryId,
        "ownerId": ownerId,
      };
}
