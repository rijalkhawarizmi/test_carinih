import 'package:dio/dio.dart';

class ApiServices {
  Response? _response;
  Dio _dio = Dio();
  Future<Response> getUsers() async {
    var endPoint =
        'https://randomuser.me/api/';

    try {
      _response = await _dio.get(endPoint);
      
      return _response!;
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return e.response!;
      } else {
        throw e;
      }
    }
  }
}
