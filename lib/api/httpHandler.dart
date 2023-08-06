import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/logger.dart';
import 'package:boutique_merchant/models/baseModel.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

const timeoutDuration = Duration(seconds: 20);
class HttpHandler {
  static Future<ApiResponse<T>> getRequest<T extends BaseModel>(String url,ItemCreator<T> creator) async {
    ApiResponse<T> apiResponse = ApiResponse();
    try {
      Logger.log("get url", url);
      Response response = await get(Uri.parse(url)).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      apiResponse=ApiResponse<T>.fromJson(json.decode(body),creator);
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static Future<ApiResponse<T>> postRequest<T extends BaseModel>(String url, Map req,ItemCreator<T> creator) async {
    // set up POST request arguments
    ApiResponse<T> apiResponse = ApiResponse<T>();
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
      apiResponse=ApiResponse.fromJson(json.decode(body),creator);
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static Future<ApiResponse<T>> putRequest<T extends BaseModel>(String url, Map req,ItemCreator<T> creator) async {
    // set up POST request arguments
    ApiResponse<T> apiResponse = new ApiResponse();
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
      apiResponse=ApiResponse.fromJson(json.decode(body),creator);
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static getRequestToken<T extends BaseModel>(String url,ItemCreator<T> creator) async {
    ApiResponse<T> apiResponse = new ApiResponse<T>();
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

      apiResponse=ApiResponse.fromJson(json.decode(body),creator);
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

  static postRequestToken<T extends BaseModel>(String url, var req,ItemCreator<T> creator) async {
    ApiResponse<T> apiResponse = new ApiResponse<T>();
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
      apiResponse=ApiResponse.fromJson(json.decode(body),creator);
    } on TimeoutException {
      return ApiResponse(success: false, message: 'Timeout');
    } on SocketException {
      return ApiResponse(success: false, message: 'Seems you have problem connecting to the network.');
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
    return apiResponse;
  }

  static putRequestToken<T extends BaseModel>(String url, Map req,ItemCreator<T> creator) async {
    ApiResponse<T> apiResponse = new ApiResponse<T>();
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
        apiResponse = ApiResponse.fromJson(json.decode(response.body),creator);

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

  static patchRequestToken<T extends BaseModel>(String url, var req,ItemCreator<T> creator) async {
    ApiResponse<T> apiResponse = new ApiResponse<T>();
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

        apiResponse = ApiResponse.fromJson(json.decode(response.body),creator);
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

  static Future<ApiResponse<T>> deleteRequest<T extends BaseModel>(String url,ItemCreator<T> creator) async {
    ApiResponse<T> apiResponse = new ApiResponse();
    try {
      Logger.log("delete url", url);
      Response response = await delete(Uri.parse(url)).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      if (response.statusCode >= 200 && response.statusCode <= 250) {

        apiResponse = ApiResponse.fromJson(json.decode(response.body),creator);
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

  static deleteRequestToken<T extends BaseModel>(String url,ItemCreator<T> creator, {dynamic req}) async {
    ApiResponse<T> apiResponse = new ApiResponse();
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

        apiResponse = ApiResponse.fromJson(json.decode(response.body),creator);
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

  static Future<ApiResponse<T>> uploadImage<T extends BaseModel>(String url, dynamic body,ItemCreator<T> creator,
      {String method = "POST", Map<String,String>? fields, bool multipleFiles = false}) async {
    ApiResponse<T> apiResponse = new ApiResponse<T>();
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
      apiResponse = ApiResponse.fromJson(result, creator);
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        apiResponse.success = true;
        if (true) {
          apiResponse.success = true;
        } else {
          apiResponse.success = false;
          apiResponse.error = result;
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
