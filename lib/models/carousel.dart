import 'baseModel.dart';

class Carousel extends BaseModel {
  Carousel({
    this.id,
    this.image,
    this.path,
    this.dateCreated,
  });

  String? id;
  String? image;
  String? path;
  DateTime? dateCreated;

  factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
        id: json["id"],
        image: json["image"],
        path: json["path"],
    dateCreated: json["dateCreated"]!=null?DateTime.parse(json["dateCreated"]):json["dateCreated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "path": path,
        "dateCreated": dateCreated,
      };

  @override
  fromJson(dynamic json) => Carousel(
        id: json["id"],
        image: json["image"],
        path: json["path"],
    dateCreated: json["dateCreated"]!=null?DateTime.parse(json["dateCreated"]):json["dateCreated"],
      );
}
