import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/models/merchant.dart';
import 'package:boutique_merchant/provider/userProvider.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/general/commonAlertDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/boutiqueApi.dart';

class BoutiqueProvider with ChangeNotifier {
  ApiResponse<Merchant>? boutiqueResponse;
  bool isLoginLoading = false;
  bool isVerifyOtpLoading = false;

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  void addBoutique() async {
    if (!formKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      return;
    }
    isLoginLoading = true;
    notifyListeners();
    var regId;
    await SharedPreferences.getInstance().then((value) {
      regId = value.getString("id");
    });
    Map<String, String> req = {};
    req.putIfAbsent("name", () => nameController.text);
    req.putIfAbsent("phone", () => phoneNumberController.text);
    req.putIfAbsent("email", () => emailController.text);
    req.putIfAbsent("ownerId", () => regId);
    boutiqueResponse = await BoutiqueApi.getInstance().addBoutique(req);
    isLoginLoading = false;
    if (boutiqueResponse!.success) {
      Provider.of<UserProvider>(
          NavigationService.navigatorKey.currentContext!,
          listen: false)
      // .user = UserModel.fromJson(verifyOtpResponse!.data);
          .user
          .merchant=boutiqueResponse!.data;
      NavigationService.close();
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: boutiqueResponse!.message!,
      ));
    }
    notifyListeners();
  }
}
