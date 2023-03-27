import 'dart:convert';
import 'dart:math';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/models/userModel.dart';
import 'package:boutique_merchant/ui/authScreen/loginScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:flutter/cupertino.dart';
import 'package:boutique_merchant/api/remote_config_service.dart';
import 'package:boutique_merchant/api/userApi.dart';

class UserDataProvider with ChangeNotifier {
  late ApiResponse userResponse;
  late UserModel user;

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
