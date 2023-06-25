import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/userApi.dart';
import 'package:boutique_merchant/ui/authScreen/verify_otp_screen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/general/commonAlertDialogBox.dart';
import 'package:flutter/cupertino.dart';

class BoutiqueProvider with ChangeNotifier {
  ApiResponse? loginResponse;
  ApiResponse? verifyOtpResponse;
  ApiResponse? getDetailsResponse;
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
    Map<String, String> req = {};
    req.putIfAbsent("name", () => nameController.text);
    req.putIfAbsent("phone", () => phoneNumberController.text);
    req.putIfAbsent("email", () => emailController.text);
    req.putIfAbsent("ownerId", () => "ownerId");
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
}
