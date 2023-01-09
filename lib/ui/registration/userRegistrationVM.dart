import 'dart:convert';
import 'dart:math';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/ui/authScreen/loginScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:boutique_merchant/api/remote_config_service.dart';
import 'package:boutique_merchant/api/userApi.dart';

class UserDataViewModel with ChangeNotifier {
  late ApiResponse userResponse;
  late UserModel user;

  Future<ApiResponse> saveDetails(Map<String, dynamic> request) async {
    print(FirebaseAuth.instance.currentUser);
    //FirebaseAuth.instance.currentUser!.updateEmail(request['email']);
    final credential = EmailAuthProvider.credential(
        email: request['email'], password: UniqueKey().toString());
    try {
      final userCredential = await FirebaseAuth.instance.currentUser
          ?.linkWithCredential(credential)
          .whenComplete(() => print("complete"));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          print("The provider has already been linked to the user.");
          break;
        case "invalid-credential":
          print("The provider's credential is not valid.");
          break;
        case "credential-already-in-use":
          print("The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User.");
          break;
        default:
          print(e.message);
          NavigationService.changeScreenRemoveOther(LoginScreen());
      }
    }
    ApiResponse dataResponse = await UserApi.getInstance().saveProfile(request);
    userResponse = dataResponse;
    return dataResponse;
  }

  Future<ApiResponse> getProfile() async {
    ApiResponse dataResponse = await UserApi.getInstance().getProfile();
    userResponse = dataResponse;
    user = dataResponse.data;
    return dataResponse;
  }

/*void getPetColors() async {
    RemoteConfigService _remoteConfigService =
        await RemoteConfigService.getInstance();
    await _remoteConfigService.setupRemoteConfig();
     petColors = json.decode(_remoteConfigService.getPetColors);
  }*/
}
