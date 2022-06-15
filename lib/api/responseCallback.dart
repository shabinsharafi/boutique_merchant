class ResponseListener {
  void Function(Object) onSuccess;
  void Function(String) onFailure;

  ResponseListener({required this.onSuccess, required this.onFailure});
}
