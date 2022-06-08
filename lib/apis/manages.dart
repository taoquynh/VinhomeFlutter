import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vinhome/models/result.dart';

import 'method.dart';
import 'names.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() {
    return _instance;
  }

  ApiManager._internal();

  Map<String, dynamic> getHeaders() {
    const token = '';
    return {"Authorization": 'Bearer $token'};
  }

  Future<void> request(
      String path,
      Method method,
      dynamic parameters,
      Function(dynamic) onSuccess,
      Function(String) onFailure,
      Function(dynamic) onErrorHttp) async {
    final url = ApiName().returnUrl(path);

    try {
      Response response;
      var dio = Dio();

      switch (method) {
        case Method.get:
          response = await dio.get(url,
              options: Options(headers: ApiManager().getHeaders()));
          break;
        case Method.post:
          response = await dio.post(url,
              data: parameters,
              options: Options(headers: ApiManager().getHeaders()));
          break;
        case Method.put:
          response = await dio.put(url,
              data: parameters,
              options: Options(headers: ApiManager().getHeaders()));
          break;
        case Method.delete:
          response = await dio.delete(url,
              data: parameters,
              options: Options(headers: ApiManager().getHeaders()));
          break;
        default:
          response = await dio.get(url,
              options: Options(headers: ApiManager().getHeaders()));
          break;
      }

      final statusCode = response.statusCode ?? 0;
      if (statusCode >= 200 && statusCode < 300) {
        final dataRes = Result.fromJSON(jsonDecode(response.toString()));
        if (dataRes.code == 0) {
          onSuccess(dataRes.data);
        } else {
          onFailure(dataRes.message);
        }
      }
    } on DioError catch (e) {
      onErrorHttp(e.message);
    } catch (e) {
      onErrorHttp(e);
    }
  }
}
