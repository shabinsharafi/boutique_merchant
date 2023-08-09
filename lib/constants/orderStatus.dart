import 'package:boutique_merchant/utils/extension.dart';

enum OrderStatus{
  ORDER_PLACED,
  ORDER_ACCEPTED,
  ORDER_REJECTED,
  ORDER_CANCELED,
  ORDER_CANCEL_REQUESTED,
  CANCEL_REQUEST_ACCEPTED,
  CANCEL_REQUEST_REJECTED,
  PREPARING_ORDER,
  IN_TRANSIST,
  DELIVERED,
}

extension OrderStatusExt on OrderStatus{
  String get value {
    return name.replaceAll("_", " ")[0].capitalize();
  }
  OrderStatus get(String name) {
    return OrderStatus.values.firstWhere((element) => name==element.name,orElse: () => OrderStatus.ORDER_PLACED,);
  }
}