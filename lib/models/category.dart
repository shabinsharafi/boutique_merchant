import 'baseModel.dart';

class Category extends BaseModel {
  Category({
    this.id,
    this.name,
    this.image,
    this.dateCreated,
  });

  String? id;
  String? name;
  String? image;
  DateTime? dateCreated;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        dateCreated: json["dateCreated"]!=null?DateTime.parse(json["dateCreated"]):json["dateCreated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "dateCreated": dateCreated,
      };

  @override
  fromJson(dynamic json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        dateCreated: json["dateCreated"],
      );
}
