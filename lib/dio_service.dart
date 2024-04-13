import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paradox_2024/local_data.dart';

class DioService {
  final String baseUrl = 'http://64.227.148.84/api/v1/';
  // get api method
  Future<dynamic> get(String apiName) async {
    String? token = await SharedData().getToken();
    try {
      Dio dio = Dio(
        BaseOptions(
          responseType: ResponseType.json,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
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
    String? token = await SharedData().getToken();
    try {
      Dio dio = Dio(BaseOptions(
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
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
