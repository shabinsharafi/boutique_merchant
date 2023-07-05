import '../models/baseModel.dart';

typedef ItemCreator<S> = S Function();

class ApiResponse<T extends BaseModel>{
  T? data;
  ApiError? error;
  bool success = true;
  String? message;
  String? type;

  late ItemCreator<T> creator;

  ApiResponse({ this.data,this.success=false, this.message, this.error, this.type});

  factory ApiResponse.fromJson(Map<String, dynamic> json,ItemCreator<T> creator) {
    T t=creator();
    var resp=ApiResponse<T>(
      success: json["success"] ?? false,
      error: json["error"] == null ? null : ApiError.fromJson(json["error"]),
      data: json["data"]!=null?t.fromJson(json["data"]) : null,
      message: json["message"],
      type: json["type"],
    );
    if(resp.message==null&&resp.error!=null) {
      resp.message=resp.error?.message;
    }
    return  resp;
  }

  @override
  String toString() {
    return 'ApiResponse{data: $data, errorData: $error, success: $success, message: $message, type: $type}';
  }
}

class ApiError {
  int? statusCode;
  String? message;

  ApiError({
    this.statusCode,
    this.message,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
    statusCode: json["statusCode"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
  };
}
