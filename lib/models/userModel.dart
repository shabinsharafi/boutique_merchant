
class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.profileImage,
    required this.email,
    required this.dateCreated,
  });

  String id;
  String name;
  String phone;
  String profileImage;
  String email;
  DateTime? dateCreated;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"]??'',
        phone: json["phone"]??'',
        profileImage: json["profileImage"]??'',
        email: json["email"]??'',
        dateCreated:
            json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "profileImage": profileImage,
        "email": email,
        if (dateCreated != null) "dateCreated": dateCreated!.toIso8601String(),
      };
}
