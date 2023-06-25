abstract class Response<T> {
  T fromJson(Map<String, dynamic>? json, int? type);
}
