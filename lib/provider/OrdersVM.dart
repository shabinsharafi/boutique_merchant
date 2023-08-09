import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/itemsApi.dart';
import 'package:boutique_merchant/api/ordersApi.dart';
import 'package:boutique_merchant/api/userApi.dart';
import 'package:boutique_merchant/constants/constants.dart';
import 'package:boutique_merchant/models/ListResponse.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/ui/authScreen/verify_otp_screen.dart';
import 'package:boutique_merchant/provider/userProvider.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/general/commonAlertDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../api/boutiqueApi.dart';
import '../models/order.dart';

class OrdersProvider with ChangeNotifier {
  ApiResponse? addItemResponse;
  ApiResponse<ListResponse<Order>>? ordersResponse;
  ApiResponse<Order>? orderDetailsResponse;

  bool isOrderDetailsLoading = false;
  bool isLoginLoading = false;
  bool isVerifyOtpLoading = false;

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  void getOrders() async {
    isLoginLoading = true;
    notifyListeners();
    var boutiqueId;
    await SharedPreferences.getInstance().then((value) {
      boutiqueId = value.getString("boutiqueId");
    });
    ordersResponse = await OrdersApi.getInstance().getOrders(boutiqueId);
    isLoginLoading = false;
    if (ordersResponse!.success) {
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: ordersResponse!.message!,
      ));
    }
    notifyListeners();
  }

  void getOrderDetails(id) async {
    isOrderDetailsLoading = true;
    notifyListeners();
    orderDetailsResponse = await OrdersApi.getInstance().getOrderDetails(id);
    isOrderDetailsLoading = false;
    if (orderDetailsResponse!.success) {
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: orderDetailsResponse!.message!,
      ));
    }
    notifyListeners();
  }

  void updateOrder(orderId,OrderStatus status) async {
    isLoginLoading = true;
    notifyListeners();
    Map<String, String> req = {};
    req.putIfAbsent("orderStatus", () => status.name);
    var ordersUpdateResponse = await OrdersApi.getInstance().updateOrder(req,orderId);
    isLoginLoading = false;
    if (ordersUpdateResponse!.success) {
      orderDetailsResponse?.data?.orderStatus=status.name
      ;
      ordersResponse?.data?.items?.firstWhere((element) => element.id==orderId).orderStatus=status.name;
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: ordersUpdateResponse!.message!,
      ));
    }
    notifyListeners();
  }
}
