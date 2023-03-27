class ApiResponse<T>{
  T? data;
  T? errorData;
  bool success = true;
  String? message;
  String? type;

  ApiResponse({ this.data,this.success=false, this.message, this.errorData, this.type});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    success: json["success"] ?? true,
    errorData: json["errors"] ?? null,
    //data: T.runtimeTypejson["data"] ?? null,
    message: json["message"] ?? null,
    type: json["type"] ?? null,
  );

  @override
  String toString() {
    return 'ApiResponse{data: $data, errorData: $errorData, success: $success, message: $message, type: $type}';
  }
}