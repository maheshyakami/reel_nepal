class ApiResponse {
  String version;
  int statusCode;
  dynamic result;
  String errorMessage;

  ApiResponse({this.version, this.statusCode, this.result, this.errorMessage});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    statusCode = json['statusCode'];
    result = json['result'];
    errorMessage = json['errorMessage'];
  }
}
