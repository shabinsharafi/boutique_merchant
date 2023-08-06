import 'baseModel.dart';

class ItemImage extends BaseModel {
  ItemImage({
    this.id,
    this.name,
    this.url,
    this.dateCreated,
  });

  String? id;
  String? name;
  String? url;
  DateTime? dateCreated;

  factory ItemImage.fromJson(Map<String, dynamic> json) => ItemImage(
        id: json["id"],
        name: json["name"],
        url: json["url"],
    dateCreated: json["dateCreated"]!=null?DateTime.parse(json["dateCreated"]):json["dateCreated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": url,
        "dateCreated": dateCreated,
      };

  @override
  fromJson(dynamic json) => ItemImage(
        id: json["id"],
        name: json["name"],
        url: json["url"],
    dateCreated: json["dateCreated"]!=null?DateTime.parse(json["dateCreated"]):json["dateCreated"],
      );
}
