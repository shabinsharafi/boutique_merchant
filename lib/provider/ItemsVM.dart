import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/itemsApi.dart';
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

class ItemsProvider with ChangeNotifier {
  ApiResponse? addItemResponse;
  ApiResponse<ListResponse<Item>>? itemsResponse;
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
    itemsResponse = await ItemsApi.getInstance().getItems(regId);
    isLoginLoading = false;
    if (itemsResponse!.success) {

    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: itemsResponse!.message!,
      ));
    }
    notifyListeners();
  }
}
