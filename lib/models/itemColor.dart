import 'baseModel.dart';

class ItemColor extends BaseModel {
  ItemColor({
    this.id,
    this.name,
    this.color,
    this.dateCreated,
  });

  String? id;
  String? name;
  String? color;
  DateTime? dateCreated;

  factory ItemColor.fromJson(Map<String, dynamic> json) => ItemColor(
        id: json["id"],
        name: json["name"],
        color: json["image"],
    dateCreated: json["dateCreated"]!=null?DateTime.parse(json["dateCreated"]):json["dateCreated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": color,
        "dateCreated": dateCreated,
      };

  @override
  fromJson(dynamic json) => ItemColor(
        id: json["id"],
        name: json["name"],
        color: json["image"],
        dateCreated: json["dateCreated"],
      );
}
