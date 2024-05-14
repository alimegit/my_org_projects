
class NetworkResponse {
  dynamic data;
  String errorText;
  NetworkResponse({this.data, this.errorText = ''});
  bool get success => errorText == null;

  factory NetworkResponse.success(dynamic data) {
    return NetworkResponse(data: data);
  }

  factory NetworkResponse.error(String errorText) {
    return NetworkResponse(errorText: errorText);
  }
}
