class ApiResponse<T>{
  T? data;
  T? errorData;
  bool haserror = false;
  String? errormessage;

  ApiResponse({ this.data,this.haserror=false, this.errormessage, this.errorData});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    errorData: json["errors"] == null ? null : json["errors"],
    data: json["message"] == null ? null : json["message"],
    errormessage: json["type"] == null ? null : json["type"],
  );
}