import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/itemsApi.dart';
import 'package:boutique_merchant/api/userApi.dart';
import 'package:boutique_merchant/models/AddItemFilter.dart';
import 'package:boutique_merchant/models/category.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/ui/authScreen/verify_otp_screen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/general/commonAlertDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddItemProvider with ChangeNotifier {
  ApiResponse? loginResponse;
  ApiResponse? verifyOtpResponse;
  ApiResponse<AddItemFilter>? addItemsFilterResponse;
  bool isLoginLoading = false;
  bool isAddItemFilterLoading = false;
  bool isVerifyOtpLoading = false;

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  Category? category;
  Category? materialType;
  List<Category> colors=[];
  Category? itemStatus;

  var addItemFormKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  void addItem() async {
    if (!addItemFormKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      return;
    }
    isLoginLoading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("id");
    });

    Map<String,dynamic> req={
      "name": nameController.text,
      "description": descriptionController.text,
      "colors": [
        "string"
      ],
      "materialTypeId": materialType?.id,
      "occasionId": materialType?.id,
      "itemStatusId": itemStatus!.id,
      "merchantId": regId,
      "categoryId": category!.id
    };

    loginResponse = await ItemsApi.getInstance().addItem(req);
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
