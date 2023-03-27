class Category {
  Category({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.image,
    required this.dateCreated,
  });

  String id;
  String ownerId;
  String name;
  String image;
  DateTime dateCreated;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    ownerId: json["ownerId"],
    name: json["name"],
    image: json["image"],
    dateCreated: json["dateCreated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ownerId": ownerId,
    "name": name,
    "image": image,
    "dateCreated": dateCreated,
  };
}
