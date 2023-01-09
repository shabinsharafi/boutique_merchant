import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/logger.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

const timeoutDuration = Duration(seconds: 20);
class HttpHandler {
  static Future<ApiResponse> getRequest(String url) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      Logger.log("get url", url);
      Response response = await get(Uri.parse(url)).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        apiResponse.data = json.decode(response.body);
      } else {
        apiResponse.success = false;
        apiResponse.message = jsonDecode(response.body);
      }
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static Future<ApiResponse> postRequest(String url, Map req) async {
    // set up POST request arguments
    ApiResponse apiResponse = new ApiResponse();
    try {
      Logger.log("post url", url);
      Logger.log("post req", req.toString());
      Map<String, String> headers = {"Content-type": "application/json"};
      Response response = await post(Uri.parse(url),
          headers: headers, body: getJsonString(req)).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      apiResponse=ApiResponse.fromJson(json.decode(body));
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static Future<ApiResponse> putRequest(String url, Map req) async {
    // set up POST request arguments
    ApiResponse apiResponse = new ApiResponse();
    try {
      Logger.log("put url", url);
      Logger.log("put req", req.toString());
      Map<String, String> headers = {"Content-type": "application/json"};
      Response response =
      await put(Uri.parse(url), headers: headers, body: getJsonString(req)).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        final result = jsonDecode(response.body);
        if (true) {
          apiResponse.success = true;
          apiResponse.data = json.decode(response.body);
        } else {
          apiResponse.success = false;
          apiResponse.errorData = jsonDecode(response.body);
        }
      } else {
        apiResponse.success = false;
        apiResponse.message = response.body;
      }
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static getRequestToken(String url) async {
    ApiResponse apiResponse = new ApiResponse();
    try {
      Logger.log("get url token", url);
      late String token;
      /*await DBProvider.db.getUser().then((user) {
      token = user.token;
      Logger.log("token", token);
    });*/
      await SharedPreferences.getInstance().then((prefs) {
        token = prefs.getString("token")!;
        Logger.log("token", token);
      });
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token
      };
      Response response = await get(Uri.parse(url), headers: headers).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);

      apiResponse=ApiResponse.fromJson(json.decode(body));
      /*if (response.statusCode == 401) {
        NavigationService.navigateToLogin();
        return;
      } else {
        apiResponse.success = false;
        apiResponse.message = response.body;
      }*/
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static postRequestToken(String url, var req) async {
    ApiResponse apiResponse = new ApiResponse();
    try {
      // set up POST request arguments
      Logger.log("post url token", url);
      Logger.log("post req", req.toString());
      late String token;
      await SharedPreferences.getInstance().then((prefs) {
        token = prefs.getString("token")!;
        Logger.log("token", token);
      });
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token
      };
      Response response = await post(Uri.parse(url),
          headers: headers, body: getJsonString(req)).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        final result = jsonDecode(response.body);
        if (true) {
          apiResponse.success = true;
          apiResponse.data = json.decode(response.body);
        } else {
          apiResponse.success = false;
          apiResponse.errorData = jsonDecode(response.body);
        }
      } else if (response.statusCode == 401) {
        NavigationService.navigateToLogin();
        return;
      } else {
        apiResponse.success = false;
        apiResponse.message = response.body;
      }
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static putRequestToken(String url, Map req) async {
    ApiResponse apiResponse = new ApiResponse();
    try {
      // set up POST request arguments
      Logger.log("put url token", url);
      Logger.log("put req", req.toString());
      late String token;
      await SharedPreferences.getInstance().then((prefs) {
        token = prefs.getString("token")!;
        Logger.log("token", token);
      });
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token
      };
      Response response =
      await put(Uri.parse(url), headers: headers, body: getJsonString(req)).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        final result = jsonDecode(response.body);
        if (true) {
          apiResponse.success = true;
          apiResponse.data = json.decode(response.body);
        } else {
          apiResponse.success = false;
          apiResponse.errorData = jsonDecode(response.body);
        }
      } else if (response.statusCode == 401) {
        NavigationService.navigateToLogin();
        return;
      } else {
        apiResponse.success = false;
        apiResponse.message = response.body;
      }
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static patchRequestToken(String url, var req) async {
    ApiResponse apiResponse = new ApiResponse();
    try {
      // set up POST request arguments
      Logger.log("patch url token", url);
      Logger.log("patch req", req.toString());
      late String token;
      await SharedPreferences.getInstance().then((prefs) {
        token = prefs.getString("token")!;
        Logger.log("token", token);
      });
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token
      };
      Response response = await patch(Uri.parse(url),
          headers: headers, body: getJsonString(req)).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        final result = jsonDecode(response.body);
        if (true) {
          apiResponse.success = true;
          apiResponse.data = json.decode(response.body);
        } else {
          apiResponse.success = false;
          apiResponse.errorData = jsonDecode(response.body);
        }
      } else if (response.statusCode == 401) {
        NavigationService.navigateToLogin();
        return;
      } else {
        apiResponse.success = false;
        apiResponse.message = response.body;
      }
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static String getJsonString(var req) {
    var jsonReq = json.encode(req);
    Logger.log("json", jsonReq);
    return jsonReq.toString();
  }

  static Future<ApiResponse> deleteRequest(String url) async {
    ApiResponse apiResponse = new ApiResponse();
    try {
      Logger.log("delete url", url);
      Response response = await delete(Uri.parse(url)).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        final result = jsonDecode(response.body);
        if (true) {
          apiResponse.success = true;
          apiResponse.data = json.decode(response.body);
        } else {
          apiResponse.success = false;
          apiResponse.errorData = jsonDecode(response.body);
        }
      } else {
        apiResponse.success = false;
        apiResponse.message = response.body;
      }
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static deleteRequestToken(String url, {dynamic req}) async {
    ApiResponse apiResponse = new ApiResponse();
    try {
      Logger.log("delete url token", url);
      late String token;
      await SharedPreferences.getInstance().then((prefs) {
        token = prefs.getString("token")!;
        Logger.log("token", token);
      });
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token
      };
      Response response = await delete(Uri.parse(url), headers: headers,body: req).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        final result = jsonDecode(response.body);
        if (true) {
          apiResponse.success = true;
          apiResponse.data = json.decode(response.body);
        } else {
          apiResponse.success = false;
          apiResponse.errorData = jsonDecode(response.body);
        }
      } else if (response.statusCode == 401) {
        NavigationService.navigateToLogin();
        return;
      } else {
        apiResponse.success = false;
        apiResponse.message = response.body;
      }
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static Future<ApiResponse> uploadImage(String url, dynamic body,
      {String method = "POST", Map<String,String>? fields, bool multipleFiles = false}) async {
    ApiResponse apiResponse = new ApiResponse();
    try {
      Logger.log("upload url", url);

      late String token;
      await SharedPreferences.getInstance().then((prefs) {
        token = prefs.getString("token")!;
      });
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token
      };

      var request = MultipartRequest(
        method,
        Uri.parse(url),
      );
      request.headers.addAll(headers);
      if (fields != null) request.fields.addAll(fields);
      if(multipleFiles){
        request.files.addAll(body);
      }else{
        request.files.add(body);
      }

      StreamedResponse response = await request.send().timeout(timeoutDuration);
      final respStr = await response.stream.bytesToString();
      var result = jsonDecode(respStr);

      Logger.log("response", response.statusCode.toString());
      Logger.log("response", result.toString());
      Logger.log("response", response.stream.toString());
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        apiResponse.success = true;
        apiResponse.data = result;
        if (true) {
          apiResponse.success = true;
        } else {
          apiResponse.success = false;
          apiResponse.errorData = result;
        }
      } else {
        apiResponse.success = false;
        apiResponse.message = result;
      }
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }
}