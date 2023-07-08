import 'dart:async';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/api/userApi.dart';
import 'package:boutique_merchant/models/LoginResponse.dart';
import 'package:boutique_merchant/models/merchant.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/ui/authScreen/loginScreen.dart';
import 'package:boutique_merchant/ui/authScreen/verify_otp_screen.dart';
import 'package:boutique_merchant/ui/home/mainHomeScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/general/commonAlertDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/registration/userRegistrationVM.dart';


class AuthenticationProvider with ChangeNotifier {
  ApiResponse? loginResponse;
  ApiResponse<LoginResponse>? verifyOtpResponse;
  ApiResponse<LoginResponse>? getDetailsResponse;
  bool isLoginLoading = false;
  bool isVerifyOtpLoading = false;

  var phoneNumberController = TextEditingController();
  var otpController = OtpFieldController();
  var otp = '';

  var mobileFormKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  void login() async {
    if (!mobileFormKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      return;
    }
    isLoginLoading = true;
    notifyListeners();
    Map<String, String> req = {};
    req.putIfAbsent("username", () => "+91" + phoneNumberController.text);
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

  void verifyOtp() async {
    if (!mobileFormKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      return;
    }
    isVerifyOtpLoading = true;
    notifyListeners();
    Map<String, String> req = {};
    req.putIfAbsent("username", () => "+91" + phoneNumberController.text);
    req.putIfAbsent("otp", () => otp);
    verifyOtpResponse = await UserApi.getInstance().verifyOtp(req);
    isVerifyOtpLoading = false;
    if (verifyOtpResponse!.success) {
      SharedPreferences.getInstance().then((value) {
        value.setString("token", verifyOtpResponse!.data!.token!);
        value.setString("id", verifyOtpResponse!.data!.user!.id!);
        if(verifyOtpResponse!.data?.merchant!=null) {
          value.setString("boutiqueId", verifyOtpResponse!.data!.merchant!.id!);
        }
      });
      Provider.of<UserDataProvider>(
              NavigationService.navigatorKey.currentContext!,
              listen: false)
          .user = verifyOtpResponse!.data!.user!;
      Provider.of<UserDataProvider>(
              NavigationService.navigatorKey.currentContext!,
              listen: false)
          // .user = UserModel.fromJson(verifyOtpResponse!.data);
          .user
          .merchant = verifyOtpResponse!.data?.merchant;
      NavigationService.changeScreenRemoveOther(MainHomeScreen());
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: verifyOtpResponse!.message!,
      ));
    }
    notifyListeners();
  }

  void getUserDetails() async {
    isVerifyOtpLoading = true;
    notifyListeners();
    Map<String, String> req = {};
    getDetailsResponse = await UserApi.getInstance().getUserDetails();
    isVerifyOtpLoading = false;
    if (getDetailsResponse!.success) {
      /*SharedPreferences.getInstance().then((value) {
        value.setString("token", verifyOtpResponse!.data['token']);
      });*/
      Provider.of<UserDataProvider>(
          NavigationService.navigatorKey.currentContext!,
          listen: false)
          .user = getDetailsResponse!.data!.user!;
      Provider.of<UserDataProvider>(
          NavigationService.navigatorKey.currentContext!,
          listen: false)
      // .user = UserModel.fromJson(verifyOtpResponse!.data);
          .user
          .merchant = getDetailsResponse!.data?.merchant;
      NavigationService.changeScreenRemoveOther(MainHomeScreen());
    } else {
      NavigationService.showAlertDialog(AlertMessageDialog(
        message: getDetailsResponse!.message!,
      ));
    }
    notifyListeners();
  }

  void init() {
    SharedPreferences.getInstance().then((value) {
      String? token = value.getString("token");
      if (token != null) {
        getUserDetails();
      } else {
        Timer(Duration(seconds: 1), () {
          NavigationService.changeScreenRemoveOther(LoginScreen());
        });
      }
    });
  }
}
