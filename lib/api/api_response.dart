import '../models/baseModel.dart';

typedef S ItemCreator<S>();

class ApiResponse<T extends BaseModel>{
  T? data;
  T? errorData;
  bool success = true;
  String? message;
  String? type;

  late ItemCreator<T> creator;

  ApiResponse({ this.data,this.success=false, this.message, this.errorData, this.type});

  factory ApiResponse.fromJson(Map<String, dynamic> json,ItemCreator<T> creator) {
    T t=creator();
    print(json["data"]);
    return ApiResponse<T>(
    success: json["success"] ?? false,
    errorData: json["errors"] ?? null,
    data: json["data"]!=null?t.fromJson(json["data"]) : null,
    message: json["message"] ?? null,
    type: json["type"] ?? null,
  );
  }

  @override
  String toString() {
    return 'ApiResponse{data: $data, errorData: $errorData, success: $success, message: $message, type: $type}';
  }
}