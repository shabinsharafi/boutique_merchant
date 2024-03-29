import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/itemsApi.dart';
import 'package:boutique_merchant/api/userApi.dart';
import 'package:boutique_merchant/models/ListResponse.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/review.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/ui/authScreen/verify_otp_screen.dart';
import 'package:boutique_merchant/provider/userProvider.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/general/commonAlertDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../api/boutiqueApi.dart';

class ItemsProvider with ChangeNotifier {
  ApiResponse? addItemResponse;
  ApiResponse<ListResponse<Item>>? itemsResponse;
  ApiResponse<Item>? itemDetailsResponse;
  bool isItemLoading = false;
  bool isVerifyOtpLoading = false;
  ApiResponse<ListResponse<Review>>? reviewsResponse;
  bool isReviewsLoading = false;

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;


  Future<void> getItems() async {
    isItemLoading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("boutiqueId");
    });
    itemsResponse = await ItemsApi.getInstance().getItems(regId);
    isItemLoading = false;
    if (itemsResponse!.success) {

    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: itemsResponse!.message!,
      ));
    }
    notifyListeners();
    return;
  }

  Future<void> getItemDetails(itemId) async {
    isItemLoading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("boutiqueId");
    });
    itemDetailsResponse = await ItemsApi.getInstance().getItemDetails(itemId);
    isItemLoading = false;
    if (itemDetailsResponse!.success) {

    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: itemDetailsResponse!.message!,
      ));
    }
    notifyListeners();
    return;
  }

  void getReviews(itemId) async {
    isReviewsLoading = true;
    notifyListeners();
    reviewsResponse = await ItemsApi.getInstance().getReviews(itemId);
    isReviewsLoading = false;
    if (reviewsResponse!.success) {
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: reviewsResponse!.message!,
      ));
    }
    notifyListeners();
  }
}
