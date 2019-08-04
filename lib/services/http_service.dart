import 'package:dio/dio.dart';
import 'package:reel_nepal/configurations/app_configuration.dart';
import 'package:reel_nepal/models/api_response/api_response.dart';

class HttpService {
  Future<dynamic> fetch(String path) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get(AppConfiguration.API_BASE_URL + path);
      return ApiResponse.fromJson(response.data).result;
    } on DioError catch (e) {
      print(e.message);
      print(ApiResponse.fromJson(response.data).errorMessage);
    }
  }
}
