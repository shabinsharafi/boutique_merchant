import 'dart:io';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/models/merchant.dart';
import 'package:boutique_merchant/provider/userProvider.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/general/commonAlertDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/boutiqueApi.dart';
import '../models/boutqueDash.dart';

class BoutiqueProvider with ChangeNotifier {
  ApiResponse<Merchant>? boutiqueResponse;
  ApiResponse<BoutiqueDash>? boutiqueDashResponse;
  bool isBoutiqueCreateLoading = false;
  bool isDashLoading = false;
  bool isImageUploading = false;

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  File? image;
  String? imageUrl;

  void addBoutique() async {
    if (!formKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      return;
    }
    isBoutiqueCreateLoading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("id");
    });
    Map<String, String> req = {};
    req.putIfAbsent("name", () => nameController.text);
    req.putIfAbsent("phone", () => phoneNumberController.text);
    req.putIfAbsent("email", () => emailController.text);
    req.putIfAbsent("image", () => imageUrl??"");
    req.putIfAbsent("ownerId", () => regId);
    boutiqueResponse = await BoutiqueApi.getInstance().addBoutique(req);
    isBoutiqueCreateLoading = false;
    if (boutiqueResponse!.success) {
      Provider.of<UserProvider>(NavigationService.navigatorKey.currentContext!,
              listen: false)
          // .user = UserModel.fromJson(verifyOtpResponse!.data);
          .user
          .merchant = boutiqueResponse!.data;
      NavigationService.close();
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: boutiqueResponse!.message!,
      ));
    }
    notifyListeners();
  }

  void updateBoutique() async {
    if (!formKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      return;
    }
    isBoutiqueCreateLoading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("boutiqueId");
    });
    Map<String, String> req = {};
    req.putIfAbsent("name", () => nameController.text);
    req.putIfAbsent("phone", () => phoneNumberController.text);
    req.putIfAbsent("email", () => emailController.text);
    boutiqueResponse =
        await BoutiqueApi.getInstance().updateBoutique(req, regId);
    isBoutiqueCreateLoading = false;
    if (boutiqueResponse!.success) {
      Provider.of<UserProvider>(NavigationService.navigatorKey.currentContext!,
              listen: false)
          // .user = UserModel.fromJson(verifyOtpResponse!.data);
          .user
          .merchant = boutiqueResponse!.data;
      NavigationService.close();
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: boutiqueResponse!.message!,
      ));
    }
    notifyListeners();
  }

  Future<void> getBoutiqueDash() async {
    isDashLoading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("boutiqueId");
    });
    boutiqueDashResponse =
        await BoutiqueApi.getInstance().getBoutiqueDash( regId);
    isDashLoading = false;
    if (boutiqueDashResponse!.success) {

    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: boutiqueDashResponse!.message!,
      ));
    }
    notifyListeners();
    return;
  }

  void uploadImage() async {
    isImageUploading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("boutiqueId");
    });
    ApiResponse<Merchant> imageUploadResponse =
        await BoutiqueApi.getInstance().uploadImage(regId, image?.path);
    isImageUploading = false;
    if (imageUploadResponse.success) {
      if (Provider.of<UserProvider>(
                  NavigationService.navigatorKey.currentContext!,
                  listen: false)
              // .user = UserModel.fromJson(verifyOtpResponse!.data);
              .user
              .merchant ==
          null) {
        imageUrl = imageUploadResponse.data!.image;
      } else {
        Provider.of<UserProvider>(
                NavigationService.navigatorKey.currentContext!,
                listen: false)
            // .user = UserModel.fromJson(verifyOtpResponse!.data);
            .user
            .merchant
            ?.image = imageUploadResponse.data!.image;
        image=null;
      }
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: imageUploadResponse.message ?? "",
      ));
    }
    notifyListeners();
  }
}
