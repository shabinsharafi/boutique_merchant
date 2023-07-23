import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/itemsApi.dart';
import 'package:boutique_merchant/api/userApi.dart';
import 'package:boutique_merchant/models/AddItemFilter.dart';
import 'package:boutique_merchant/models/category.dart';
import 'package:boutique_merchant/models/itemColor.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/ui/authScreen/verify_otp_screen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/general/commonAlertDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/masterOption.dart';

class AddItemProvider with ChangeNotifier {
  ApiResponse<Item>? addItemResponse;
  ApiResponse<AddItemFilter>? addItemsFilterResponse;
  bool isLoginLoading = false;
  bool isAddItemFilterLoading = false;
  bool isVerifyOtpLoading = false;

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var mrpController = TextEditingController();
  var priceController = TextEditingController();
  Category? category;
  MasterOption? materialType;
  List<ItemColor> colors=[];
  List<Category> occasions=[];
  MasterOption? itemStatus;

  var addItemFormKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  void clear(){
    nameController.clear();
    descriptionController.clear();
    mrpController.clear();
    priceController.clear();
    materialType = null;
    category = null;
    itemStatus = null;
    colors = [];
    occasions =  [];
  }
  void addItem() async {
    if (!addItemFormKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      return;
    }
    isLoginLoading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("boutiqueId");
    });

    Map<String,dynamic> req={
      "colors": colors.map((e) => e.id).toList(),
      "occasions": occasions.map((e) => e.id).toList(),
      "item": {
        "name": nameController.text,
        "description": descriptionController.text,
        "mrp": double.parse(mrpController.text),
        "price": double.parse(priceController.text),
        "materialTypeId": materialType?.id,
        "itemStatusId": itemStatus!.id,
        "merchantId": regId,
        "categoryId": category!.id
      }
    };

    addItemResponse = await ItemsApi.getInstance().addItem(req);
    isLoginLoading = false;
    if (addItemResponse!.success) {
      NavigationService.close();
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: "Item added successfully",
      ));
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: addItemResponse!.message!,
      ));
    }
    notifyListeners();
  }

  void updateItem(id) async {
    if (!addItemFormKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      return;
    }
    isLoginLoading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("boutiqueId");
    });

    Map<String,dynamic> req={
      "colors": colors.map((e) => e.id).toList(),
      "occasions": occasions.map((e) => e.id).toList(),
      "item": {
        "name": nameController.text,
        "description": descriptionController.text,
        "mrp": double.parse(mrpController.text),
        "price": double.parse(priceController.text),
        "materialTypeId": materialType?.id,
        "itemStatusId": itemStatus!.id,
        "merchantId": regId,
        "categoryId": category!.id
      }
    };

    addItemResponse = await ItemsApi.getInstance().updateItem(req,id);
    isLoginLoading = false;
    if (addItemResponse!.success) {
      NavigationService.close();
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: "Item updated successfully",
      ));
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: addItemResponse!.message!,
      ));
    }
    notifyListeners();
  }

  void getAddItemsFilter({isEdit=false,Item? item}) async {
    isAddItemFilterLoading = true;
    notifyListeners();
    addItemsFilterResponse = await ItemsApi.getInstance().getAddItemsFilter();
    isAddItemFilterLoading = false;
    if (addItemsFilterResponse!.success) {
      if(isEdit) {
        materialType = item!.materialType;
        category = item.category;
        itemStatus = item.itemStatus;
        colors = item.colors ?? [];
        occasions = item.occasions ?? [];
      }
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
