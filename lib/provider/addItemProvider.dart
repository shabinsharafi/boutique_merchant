import 'dart:async';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/itemsApi.dart';
import 'package:boutique_merchant/models/merchant.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/ui/authScreen/loginScreen.dart';
import 'package:boutique_merchant/ui/authScreen/verify_otp_screen.dart';
import 'package:boutique_merchant/ui/home/mainHomeScreen.dart';
import 'package:boutique_merchant/ui/registration/userRegistrationVM.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/customDialog.dart';
import 'package:boutique_merchant/widgets/general/commonAlertDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:boutique_merchant/api/userApi.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddItemProvider with ChangeNotifier {
  ApiResponse? loginResponse;
  ApiResponse? verifyOtpResponse;
  ApiResponse? addItemsFilterResponse;
  bool isLoginLoading = false;
  bool isAddItemFilterLoading = false;
  bool isVerifyOtpLoading = false;

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var category;
  var materialType;
  var color;
  var itemStatus;

  var addItemFormKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  void addItem() async {
    if (!addItemFormKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      return;
    }
    isLoginLoading = true;
    notifyListeners();
    Map<String, String> req = {};
    req.putIfAbsent("name", () => nameController.text);
    loginResponse = await UserApi.getInstance().login(req);
    isLoginLoading = false;
    if (loginResponse!.success) {
      NavigationService.changeScreen(VerifyOtpScreen());
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: loginResponse!.message!,
      ));
    }
    notifyListeners();
  }

  void getAddItemsFilter() async {
    isAddItemFilterLoading = true;
    notifyListeners();
    addItemsFilterResponse = await ItemsApi.getInstance().getAddItemsFilter();
    isAddItemFilterLoading = false;
    if (addItemsFilterResponse!.success) {

    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: addItemsFilterResponse!.message!,
      ));
    }
    notifyListeners();
  }

  void getUserDetails() async {
    isVerifyOtpLoading = true;
    notifyListeners();
    Map<String, String> req = {};
    addItemsFilterResponse = await UserApi.getInstance().getUserDetails();
    isVerifyOtpLoading = false;
    if (addItemsFilterResponse!.success) {
      Provider.of<UserDataProvider>(
              NavigationService.navigatorKey.currentContext!,
              listen: false)
          // .user = UserModel.fromJson(verifyOtpResponse!.data);
          .user = UserModel.fromJson(addItemsFilterResponse!.data['user']);
      Provider.of<UserDataProvider>(
                  NavigationService.navigatorKey.currentContext!,
                  listen: false)
              // .user = UserModel.fromJson(verifyOtpResponse!.data);
              .user
              .merchant =
          Merchant.fromJson(addItemsFilterResponse!.data['merchant']);
      NavigationService.changeScreenRemoveOther(MainHomeScreen());
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: addItemsFilterResponse!.message!,
      ));
    }
    notifyListeners();
  }
}
/*
PopupPropsMultiSelection.dialog(
validationWidgetBuilder: (ctx, selectedItems) {
return Container(
color: Colors.blue[200],
height: 56,
child: Align(
alignment: Alignment.center,
child: MaterialButton(
child: Text('OK'),
onPressed: () {
_popupCustomValidationKey.currentState
    ?.popupOnValidate();
},
),
),
);
},
),*/
