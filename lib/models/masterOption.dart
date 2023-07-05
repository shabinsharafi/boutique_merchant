import 'baseModel.dart';

class MasterOption extends BaseModel {
  MasterOption({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory MasterOption.fromJson(Map<String, dynamic> json) => MasterOption(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  fromJson(dynamic json) => MasterOption(
        id: json["id"],
        name: json["name"],
      );
}
