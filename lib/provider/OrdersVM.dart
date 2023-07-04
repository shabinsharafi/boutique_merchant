import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/itemsApi.dart';
import 'package:boutique_merchant/api/ordersApi.dart';
import 'package:boutique_merchant/api/userApi.dart';
import 'package:boutique_merchant/models/ListResponse.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/ui/authScreen/verify_otp_screen.dart';
import 'package:boutique_merchant/ui/registration/userRegistrationVM.dart';
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
  bool isLoginLoading = false;
  bool isVerifyOtpLoading = false;

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;


  void getItems() async {
    isLoginLoading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("id");
    });
    Map<String, String> req = {};
    req.putIfAbsent("ownerId", () => regId);
    ordersResponse = await OrdersApi.getInstance().getOrders(regId);
    isLoginLoading = false;
    if (ordersResponse!.success) {

    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: ordersResponse!.message!,
      ));
    }
    notifyListeners();
  }
}
