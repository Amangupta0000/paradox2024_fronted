import 'package:dio/dio.dart';


class DioService {
  final String baseUrl = 'http://localhost:3001/api/v1/auth/signup';
   // get api method
    Future<dynamic> get(String apiName) async {
    try {
      Dio dio = Dio(
        BaseOptions(
          responseType: ResponseType.json,
          headers: {
            'Content-Type': 'application/json',
            // 'Authorization': 'Bearer $token',
          },
        ),
      );
      return await dio.get(baseUrl + apiName).then((response) {
        return response;
      });
    } catch (e) {
      
      print(e);
    }
  }
   // post api method
  Future<dynamic> post(String apiName, data) async {
    try {
      Dio dio = Dio(BaseOptions(
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
        },
      ));
      return await dio.post(baseUrl + apiName, data: data).then((response) {
        return response;
      });
    } catch (e) {
      print(e);
    }
  }
}
