class Merchant {
  Merchant({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.email,
    required this.ownerId,
    required this.dateCreated,
    this.merchant,
  });

  String id;
  String name;
  String phone;
  String image;
  String email;
  String ownerId;
  DateTime? dateCreated;
  Map? merchant;

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
}
