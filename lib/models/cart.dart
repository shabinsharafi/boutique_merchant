import 'package:boutique_merchant/models/items.dart';

import 'baseModel.dart';

class Cart extends BaseModel {
  Cart({
    this.id,
    this.itemId,
    this.userId,
    this.item,
    this.quantity=1,
    this.dateCreated,
  });

  String? id;
  String? itemId;
  String? userId;
  int quantity;
  Item? item;
  DateTime? dateCreated;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        itemId: json["name"],
        userId: json["image"],
        quantity: json["quantity"]??1,
        dateCreated: json["dateCreated"] != null
            ? DateTime.parse(json["dateCreated"])
            : json["dateCreated"],
        item: json["item"] != null ? Item.fromJson(json["item"]) : json["item"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": itemId,
        "image": userId,
        "dateCreated": dateCreated,
      };

  @override
  fromJson(dynamic json) {
    return Cart(
      id: json["id"],
      itemId: json["itemId"],
      userId: json["image"],
      quantity: json["quantity"]??1 ,
      item: json["item"] != null ? Item.fromJson(json["item"]) : null,
      dateCreated: json["dateCreated"] != null
          ? DateTime.parse(json["dateCreated"])
          : json["dateCreated"],
    );
  }
}
